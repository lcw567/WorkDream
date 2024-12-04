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
public class ChatHistory {
    private int messageId;        // 메시지 고유 ID
    private String senderId;      // 발신자 ID
    private String recipientId;   // 수신자 ID
    private String message;       // 메시지 내용
    private Timestamp timestamp;  // 메시지 전송 시간
    private String readStatus;    // 읽음 여부 (Y/N)
}
