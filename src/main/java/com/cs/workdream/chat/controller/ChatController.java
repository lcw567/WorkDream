package com.cs.workdream.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;
import com.cs.workdream.chat.service.ChatService;
import com.cs.workdream.member.model.vo.Member;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @GetMapping
    public String chatPage() {
        return "chat/chat";
    }

    // 채팅 목록 조회 API
    @GetMapping("/list")
    @ResponseBody
    public List<ChatList> getChatList(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return null;
        }
        String userId = loginUser.getUserId();
        return chatService.getChatList(userId);
    }

    // 채팅 기록 조회 API
    @GetMapping("/history")
    @ResponseBody
    public List<ChatHistory> getChatHistory(HttpSession session, String chatWithId) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null || chatWithId == null) {
            return null;
        }
        String userId = loginUser.getUserId();
        return chatService.getChatHistory(userId, chatWithId);
    }
}
