package com.cs.workdream.common.controller;

import org.springframework.stereotype.Controller;
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
}