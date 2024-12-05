package com.cs.workdream.chat.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;
import com.cs.workdream.chat.service.ChatService;
import com.cs.workdream.member.model.vo.Member;

@Controller 
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @GetMapping
    public String chatPage() {
        return "chat/chat"; // 뷰 이름 반환
    }

    // 채팅 목록 조회 API
    @GetMapping("/list")
    @ResponseBody // JSON 응답을 위해 @ResponseBody 추가
    public List<ChatList> getChatList(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return Collections.emptyList(); // 로그인 정보 없을 경우 빈 목록 반환
        }
        String userId = loginUser.getUserId();
        return chatService.getChatList(userId); // DB에서 사용자 채팅 목록 반환
    }

    // 채팅 기록 조회 API
    @GetMapping("/history")
    @ResponseBody // JSON 응답을 위해 @ResponseBody 추가
    public List<ChatHistory> getChatHistory(HttpSession session, @RequestParam("chatWithId") String chatWithId) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null || chatWithId == null) {
            return Collections.emptyList(); // 로그인 정보 없거나 chatWithId가 없을 경우 빈 목록 반환
        }
        String userId = loginUser.getUserId();
        return chatService.getChatHistory(userId, chatWithId);
    }

    // 채팅 목록에 사용자 추가 API
    @PostMapping("/addUser")
    @ResponseBody // JSON 응답을 위해 @ResponseBody 추가
    public ResponseEntity<String> addUserToChatList(HttpSession session, @RequestParam("targetUserId") String targetUserId) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(401)
                .contentType(MediaType.TEXT_PLAIN)
                .body("로그인이 필요합니다.");
        }

        String userId = loginUser.getUserId();

        // 자기 자신을 추가하려는 경우
        if (userId.equals(targetUserId)) {
            return ResponseEntity.badRequest()
                .contentType(MediaType.TEXT_PLAIN)
                .body("자기 자신을 추가할 수 없습니다.");
        }

        // 채팅 목록 업데이트 (발신자)
        ChatList senderChatList = new ChatList();
        senderChatList.setUserId(userId);
        senderChatList.setChatWithId(targetUserId);
        senderChatList.setLastMessage(""); // 초기 메시지 없음
        senderChatList.setLastTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));

        // 채팅 목록 업데이트 (수신자)
        ChatList recipientChatList = new ChatList();
        recipientChatList.setUserId(targetUserId);
        recipientChatList.setChatWithId(userId);
        recipientChatList.setLastMessage("");
        recipientChatList.setLastTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));

        int senderResult = chatService.updateChatList(senderChatList);
        int recipientResult = chatService.updateChatList(recipientChatList);

        if (senderResult > 0 && recipientResult > 0) {
            return ResponseEntity.ok()
                .header("Content-Type", "text/plain; charset=UTF-8")
                .body("사용자가 채팅 목록에 추가되었습니다.");
        } else {
            return ResponseEntity.status(500)
                .header("Content-Type", "text/plain; charset=UTF-8")
                .body("사용자 추가에 실패했습니다.");
        }
    }
}
