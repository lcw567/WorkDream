package com.cs.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping({"/spring/index", "/spring"})
    public String index() {
        return "index";
    }
}