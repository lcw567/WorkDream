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
        return "resume/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
	
	@GetMapping("/selfIntro")
    public String selfIntro() {
        return "resume/selfIntro"; // selfIntro.jsp
    }
	
	@GetMapping("/enrollresume")
	public String enrollresume() {
		return "resume/enrollresume";
	}
	
	@GetMapping("/resumeDashboard")
	public String ResumDacsboard() {
		return "resume/resumeDashboard";
	}
	
	@GetMapping("/previewresume")
	public String previewResume() {
		return "resume/previewresume";
	}
	
}
