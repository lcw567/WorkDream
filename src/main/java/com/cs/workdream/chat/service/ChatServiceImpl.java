package com.cs.workdream.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.chat.model.dao.ChatDAO;
import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDAO chatDAO;

    @Override
    public int saveChatMessage(ChatHistory chatHistory) {
        return chatDAO.insertChatMessage(chatHistory);
    }

    @Override
    public List<ChatList> getChatList(String userId) {
        return chatDAO.selectChatList(userId);
    }

    @Override
    public int updateChatList(ChatList chatList) {
        return chatDAO.upsertChatList(chatList);
    }

    @Override
    public List<ChatHistory> getChatHistory(String userId, String chatWithId) {
        return chatDAO.selectChatHistory(userId, chatWithId);
    }

    @Override
    public int markMessageAsRead(int messageId) {
        return chatDAO.updateReadStatus(messageId);
    }

    @Override
    public List<ChatHistory> getChatHistoryForRecipient(String recipientId) {
        return chatDAO.selectUnreadMessages(recipientId);
    }
    
    @Override
    public int deleteChatList(String userId, String chatWithId) {
        return chatDAO.deleteChatList(userId, chatWithId);
    }
}