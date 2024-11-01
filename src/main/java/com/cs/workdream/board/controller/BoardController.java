package com.cs.workdream.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    @GetMapping("/communityHome")
    public String showCommunityHome() {
        return "board/communityHome";
    }
}  