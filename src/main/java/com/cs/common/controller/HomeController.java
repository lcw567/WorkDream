package com.cs.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping({"/spring/index", "/spring"})
    public String index() {
        return "index";  // 자동으로 /WEB-INF/index.jsp를 찾음
    }
}