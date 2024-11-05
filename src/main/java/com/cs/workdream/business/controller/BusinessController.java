package com.cs.workdream.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BusinessController {
	
	// 맵핑
	@GetMapping("/business/recruitmentStatus")
    public String reStatus() {
        return "business/recruitmentStatus";
    }
	
	@GetMapping("/business/jobPostingRegistration")
    public String jobRegistration() {
        return "business/jobPostingRegistration";
    }
	
	@GetMapping("/business/applicantsStatus")
    public String appStatus() {
        return "business/applicantsStatus";
    }
	
    @GetMapping("/business/applicantsList")
    public String appList() {
        return "business/applicantsList";
    }
<<<<<<< HEAD
    
<<<<<<< HEAD
    @GetMapping("/business/bookmark")
    public String bookmarkList() {
        return "business/bookmarkList";
=======
	@GetMapping("/business/jobPostingRegistration")
    public String jobRegistration() {
        return "business/jobPostingRegistration";
>>>>>>> 2b038cb2521d541d6247fb6d21b7cb6cc57f86f3
=======
  
    @GetMapping("/business/bookmark")
    public String bookmarkList() {
        return "business/bookmarkList";
>>>>>>> 60706d483b474c6f5a480c5990d6624eb7de310c
    }
}
