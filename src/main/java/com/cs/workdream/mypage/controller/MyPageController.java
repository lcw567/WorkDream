package com.cs.workdream.mypage.controller;

import java.util.Collections;
import java.util.List;

// 필요한 import 추가
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.service.BusinessProfileService;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.usertags.model.vo.UserTag;
import com.cs.workdream.usertags.service.UserTagsService;

@Controller
@RequestMapping
public class MyPageController {

    @Autowired
    private UserTagsService userTagsService;

    @Autowired
    private BusinessProfileService businessProfileService; // BusinessProfileService 주입

    @GetMapping("business/businessMypage")
    public String businessMypage(HttpSession session, Model model) throws Exception {
        // 세션에서 로그인한 사용자 정보 가져오기
        Member currentUser = (Member) session.getAttribute("loginUser");
        if (currentUser != null) {
            int businessNo = currentUser.getBusinessNo();
            // Business 객체 가져오기
            Business business = businessProfileService.viewBusinessProfile(businessNo);
            // 모델에 추가
            model.addAttribute("business", business);
        } else {
            // 로그인하지 않은 경우 처리
            return "redirect:/login"; // 로그인 페이지로 리다이렉트하거나 적절한 처리
        }
        return "business/businessMypage";
    }
    
    @GetMapping("/person/applicantsMypage")
    public String applicantsMypage(Model model, HttpSession session) {
        // 세션에서 로그인한 사용자 정보 가져오기
        Member currentUser = (Member) session.getAttribute("loginUser");
        System.out.println("Current User: " + currentUser); // 로그 추가
        
        if (currentUser != null) {
            // 현재 사용자의 관심태그 목록 가져오기
            List<UserTag> userTags = userTagsService.getUserTags(currentUser.getUserNo());
            System.out.println("Fetched userTags: " + userTags); // 로그 추가
            // 모델에 관심태그 추가
            model.addAttribute("userTags", userTags);
        } else {
            // 로그인하지 않은 사용자 처리 (빈 리스트 추가)
            System.out.println("No user is logged in."); // 로그 추가
            model.addAttribute("userTags", Collections.emptyList());
        }
        
        return "person/applicantsMypage"; // applicantsMypage.jsp
    }

}
