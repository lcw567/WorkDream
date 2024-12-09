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
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.model.vo.Recuritment;
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
	@RequestMapping("/businessMypage")
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
	@RequestMapping("/recruitmentManager")
    public ModelAndView recruitmentManager(ModelAndView mv, HttpSession session) {
		Member currentUser = (Member) session.getAttribute("loginUser");
		
		if(currentUser != null) {
			// 현재 공고 현황 조회 > 전달
			mv.setViewName("business/recruitmentManager");
			mv.addObject("statusMap", selectRecuritmentStatus(session));
		} else {
			mv.setViewName("common/errorPage");
			mv.addObject("errorMsg", "로그인이 필요한 서비스입니다.");
			mv.addObject("returnPage", "/login?ut=B");
		}
		
        return mv;
    }

	// 현재 공고 현황 조회
	public Map<String, Integer> selectRecuritmentStatus(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
		
		Map<String, Integer> statusMap = businessService.selectRecuritmentStatus(businessNo);
		
		return statusMap;
	}
	
	// 진행중인 공고 목록 조회
	@GetMapping("/progressRecuritment.biz")
	@ResponseBody
	public List<Recuritment> selectListProgressRecuritment(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	List<Recuritment> progressList = businessService.selectListProgressRecuritment(businessNo);
		
		return progressList;
	}
	
	// 대기중인 공고 목록 조회
	@RequestMapping("/standByRecuritment.biz")
	@ResponseBody
	public List<Recuritment> selectListStandByRecuritment(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	List<Recuritment> standByList = businessService.selectListStandByRecuritment(businessNo);
		
		return standByList;
	}
	
	// 임시저장한 공고 목록 조회
	@RequestMapping("/temporaryRecuritment.biz")
	@ResponseBody
	public List<Recuritment> selectListTemporaryRecuritment(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	List<Recuritment> temporaryList = businessService.selectListTemporaryRecuritment(businessNo);
		
		return temporaryList;
	}
	
	// 마감된 공고 목록 조회
	@RequestMapping("/endRecuritment.biz")
	@ResponseBody
	public List<Recuritment> selectListEndyRecuritment(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	List<Recuritment> endList = businessService.selectListEndRecuritment(businessNo);
		
		return endList;
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
    
    // 공고 수정
    public int updateRecruitment(@RequestParam("no") int recuritmentNo) {
    	// 여긴 구상중 - 채용공고 작성 페이지가 완료 되어야 수정 가능할듯.
    	return 0;
    }
    
    // 공고 삭제
    @GetMapping("/deleteRecruitment.biz")
    @ResponseBody
    public int deleteRecruitment(@RequestParam("no") int recuritmentNo) {
    	return businessService.deleteRecruitment(recuritmentNo);
    }
	
	
	/*=====================================================================================================*/
	
	
	/* 지원자 현황&목록 관련 */
	// 지원자 현황 페이지로 이동
    @RequestMapping("/applicantsStatus")
	public ModelAndView applicantsStatus(@RequestParam(value="no", defaultValue="0") int recuritmentNo, ModelAndView mv, HttpSession session) {
    	Member currentUser = (Member) session.getAttribute("loginUser");
		
		if(currentUser != null) {
			// 지원자 현황 조회 -> 전달
			mv.setViewName("business/applicantsStatus");
			
			// 전달받은 공고 고유키가 없을 경우 현재 진행 중인 공고 현황 전체 조회
			if(recuritmentNo == 0) {
				// 리스트 객체를 반환
				// List<Map<String, Object>> 형식으로 세트들 관리
//				List<Map<String, Object>> data = new ArrayList<>();
//
//				// 첫 번째 세트
//				Map<String, Object> set1 = new HashMap<>();
//				set1.put("count1", 10);
//				set1.put("count2", 20);
//				set1.put("count3", 30);
//				set1.put("list", Arrays.asList("item1", "item2", "item3"));
//				data.add(set1);
			} else {
				mv.addObject("statusMap", (session));
			}
		} else {
			mv.setViewName("common/errorPage");
			mv.addObject("errorMsg", "로그인이 필요한 서비스입니다.");
			mv.addObject("returnPage", "/login?ut=B");
		}
		
        return mv;
	}
	
	// 지원자 전체 현황 조회
    public Map<String, Integer> selectAppStatus(HttpSession session) {
		Member currentUser = (Member)session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
		
		Map<String, Integer> statusMap = businessService.selectRecuritmentStatus(businessNo);
		
		return statusMap;
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
    @RequestMapping("/bookmark")
    public String bookmarkList(HttpSession session, Model model) {
    	// loadBookmarkList 값을 받아서 사용
    	loadBookmarkList(session, model);
    	
        return "business/businessBookmarkList";
    }
    
    // 즐겨찾기 목록 조회
    public Model loadBookmarkList(HttpSession session, Model model) {
    	Member currentUser = (Member) session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	List<BusinessBookmark> bookmarkList = businessService.loadBookmarkList(businessNo);
    	model.addAttribute("bookmarkList", bookmarkList);
    	
    	return model;
    }
	
    // 즐겨찾기에서 삭제
    @RequestMapping("/deleteBookmark.biz")
    @ResponseBody
    public int deleteBookmarkList(@RequestParam("no") int resumeNo, HttpSession session) {
    	Member currentUser = (Member) session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
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
    	Member currentUser = (Member) session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	return businessService.insertFolder(businessNo, folderName);
    }
    
    // 즐겨찾기 그룹 편집
    @RequestMapping("/updateFolder.biz")
    @ResponseBody
    public int updateFolder(@RequestParam("folder") int folder, @RequestParam(value = "order") int order, @RequestParam(value = "folderName") String folderName, HttpSession session) {
    	Member currentUser = (Member) session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	return businessService.updateFolder(businessNo, folder, order, folderName);
    }
    
    // 즐겨찾기 그룹 삭제
    @RequestMapping("/deleteFolder.biz")
    @ResponseBody
    public int deleteFolder(@RequestParam("folder") int folder, HttpSession session) {
    	Member currentUser = (Member) session.getAttribute("loginUser");
    	int businessNo = currentUser.getBusinessNo();
    	
    	return businessService.deleteFolder(businessNo, folder);
    }
	
    
	/*=====================================================================================================*/
	

	@RequestMapping("/announcementDetailView")
    public String announcementDetailView() {
        return "business/announcementDetailView";

	}
	@RequestMapping("/preview")
    public String preview() {
        return "business/preview";

    }
	
	@RequestMapping("/positionAndCareer")
    public String positionCareer() {
        return "business/positionAndCareer";
    }
	
}
