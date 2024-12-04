package com.cs.workdream.business.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.service.BusinessProfileService;
import com.cs.workdream.business.service.BusinessService;
import com.cs.workdream.member.model.vo.Member;

@Controller
@RequestMapping("/business")
public class BusinessController {
	@Autowired
	private BusinessService businessService;
    private BusinessProfileService businessProfileService;
	
	@Autowired
	public BusinessController(BusinessService businessService, BusinessProfileService businessProfileService) {
		this.businessService = businessService;
		this.businessProfileService = businessProfileService;
	}
	
	
	/*=====================================================================================================*/
	
	
	/* 기업 마이페이지 (기업 홈) 관련 */
	// 기업홈 페이지로 이동
	@GetMapping("/businessMypage")
    public String businessMypage(HttpSession session, Model model) throws Exception {
        // 세션에서 로그인한 사용자 정보 가져오기
        Member currentUser = (Member) session.getAttribute("loginUser");
        
        if (currentUser != null) {
        	int businessNo = currentUser.getBusinessNo();
        	
        	// 기업 정보 가져오기
            Business business = businessProfileService.viewBusinessProfile(businessNo);
            model.addAttribute("business", business);
        } else {
            // 로그인하지 않은 경우 처리
        	session.setAttribute("alertMsg", "회원가입이 완료되었습니다. 워크드림에 오신 걸 환영합니다!");
            return "redirect:/login";
        }
        
        return "business/businessMypage";
    }
	
	
	/*=====================================================================================================*/
	
	/* 채용공고 관련 */
	// 채용공고관리 페이지로 이동
	@GetMapping("/recruitmentManager")
    public String reStatus() {
        return "business/recruitmentManager";
    }
	
	// 채용공고 작성 페이지로 이동
    @GetMapping("/recruitmentRegister")
    public String recruitmentRegister(@RequestParam(value="step", defaultValue="1") int step) {
    	switch(step) {
    	case 1:
    		return "business/recruitmentRegister1";
    	case 2:
    		return "business/recruitmentRegister2";
    	default:
    		// 값을 제대로 받지 못했을 경우에도 첫 번째 작성 페이지로 이동
    		return "business/recruitmentRegister1";
    	}
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
    
    // 지원자 목록 조회(현황 페이지용)
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
    
    
    /*=====================================================================================================*/
    
    
    /* 구직자 즐겨찾기 관련 */
    // 구직자 즐겨찾기 페이지로 이동
    @GetMapping("/bookmark")
    public String bookmarkList(HttpSession session, Model model) {
    	// loadBookmarkList 값을 받아서 사용
    	loadBookmarkList(session, model);
    	
        return "business/businessBookmarkList";
    }
    
    // 즐겨찾기 목록 조회
    public Model loadBookmarkList(HttpSession session, Model model) {
    	Member loginMember = (Member) session.getAttribute("loginUser");
    	int businessNo = loginMember.getBusinessNo();
    	
    	List<BusinessBookmark> bookmarkList = businessService.loadBookmarkList(businessNo);
    	model.addAttribute("bookmarkList", bookmarkList);
    	
    	return model;
    }
	
    // 즐겨찾기에서 삭제
    @RequestMapping("/deleteBookmark.biz")
    @ResponseBody
    public int deleteBookmarkList(@RequestParam("no") int resumeNo, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginUser");
    	int businessNo = loginMember.getBusinessNo();
    	
    	return businessService.deleteBookmarkList(businessNo, resumeNo);
    }
    
    // 즐겨찾기 그룹 분류 수정
    @RequestMapping("/updateBookmark.biz")
    @ResponseBody
    public int updateBookmarkFolder(@RequestBody BusinessBookmark bookmark, @RequestParam("type") String type, @RequestParam(value = "folder", required = false) int folder) {
    	return businessService.updateBookmarkFolder(bookmark, type, folder);
    }
    
    // 즐겨찾기 그룹 추가
    @RequestMapping("/insertFolder.biz")
    @ResponseBody
    public int insertFolder(@RequestParam("folderName") String folderName, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginUser");
    	int businessNo = loginMember.getBusinessNo();
    	
    	return businessService.insertFolder(businessNo, folderName);
    }
    
    // 즐겨찾기 그룹 편집
    @RequestMapping("/updateFolder.biz")
    @ResponseBody
    public int updateFolder(@RequestParam("folder") int folder, @RequestParam(value = "order") int order, @RequestParam(value = "folderName") String folderName, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginUser");
    	int businessNo = loginMember.getBusinessNo();
    	
    	return businessService.updateFolder(businessNo, folder, order, folderName);
    }
    
    // 즐겨찾기 그룹 삭제
    @RequestMapping("/deleteFolder.biz")
    @ResponseBody
    public int deleteFolder(@RequestParam("folder") int folder, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginUser");
    	int businessNo = loginMember.getBusinessNo();
    	
    	return businessService.deleteFolder(businessNo, folder);
    }
	
    
	/*=====================================================================================================*/
	
	
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
	
}
