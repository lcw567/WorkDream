package com.cs.workdream.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    @GetMapping("/login")
    public String login() {
        return "common/login";
    }
    
    @GetMapping("/registration")
    public String handleRequest(HttpServletRequest request, Model model) {
    	String userType = request.getParameter("ut");
        model.addAttribute("ut", userType);
        
        if("P".equals(userType)) {
        	return "common/registrationPerson";
        }
        else if("B".equals(userType)) {
        	return "common/registrationBusiness";
        }
        else {
        	return "common/registration";
        }
    }
}