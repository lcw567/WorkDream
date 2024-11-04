package com.cs.workdream.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class EnrollResume {
	
	@GetMapping("/enrollresume")
	public String enrollresume() {
		return "member/enrollresume";
	}
	
	@GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "member/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
	
	@GetMapping("/selfIntro")
    public String selfIntro() {
        return "member/selfIntro"; // selfIntro.jsp
    }
}


