package com.cs.workdream.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class Resumecontroller {
	
	@GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "member/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
	
	@GetMapping("/selfIntro")
    public String selfIntro() {
        return "member/selfIntro"; // selfIntro.jsp
    }
	
	@GetMapping("/enrollresume")
	public String enrollresume() {
		return "resume/enrollresume";
	}
	
	@RequestMapping("/resumeDashboard")
	public String ResumDacsboard() {
		return "resume/resumeDashboard";
	}
	
	@GetMapping("/previewresume")
	public String previewResume() {
		return "resume/previewresume";
	}
	
}
