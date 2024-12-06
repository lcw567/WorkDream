package com.cs.workdream.chat.service;

import java.util.List;

import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;

public interface ChatService {
    // 채팅 메시지 저장
    int saveChatMessage(ChatHistory chatHistory);

    // 사용자 채팅 목록 조회
    List<ChatList> getChatList(String userId);

    // 채팅 목록 업데이트
    int updateChatList(ChatList chatList);

    // 채팅 기록 조회
    List<ChatHistory> getChatHistory(String userId, String chatWithId);

    // 메시지 읽음 처리
    int markMessageAsRead(int messageId);
    
    // 수신자의 읽지 않은 메시지 조회
    List<ChatHistory> getChatHistoryForRecipient(String recipientId);
    
    // 사용자 목록 삭제
    int deleteChatList(String userId, String chatWithId);
}
