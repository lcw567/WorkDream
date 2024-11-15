package com.cs.workdream.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.member.service.MemberService;

@CrossOrigin
@Controller
public class MemberController {
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	/* 로그인 관련 */
	
	// 로그인 페이지로 이동
	@RequestMapping("/login")
    public String login() {
        return "member/login";
    }
	
	// 로그인 판별
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, String saveId, HttpServletResponse response) {
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember == null || !bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
			// 로그인 실패
			mv.addObject("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mv.setViewName("common/errorPage");
		}
		else {
			// 로그인 성공
			Cookie ck = new Cookie("saveId", loginMember.getUserId());
			if(saveId == null) {
				ck.setMaxAge(0);
			}
			response.addCookie(ck);
			
			session.setAttribute("loginUser", loginMember);
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	
	/* 회원가입 관련 */
	
	// 회원가입 페이지로 이동
	@RequestMapping("/registration")
    public String handleRequest(HttpServletRequest request, Model model) {
    	String userType = request.getParameter("ut");
        model.addAttribute("ut", userType);
        
        // 파라미터값에 따라 개인 회원 or 기업 회원 페이지로 이동
        if("P".equals(userType)) {
        	return "member/registrationPerson";
        }
        else if("B".equals(userType)) {
        	return "member/registrationBusiness";
        }
        else {
        	return "member/registration";
        }
    }
	
	// 아이디 중복 체크
	@RequestMapping("/idCheck.me")
	public String idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		
		if(result > 0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}
}
