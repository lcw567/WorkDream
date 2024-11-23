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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("benefits", "workEnvironmentImages");
    }

    @GetMapping("/businessProfilePost")
    public String businessProfilePost() {
        return "business/businessProfilePost";
    }

    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<String> registerBusinessProfile(
            @ModelAttribute Business business,
            @RequestParam(value = "companyLogo", required = false) MultipartFile companyLogo,
            @RequestParam(value = "workEnvironmentImages", required = false) List<MultipartFile> workEnvironmentImages,
            @RequestParam(value = "workEnvImageTitles", required = false) String workEnvImageTitlesJson,
            @RequestParam("benefits") String benefitsJson,
            HttpSession session) {
        try {
            Member member = (Member) session.getAttribute("loginUser");
            if (member != null) {
                business.setBusinessNo(member.getBusinessNo());
            } else {
                return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
            }

            // 디버깅용 로그 추가
            System.out.println("Received Business Object: " + business);

            // 회사 로고 업로드 처리
            if (companyLogo != null && !companyLogo.isEmpty()) {
                String logoUrl = saveFile(companyLogo, "logos");
                business.setLogo(logoUrl);
            }

            // 근무 환경 이미지 업로드 처리
            List<WorkEnvironmentImage> imageList = new ArrayList<>();
            if (workEnvironmentImages != null && !workEnvironmentImages.isEmpty()) {
                List<String> workEnvImageTitles = parseJsonArray(workEnvImageTitlesJson);
                for (int i = 0; i < workEnvironmentImages.size(); i++) {
                    MultipartFile file = workEnvironmentImages.get(i);
                    String title = "";
                    if (i < workEnvImageTitles.size()) {
                        title = workEnvImageTitles.get(i);
                    }
                    if (!file.isEmpty()) {
                        String imageUrl = saveFile(file, "work_env_images");
                        WorkEnvironmentImage image = new WorkEnvironmentImage();
                        image.setImageUrl(imageUrl);
                        image.setTitle(title);
                        imageList.add(image);
                    }
                }
                business.setWorkEnvironmentImages(imageList);
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
            int businessNo = businessProfileService.registerBusinessProfile(business);

            // 리다이렉트 URL 생성
            String redirectUrl = servletContext.getContextPath() + "/business/businessProfileView?businessNo=" + businessNo;
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
        String uploadDir = "/uploads/" + folderName + "/";
        String realPath = servletContext.getRealPath(uploadDir);
        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String originalFilename = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        String filePath = realPath + fileName;

        file.transferTo(new File(filePath));

        return servletContext.getContextPath() + uploadDir + fileName;
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
