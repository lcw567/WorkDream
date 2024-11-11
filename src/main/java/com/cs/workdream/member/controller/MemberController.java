package com.cs.workdream.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "member/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
	
	@GetMapping("/selfIntro")
    public String selfIntro() {
        return "member/selfIntro"; // selfIntro.jsp
    }
	
	@GetMapping("/applicantsMypage")
    public String applicantsMypage() {
        return "member/applicantsMypage"; // applicantsMypage.jsp
    }

	@GetMapping("/applicationmanage")
	public String applicationmanage() {
		return "member/applicationmanage";
	}
	
	@GetMapping("/clipping")
	public String clipping() {
		return "member/clipping";
	}
	
	@GetMapping("/clippingcompany")
	public String clippingcompany() {
		return "member/clippingcompany";
	}
}


