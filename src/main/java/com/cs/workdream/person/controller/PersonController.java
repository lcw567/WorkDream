package com.cs.workdream.person.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/person")
public class PersonController {
	@GetMapping("/applicantsMypage")
    public String applicantsMypage() {
        return "person/applicantsMypage"; // applicantsMypage.jsp
    }

	@GetMapping("/applicationmanage")
	public String applicationmanage() {
		return "person/applicationmanage";
	}
	
	@GetMapping("/clipping")
	public String clipping() {
		return "person/clipping";
	}
	
	@GetMapping("/clippingcompany")
	public String clippingcompany() {
		return "person/clippingcompany";
	}
}
