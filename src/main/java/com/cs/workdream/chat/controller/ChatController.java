package com.cs.workdream.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs.workdream.member.model.vo.Member;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @GetMapping
    public String chatPage(Model model, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("userId", loginUser.getUserId());
        return "chat/chat";
    }
}
