package com.cs.workdream.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EnrollResume {
	@GetMapping("/enrollresume")
	public String enrollresume() {
		return "member/enrollresume";
	}
}
