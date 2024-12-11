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
	@Autowired
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
    
	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	
	/*=====================================================================================================*/
	
	
	/* 로그인 관련 */
	
	// 로그인 페이지로 이동
	@RequestMapping("/login")
    public String login(@RequestParam(value = "ut", required = false) String userType, Model model) {
		if(userType == null) {
			userType = "P";
		} else {
			model.addAttribute("ut", userType);
		}
		
        return "member/login";
    }
	
	// 로그인 판별
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv, String saveId, HttpServletResponse response) {
	    Member loginMember = memberService.loginMember(m);
	    System.out.println("loginMember: " + m.toString());
	    System.out.println("loginUser: " + loginMember.toString());
	    System.out.println("암호화: " + bcryptPasswordEncoder.encode(m.getUserPwd()) + "\n");
	    
	    if(loginMember == null || !bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
	        // 로그인 실패
	        mv.addObject("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        mv.addObject("returnPage", "/login?ut=" + m.getUserType());
	        mv.setViewName("common/errorPage");
	    }
	    else {
	        // 로그인 성공
	    	session.setAttribute("loginUser", loginMember);
	    	
	        Cookie ck = new Cookie("saveId", loginMember.getUserId());
	        if(saveId == null) {
	            ck.setMaxAge(0);
	        }
	        response.addCookie(ck);
	        
        	if("B".equals(loginMember.getUserType())) {
        		// 기업 회원 > 기업 홈으로 이동
        		mv.setViewName("redirect:/business/businessMypage");
        	} else {
        		// 개인 회원 > 메인 홈으로 이동
        		mv.setViewName("redirect:/");
        	}
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
    public String registration(@RequestParam(value = "ut", required = false) String userType, Model model) {
		if(userType == null) {
			return "member/registration";
		} else {
			model.addAttribute("ut", userType);
		}
        
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
			model.addAttribute("errorMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			model.addAttribute("returnPage", "/registration?ut=" + m.getUserType());
			return "common/errorPage";
		}
	}
	
	
	/* 아이디, 비밀번호 찾기 관련 */
	
	// 아이디, 비밀번호 조회 페이지로 이동
	@RequestMapping("/findUser")
	public String findMember(@RequestParam("ut") String userType, @RequestParam("fd") String findData, @RequestParam("fm") String findMethod, Model model) {
		// findMember에서 사용할 변수값 set
		model.addAttribute("ut", userType);
		model.addAttribute("fd", findData);
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
	public String findMemberId(Member m, @RequestParam("fm") String method, HttpSession session) {
		Member findMember = memberService.findMemberId(m, method);
	    System.out.println(m.toString());
	    
	    if(findMember == null) {
	    	// 조회 실패
	    	String returnUrl = "/findUser?ut=" + m.getUserType() + "&fd=id&fm=" + method;
	    	
	    	session.setAttribute("errorMsg", "일치하는 회원 정보가 없습니다.");
	    	session.setAttribute("returnPage", returnUrl);
	    	
	    	return "common/errorPage";
	    } else {
	    	// 조회 성공
	    	session.setAttribute("findUser", findMember);
	    	session.setAttribute("fd", "pwd");
	    	session.setAttribute("fm", method);
	    	
	    	return "redirect:/findUserResult";
	    }
	}
	
	// 비밀번호 조회
	@RequestMapping("/findPwd.me")
	public String findMemberPwd(Member m, @RequestParam("fm") String method, HttpSession session) {
		Member findMember = memberService.findMemberPwd(m, method);
	    System.out.println(m.toString());
	    
	    if(findMember == null) {
	    	// 조회 실패
	    	String returnUrl = "/findUser?ut=" + m.getUserType() + "&fd=pwd&fm=" + method;
	    	
	    	session.setAttribute("errorMsg", "일치하는 회원 정보가 없습니다.");
	    	session.setAttribute("returnPage", returnUrl);
	    	
	    	return "common/errorPage";
	    } else {
	    	// 조회 성공
	    	session.setAttribute("findUser", findMember);
	    	session.setAttribute("fd", "pwd");
	    	session.setAttribute("fm", method);
	    	
	    	return "redirect:/findUserResult";
	    }
	}
	
	// 조회 결과 페이지로 이동
	@RequestMapping("/findUserResult")
	public String findUserResult(HttpSession session, Model model) {
		// Session을 통해 전달받은 데이터를 Model에 저장
		Member findMember = (Member) session.getAttribute("findUser");
	    String fd = (String) session.getAttribute("fd");
	    String fm = (String) session.getAttribute("fm");
	    
	    model.addAttribute("findUser", findMember);
        model.addAttribute("fd", fd);
        model.addAttribute("fm", fm);
		
	    return "member/findMemberResult";
	}
	
	// 막줄 세이버
}
