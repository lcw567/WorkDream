package com.cs.workdream.business.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.business.model.vo.Applicants;
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
	
	/*=====================================================================================================*/
	
	
	/* 지원자 현황&목록 관련 */
	
	// 지원자 현황 페이지로 이동
	@GetMapping("/applicantsStatus")
    public String applicantsStatus(Model m) {
		return "business/applicantsStatus";
    }
	
	// 지원자 현황 조회
	@RequestMapping("/inquiryAppStatus")
	public ModelAndView inquiryAppStatus(@RequestParam("no") int recruitmentNo, ModelAndView mv, Applicants apps) {
		// 전달받은 공고 고유키로 지원자 현황 조회
		apps = businessService.inquireAppStatus(recruitmentNo);
		
		if(apps == null) {
			// 조회 실패
			mv.addObject("errorMsg", "오류가 발생했습니다. 다시 시도해주세요.");
	        mv.addObject("returnPage", "redirect:/");
	        mv.setViewName("common/errorPage");
		} else {
			// 조회 성공
			mv.addObject("appStatus", apps);
			mv.setViewName("redirect:/applicantsStatus");
		}
		
		return mv;
	}
	
	// 지원자 목록 페이지로 이동
    @GetMapping("/applicantsList")
    public String applicantsList() {
        return "business/applicantsList";
    }
    
    // 지원자 목록 조회
    @RequestMapping("/loadAppList")
    public ModelAndView loadAppList(@RequestParam("no") int recruitmentNo, @RequestParam("position") int positionNo, ModelAndView mv) {
    	// 포지션 고유키로 지원자 목록 및 상태 조회
    	List<Applicants> appList = businessService.loadAppList(recruitmentNo, positionNo);
    	
    	if(appList == null) {
    		// 목록 조회 실패
    		mv.addObject("errorMsg", "오류가 발생했습니다. 다시 시도해주세요.");
	        mv.addObject("returnPage", "/inquiryAppStatus?no=" + recruitmentNo);
	        mv.setViewName("common/errorPage");
    	} else {
    		// 조회 성공
    		mv.addObject("appList", appList);
    		mv.setViewName("/business/applicantsList");
    	}
    	
    	return mv;
    }
	
	
	/*=====================================================================================================*/
	
    
	// 맵핑
	@GetMapping("/recruitmentStatus")
    public String reStatus() {
        return "business/recruitmentStatus";
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
    
    @GetMapping("/bookmark")
    public String bookmarkList() {
        return "business/bookmark";
    }
    
    
    // 페이지 매핑
    @GetMapping("/announcementInformation1")
    public String jobRegistration() {
        return "business/announcementInformation1";
    }
}
