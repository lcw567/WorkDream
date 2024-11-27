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
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.JobPosting1;
import com.cs.workdream.business.model.vo.Position;
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
	public String applicantsStatus() {
		// @RequestParam("recruitmentNo") int recruitmentNo,
		// 지원자 현황 조회 결과를 Model에 저장
	    // model = inquiryAppStatus(recruitmentNo, model);
		
		// 조회 결과에 따라 페이지 이동
//	    int result = (int) model.getAttribute("result");
//	    if (result == 1) {
//	        // 조회 성공 시 business/applicantsStatus 페이지로 이동
//	        return "business/applicantsStatus";
//	    } else {
//	        // 조회 실패 시 common/errorPage로 이동
//	        return "common/errorPage";
//	    }
		
		
		return "business/applicantsStatus";
	}
	
	// 지원자 현황 조회
	public Model inquiryAppStatus(int recruitmentNo, Model model) {
		// 전달받은 공고 고유키로 지원자 현황 조회
		ApplicantsStatus appsStatus = businessService.inquireAppsStatus(recruitmentNo);
		List<Position> positionList = businessService.inquirePositionList(recruitmentNo);
		
		if(appsStatus.getTotal() >= 0) {
			// 조회 성공 -> Model값 전달
			model.addAttribute("result", 1);
			model.addAttribute("appsStatus", appsStatus);
			model.addAttribute("positionList", positionList);
		} else {
			// 조회 실패
			model.addAttribute("result", 0);
			model.addAttribute("errorMsg", "오류가 발생했습니다. 다시 시도해주세요.");
			model.addAttribute("returnPage", "redirect:/");
		}
		
		return model;
	}
	
	// 지원자 목록 페이지로 이동
    @GetMapping("/applicantsList")
    public String applicantsList(Model model) {
    	// @RequestParam("no") int recruitmentNo, @RequestParam("position")
    	// model = loadAppList();
        return "business/applicantsList";
    }
    
    // 지원자 목록 조회
    public Model loadAppList(int recruitmentNo, int positionNo, Model model) {
    	// 포지션 고유키로 지원자 목록 및 상태 조회
    	List<Applicants> appList = businessService.loadAppList(recruitmentNo, positionNo);
    	
    	if(appList == null) {
    		// 목록 조회 실패
    		model.addAttribute("errorMsg", "오류가 발생했습니다. 다시 시도해주세요.");
    		model.addAttribute("returnPage", "/inquiryAppStatus?no=" + recruitmentNo);
    	} else {
    		// 조회 성공
    		model.addAttribute("appList", appList);
    		model.addAttribute("/business/applicantsList");
    	}
    	
    	return model;
    }
    
    
    /* 구직자 즐겨찾기 관련 */
    
    // 구직자 즐겨찾기 페이지로 이동
    @GetMapping("/bookmark")
    public String bookmarkList() {
        return "business/bookmarkList";
    }
    
    // 즐겨찾기 목록 조회
    public Model loadBookmarkList(int businessNo, Model model) {
    	List<BusinessBookmark> bookmarkList = businessService.loadBookmarkList(businessNo);
    	
    	model.addAttribute("bookmarkList", bookmarkList);
    	
    	return model;
    }
	
    // 즐겨찾기에서 삭제
    @RequestMapping("/deleteBookmark.bu")
    public int deleteBookmarkList(@RequestParam("no") int resumeNo) {
    	int result = businessService.deleteBookmarkList(resumeNo);
    	
    	return result;
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
	
	@PostMapping("/announcementInformation2")
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
    
    
    // 페이지 매핑
    @GetMapping("/announcementInformation1")
    public String jobRegistration() {
        return "business/announcementInformation1";
    }
}
