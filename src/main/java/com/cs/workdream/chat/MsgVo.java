package com.cs.workdream.chat;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MsgVo implements Serializable {
    private String msg; // 메시지 내용
    private String userid; // 발신자 ID
    private String targetUserid; // 수신자 ID
    private String time; // 전송 시간
}
