package com.cs.workdream.chat.model.vo;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatList {
    private int id;                    // 채팅 목록 고유 ID
    private String userId;             // 사용자 ID
    private String chatWithId;         // 채팅 대상 사용자 ID
    private String lastMessage;        // 마지막 메시지 내용
    private Timestamp lastTimestamp;   // 마지막 메시지 시간
    
    public ChatList(String userId, String chatWithId, String lastMessage, Timestamp lastTimestamp) {
        this.userId = userId;
        this.chatWithId = chatWithId;
        this.lastMessage = lastMessage;
        this.lastTimestamp = lastTimestamp;
    }
}
