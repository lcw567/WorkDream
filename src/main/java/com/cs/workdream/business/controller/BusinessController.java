package com.cs.workdream.business.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cs.workdream.business.model.vo.JobPosting1;
import com.cs.workdream.business.service.BusinessService;

@Controller
@RequestMapping("/business")
public class BusinessController {
	private BusinessService businessService;
	
	@Autowired
	public BusinessController(BusinessService businessService) {
		this.businessService = businessService;
	}
	
	// 맵핑
	@GetMapping("/recruitmentStatus")
    public String reStatus() {
        return "/recruitmentStatus";
    }
	
	@GetMapping("/announcementInformation2")
    public String announcement() {
        return "business/announcementInformation2";
    }
	
	@PostMapping("/business/announcementInformation2")
	@ResponseBody
	public Map<String, String> handleJobData(@RequestBody Map<String, String> jobData) {
	    // 데이터 처리 로직 (DB 저장, 검증 등)
	    // 여기서는 요청 데이터를 그대로 반환
	    return jobData;
	}
	

	@GetMapping("/announcementDetailView")
    public String announcementDetailView() {
        return "business/announcementDetailView";

	}
	@GetMapping("/preview")
    public String preview() {
        return "business/preview";

    }
	
	@GetMapping("/positionAndCareer")
    public String positionCareer() {
        return "business/positionAndCareer";
    }
	
	@GetMapping("/applicantsStatus")
    public String appStatus() {
        return "business/applicantsStatus";
    }
	
    @GetMapping("/applicantsList")
    public String appList() {
        return "business/applicantsList";
    }
    
    @GetMapping("/bookmark")
    public String bookmarkList() {
        return "business/bookmark";
    }
    
    
    // 페이지 매핑
    @GetMapping("/announcementInformation1")
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
