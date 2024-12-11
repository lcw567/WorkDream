package com.cs.workdream.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String index() {
        return "index";
    }
    
	@RequestMapping("/search")
    public String searchPage() {
        return "common/searchPage";
    }
}