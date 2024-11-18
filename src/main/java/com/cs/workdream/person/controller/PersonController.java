package com.cs.workdream.person.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs.workdream.member.model.vo.Member;

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
