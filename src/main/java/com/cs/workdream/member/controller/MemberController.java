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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String login(@RequestParam("ut") String userType, HttpSession session) {
		session.setAttribute("ut", userType);
        return "member/login";
    }
	
	// 로그인 판별
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, String saveId, HttpServletResponse response) {
	    Member loginMember = memberService.loginMember(m);
	    System.out.println(m.toString());
	    System.out.println("암호화: " + bcryptPasswordEncoder.encode(m.getUserPwd()));
	    
	    if(loginMember == null || !bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
	        // 로그인 실패
	        mv.addObject("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        mv.addObject("returnPage", "/login?ut=" + m.getUserType());
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
	@RequestMapping("idCheck.me")
	@ResponseBody
	public String idCheck(String checkId) {
		int result = memberService.idCheck(checkId);
		
		if(result > 0) {
			// 중복있음
			return "NNNNN";
		}
		else {
			// 중복 없음
			return "NNNNY";
		}
	}
	
	// 신규 회원 등록
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		// 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			// 등록 성공
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다. 워크드림에 오신 걸 환영합니다!");
			return "redirect:/";
		}
		else {
			// 등록 실패
			session.setAttribute("errorMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			session.setAttribute("returnPage", "/registration?ut=" + m.getUserType());
			return "common/errorPage";
		}
	}
	
	
	/* 회원 정보 조회 */
	
	// 아이디, 비밀번호 조회 페이지로 이동
	@RequestMapping("/findUser")
	public String handleRequest1(HttpServletRequest request, Model model) {
		// 개인회원, 기업회원 확인용
		String userType = request.getParameter("ut");
		model.addAttribute("ut", userType);
		
		// findMember에서 사용할 변수값 set
		String findData = request.getParameter("fd");
		model.addAttribute("fd", findData);
		String findMethod = request.getParameter("fm");
		model.addAttribute("fm", findMethod);
		
		// 파라미터값에 따라 개인회원 or 기업회원 전용 페이지로 이동
		if("B".equals(userType)) {
			// 기업 전용으로 이동
        	return "member/findMemberBusiness";
        }
        else {
        	// 개인 전용으로 이동
        	return "member/findMemberPerson";
        }
	}
	
	// 아이디 조회
	@RequestMapping("/findId.me")
	public ModelAndView findMemberId(Member m, HttpServletRequest request, HttpSession session, ModelAndView mv, String saveId, HttpServletResponse response) {
		String method = request.getParameter("fm");
		
		Member findMember = memberService.findMemberId(m, method);
	    System.out.println(m.toString());
	    
	    if(findMember == null) {
	    	// 조회 실패
	    	String returnUrl = "/findUser?ut=" + m.getUserType() + "&fd=id" + "&fm=" + method;
	    	
	        mv.addObject("errorMsg", "일치하는 회원 정보가 없습니다.");
	        mv.addObject("returnPage", returnUrl);
	        mv.setViewName("common/errorPage");
	    } else {
	    	// 조회 성공
	    	mv.addObject("findUser", findMember);
	    	mv.setViewName("member/findMemberResult");
	    }
	    
	    return mv;
	}
	
	// 비밀번호 조회
	@RequestMapping("/findPwd.me")
	public ModelAndView findMemberPwd(Member m, HttpServletRequest request, HttpSession session, ModelAndView mv, String saveId, HttpServletResponse response) {
		String method = request.getParameter("fm");
		
		Member findMember = memberService.findMemberPwd(m, method);
	    System.out.println(m.toString());
	    
	    if(findMember == null) {
	    	// 조회 실패
	    	String returnUrl = "/findUser?ut=" + m.getUserType() + "&fd=pwd" + "&fm=" + method;
	    	
	        mv.addObject("errorMsg", "일치하는 회원 정보가 없습니다.");
	        mv.addObject("returnPage", returnUrl);
	        mv.setViewName("common/errorPage");
	    } else {
	    	// 조회 성공
	    	mv.addObject("findUser", findMember);
	    	mv.setViewName("member/findMemberResult");
	    }
	    
	    return mv;
	}
}
