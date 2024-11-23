package com.cs.workdream.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession; // 추가

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

import com.cs.workdream.business.model.dao.BusinessProfileDao;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBenefit;
import com.cs.workdream.business.model.vo.WorkEnvironmentImage;
import com.cs.workdream.business.service.BusinessProfileService;
import com.cs.workdream.member.model.vo.Member; // 추가
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 비즈니스 프로필 컨트롤러 클래스
 */
@Controller
@RequestMapping("/business")
public class BusinessProfileController {

    @Autowired
    private BusinessProfileService businessProfileService;

    @Autowired
    private ServletContext servletContext;

    /**
     * @InitBinder를 사용하여 특정 필드를 데이터 바인딩에서 제외
     * 'benefits'와 'workEnvironmentImages' 필드를 제외하여 수동으로 처리
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("benefits", "workEnvironmentImages");
    }

    /**
     * GET 요청: 비즈니스 프로필 등록 폼 보여주기
     * @return 비즈니스 프로필 등록 JSP 페이지
     */
    @GetMapping("/businessProfilePost")
    public String businessProfilePost() {
        return "business/businessProfilePost";
    }

    /**
     * POST 요청: AJAX를 통해 비즈니스 프로필 등록 처리
     * @param business 비즈니스 객체
     * @param companyLogo 회사 로고 파일
     * @param workEnvironmentImages 근무 환경 이미지 파일 목록
     * @param workEnvImageTitlesJson 근무 환경 이미지 제목 JSON
     * @param benefitsJson 복리후생 목록 JSON
     * @return 리다이렉트 URL을 담은 ResponseEntity
     */
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<String> registerBusinessProfile(
            @ModelAttribute Business business,
            @RequestParam("companyLogo") MultipartFile companyLogo,
            @RequestParam("workEnvironmentImages") List<MultipartFile> workEnvironmentImages,
            @RequestParam("workEnvImageTitles") String workEnvImageTitlesJson,
            @RequestParam("benefits") String benefitsJson,
            HttpSession session) { // HttpSession 추가
        try {
            // 현재 로그인한 사용자 정보 가져오기
            Member member = (Member) session.getAttribute("loginUser");
            if (member != null) {
                // 회원의 businessNo를 가져와서 Business 객체에 설정
                business.setBusinessNo(member.getBusinessNo());
            } else {
                return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
            }

            // 로그 추가: 받은 JSON 데이터 출력
            System.out.println("Received benefitsJson: " + benefitsJson);
            System.out.println("Received workEnvImageTitlesJson: " + workEnvImageTitlesJson);

            // 회사 로고 업로드 처리
            if(!companyLogo.isEmpty()) {
                String logoUrl = saveFile(companyLogo, "logos");
                business.setLogo(logoUrl);
            }

            // 근무 환경 이미지 업로드 처리
            List<WorkEnvironmentImage> imageList = new ArrayList<>();
            if(workEnvironmentImages != null && !workEnvironmentImages.isEmpty()) {
                // JSON 배열의 제목 파싱
                List<String> workEnvImageTitles = parseJsonArray(workEnvImageTitlesJson);
                for(int i=0; i<workEnvironmentImages.size(); i++) {
                    MultipartFile file = workEnvironmentImages.get(i);
                    String title = "";
                    if(i < workEnvImageTitles.size()) {
                        title = workEnvImageTitles.get(i);
                    }
                    if(!file.isEmpty()) {
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
            for(String benefitStr : benefits) {
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

        } catch(Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("기업 정보 등록 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * GET 요청: 비즈니스 프로필 보기
     * @param businessNo 비즈니스 번호
     * @param model 모델 객체
     * @return 비즈니스 프로필 보기 JSP 페이지
     */
    @GetMapping("/businessProfileView")
    public String businessProfileView(@RequestParam("businessNo") int businessNo, Model model) {
        try {
            Business business = businessProfileService.viewBusinessProfile(businessNo);
            model.addAttribute("business", business);
            return "business/businessProfileView";
        } catch(Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "기업 정보를 찾을 수 없습니다.");
            return "business/businessProfileView";
        }
    }

    /**
     * 업로드된 파일을 저장하는 헬퍼 메서드
     * @param file 업로드된 파일
     * @param folderName 저장할 폴더 이름
     * @return 저장된 파일의 URL 경로
     * @throws IOException
     */
    private String saveFile(MultipartFile file, String folderName) throws IOException {
        // 파일을 저장할 경로 정의
        String uploadDir = "/uploads/" + folderName + "/";
        String realPath = servletContext.getRealPath(uploadDir);
        File dir = new File(realPath);
        if(!dir.exists()) {
            dir.mkdirs();
        }

        // 고유한 파일 이름 생성
        String originalFilename = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + originalFilename;
        String filePath = realPath + fileName;

        // 파일 저장
        file.transferTo(new File(filePath));

        // 파일 접근을 위한 URL 경로 반환
        return servletContext.getContextPath() + uploadDir + fileName;
    }

    /**
     * JSON 배열 문자열을 List<String>으로 파싱하는 헬퍼 메서드
     * @param jsonArrayStr JSON 배열 문자열
     * @return 문자열 리스트
     */
    private List<String> parseJsonArray(String jsonArrayStr) {
        // Jackson 라이브러리를 사용하여 파싱
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
