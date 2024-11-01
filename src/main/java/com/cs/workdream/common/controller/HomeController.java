package com.cs.workdream.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    // 테스트용
    @GetMapping("/appList")
    public String appList() {
        return "business/applicantsList"; // /views/business/applicantsList.jsp를 찾음
    }
}