package com.cs.workdream.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board") // 최상위 경로 추가
public class BoardController {

    @GetMapping("/communityHome")
    public String showCommunityHome() {
        return "board/communityHome"; // communityHome.jsp
    }

    @GetMapping("/communityPost")
    public String showCommunityPost() {
        return "board/communityPost"; // communityPost.jsp
    }

    @GetMapping("/communityView")
    public String showCommunityView() {
        return "board/communityView"; // communityView.jsp
    }

    @GetMapping("/communityList")
    public String showCommunityList() {
        return "board/communityList"; // communityList.jsp
    }
}
