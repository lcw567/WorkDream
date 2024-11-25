package com.cs.workdream.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;
import com.cs.workdream.business.service.BusinessProfileService;
import com.cs.workdream.member.model.vo.Member;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/business")
public class BusinessProfileController {

    @Autowired
    private BusinessProfileService businessProfileService;

    @Autowired
    private ServletContext servletContext;

    // 'workEnvironmentImages' 필드를 데이터 바인딩에서 제외
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("benefits", "workEnvironmentImages");
    }

    @GetMapping("/businessProfilePost")
    public String businessProfilePost(@RequestParam(value = "businessNo", required = false) Integer businessNo, Model model) {
        if (businessNo != null) {
            try {
                Business business = businessProfileService.viewBusinessProfile(businessNo);
                if (business != null) {
                    model.addAttribute("business", business);
                } else {
                    model.addAttribute("errorMessage", "기업 정보를 찾을 수 없습니다.");
                    return "errorPage";
                }
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("errorMessage", "기업 정보를 불러오는 중 오류가 발생했습니다.");
                return "errorPage";
            }
        }
        return "business/businessProfilePost";
    }

    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<String> registerBusinessProfile(
            @ModelAttribute Business business,
            @RequestParam(value = "companyLogo", required = false) MultipartFile companyLogo,
            @RequestParam(value = "workEnvironmentFiles", required = false) List<MultipartFile> workEnvironmentFiles, // 기존 이미지 업데이트 파일
            @RequestParam(value = "newWorkEnvironmentFiles", required = false) List<MultipartFile> newWorkEnvironmentFiles, // 새로운 이미지 추가 파일
            @RequestParam(value = "workEnvImageTitles", required = false) String workEnvImageTitlesJson,
            @RequestParam(value = "existingImageIds", required = false) List<Integer> existingImageIds, // 기존 이미지 ID
            @RequestParam("benefits") String benefitsJson,
            HttpSession session) {
        try {
            // 세션에서 로그인한 사용자 정보 가져오기
            Member member = (Member) session.getAttribute("loginUser");
            if (member != null) {
                business.setBusinessNo(member.getBusinessNo());
            } else {
                return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
            }

            // 기존 비즈니스 정보 가져오기
            Business existingBusiness = businessProfileService.viewBusinessProfile(business.getBusinessNo());
            if (existingBusiness == null) {
                return new ResponseEntity<>("기업 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND);
            }

            // 회사 로고 업로드 처리
            if (companyLogo != null && !companyLogo.isEmpty()) {
                String logoUrl = saveFile(companyLogo, "logos");
                business.setLogo(logoUrl);
            } else {
                // 기존 로고 유지
                business.setLogo(existingBusiness.getLogo());
            }

            // 복리후생 처리
            List<String> benefits = parseJsonArray(benefitsJson);
            List<BusinessBenefit> benefitList = new ArrayList<>();
            for (String benefitStr : benefits) {
                BusinessBenefit benefit = new BusinessBenefit();
                benefit.setBenefit(benefitStr);
                benefitList.add(benefit);
            }
            business.setBenefits(benefitList);

            // 비즈니스 프로필 등록 (업데이트)
            businessProfileService.registerBusinessProfile(business, workEnvironmentFiles, newWorkEnvironmentFiles, existingImageIds, workEnvImageTitlesJson);

            // 리다이렉트 URL 생성
            String redirectUrl = servletContext.getContextPath() + "/business/businessProfileView?businessNo=" + business.getBusinessNo();
            return new ResponseEntity<>(redirectUrl, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("기업 정보 등록 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/businessProfileView")
    public String businessProfileView(@RequestParam("businessNo") int businessNo, Model model) {
        try {
            Business business = businessProfileService.viewBusinessProfile(businessNo);
            model.addAttribute("business", business);
            return "business/businessProfileView";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "기업 정보를 찾을 수 없습니다.");
            return "business/businessProfileView";
        }
    }

    private String saveFile(MultipartFile file, String folderName) throws IOException {
        // 업로드 디렉토리의 경로 설정
        String uploadDir = servletContext.getRealPath("/resources/uploads/" + folderName + "/");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            boolean created = dir.mkdirs();
            System.out.println("디렉토리 생성 여부: " + created);
            System.out.println("생성된 디렉토리 경로: " + dir.getAbsolutePath());
        } else {
            System.out.println("디렉토리가 이미 존재합니다: " + dir.getAbsolutePath());
        }

        String originalFilename = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        String filePath = uploadDir + File.separator + fileName;

        System.out.println("파일 저장 경로: " + filePath);

        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException("파일 저장 중 오류 발생");
        }

        // 반환되는 URL 설정
        return "/resources/uploads/" + folderName + "/" + fileName;
    }

    private List<String> parseJsonArray(String jsonArrayStr) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<String> list = mapper.readValue(jsonArrayStr, mapper.getTypeFactory().constructCollectionType(List.class, String.class));
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}