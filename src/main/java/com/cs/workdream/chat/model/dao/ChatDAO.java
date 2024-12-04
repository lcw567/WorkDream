package com.cs.workdream.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;

@Repository
public class ChatDAO {

    @Autowired
    private SqlSession sqlSession;

    // 채팅 메시지 저장
    public int insertChatMessage(ChatHistory chatHistory) {
        return sqlSession.insert("ChatMapper.insertChatMessage", chatHistory);
    }

    // 특정 사용자의 채팅 목록 조회
    public List<ChatList> selectChatList(String userId) {
        return sqlSession.selectList("ChatMapper.selectChatList", userId);
    }

    // 채팅 목록에 추가 또는 업데이트
    public int upsertChatList(ChatList chatList) {
        // 기존에 채팅 목록이 있는지 확인
        int count = sqlSession.selectOne("ChatMapper.countChatList", chatList);
        if (count > 0) {
            // 업데이트
            return sqlSession.update("ChatMapper.updateChatList", chatList);
        } else {
            // 삽입
            return sqlSession.insert("ChatMapper.insertChatList", chatList);
        }
    }

    // 특정 사용자의 채팅 기록 조회
    public List<ChatHistory> selectChatHistory(String userId, String chatWithId) {
        // 파라미터를 Map으로 전달
        return sqlSession.selectList("ChatMapper.selectChatHistory", 
            new ChatHistoryQuery(userId, chatWithId));
    }

    // 메시지 읽음 처리
    public int updateReadStatus(int messageId) {
        return sqlSession.update("ChatMapper.updateReadStatus", messageId);
    }
    
    // 수신자의 읽지 않은 메시지 조회
    public List<ChatHistory> selectUnreadMessages(String recipientId) {
        return sqlSession.selectList("ChatMapper.selectUnreadMessages", recipientId);
    }

    // 내부 클래스 for query parameters
    private static class ChatHistoryQuery {
        private String userId;
        private String chatWithId;

        public ChatHistoryQuery(String userId, String chatWithId) {
            this.userId = userId;
            this.chatWithId = chatWithId;
        }

        public String getUserId() {
            return userId;
        }

        public String getChatWithId() {
            return chatWithId;
        }
    }
}
