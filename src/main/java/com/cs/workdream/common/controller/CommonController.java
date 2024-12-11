package com.cs.workdream.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.Recruitment;
import com.cs.workdream.member.model.vo.Member;

@Controller
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	
	/*=====================================================================================================*/
	
	
	/* 메인 페이지 관련 */
    @RequestMapping("/home")
    public String index(HttpSession session) {
    	// 로그인 판별
    	Member currentUser = (Member)session.getAttribute("loginUser");
    	
    	// 공고 목록 조회
    	List<Recruitment> appList = commonService.selectRecruitmentList(currentUser.getPersonNo());
    	session.setAttribute("homeAppList", appList);
    	
        return "index";
    }
    
    
    /*=====================================================================================================*/
    
    
	@RequestMapping("/search")
    public String searchPage() {
        return "common/searchPage";
    }
}