package com.cs.workdream.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.Recruitment;
import com.cs.workdream.common.service.CommonService;
import com.cs.workdream.member.model.vo.Member;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	
	/*=====================================================================================================*/
	
	
	/* 메인 페이지 관련 */
    @RequestMapping("/")
    public String index(Model m, HttpSession session) {
    	// 로그인 판별
    	Member currentUser = (Member)session.getAttribute("loginUser");
    	int personNo = 0;
    	
    	if(currentUser != null && currentUser.getPersonNo() > 0) {
    		personNo = currentUser.getPersonNo();
    	}
    	
    	// 공고 목록 조회
    	List<Recruitment> recruitmentList = commonService.selectRecruitmentList(personNo);
    	m.addAttribute("recruitmentList", recruitmentList);
    	
        return "index";
    }
    
    
    /*=====================================================================================================*/
    
    
	@RequestMapping("/search")
    public String searchPage() {
        return "common/searchPage";
    }
}