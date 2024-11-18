package com.cs.workdream.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cs.workdream.business.model.vo.JobPosting1;
import com.cs.workdream.business.service.BusinessService;

@Controller
public class BusinessController {
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	public BusinessController(BusinessService businessService) {
		this.businessService = businessService;
	}
	
	// 맵핑
	@GetMapping("/business/recruitmentStatus")
    public String reStatus() {
        return "business/recruitmentStatus";
    }
	
	@GetMapping("/business/announcementInformation2")
    public String announcement() {
        return "business/announcementInformation2";
    }
	

	@GetMapping("/business/announcementDetailView")
    public String announcementDetailView() {
        return "business/announcementDetailView";

	}
	@GetMapping("/business/preview")
    public String preview() {
        return "business/preview";

    }
	
	@GetMapping("/business/positionAndCareer")
    public String positionCareer() {
        return "business/positionAndCareer";
    }
	
	@GetMapping("/business/applicantsStatus")
    public String appStatus() {
        return "business/applicantsStatus";
    }
	
    @GetMapping("/business/applicantsList")
    public String appList() {
        return "business/applicantsList";
    }
    
    @GetMapping("/business/bookmark")
    public String bookmarkList() {
        return "business/bookmarkList";
    }
    
    @GetMapping("/business/businessMypage")
    public String businessMypage() {
        return "business/businessMypage";
    }
    
    @GetMapping("/business/businessProfilePost")
    public String businessProfilePost() {
        return "business/businessProfilePost";
    }
    
    @GetMapping("/business/businessProfileView")
    public String businessProfileView() {
        return "business/businessProfileView";
    }
    
    // 페이지 매핑
    @GetMapping("/business/announcementInformation1")
    public String jobRegistration() {
        return "business/announcementInformation1";
    }

//    // 담당자 정보 저장
//    @PostMapping("/api/representative")
//    @ResponseBody
//    public String saveRepresentativeInfo(@RequestBody JobPosting1 jobPosting) {
//        businessService.insertRepresentativeInfo(jobPosting);
//        return "Representative information saved successfully.";
//    }
//
//    // 홈페이지 주소 저장
//    @PostMapping("/api/{recruitmentNo}/website")
//    @ResponseBody
//    public String saveWebsite(@PathVariable int recruitmentNo, @RequestParam String website) {
//        businessService.saveWebsite(recruitmentNo, website);
//        return "Website saved successfully.";
//    }
//
//    // 로고 경로 저장
//    @PostMapping("/api/{recruitmentNo}/logo")
//    @ResponseBody
//    public String saveLogoPath(@PathVariable int recruitmentNo, @RequestParam String logoPath) {
//        businessService.saveLogoPath(recruitmentNo, logoPath);
//        return "Logo path saved successfully.";
//    }
}
