package com.cs.workdream.chat;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.cs.workdream.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatServer extends TextWebSocketHandler {

    private final ConcurrentHashMap<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser != null) {
            String userId = loginUser.getUserId();
            userSessions.put(userId, session);
            log.info("WebSocket 연결됨: UserID = {}", userId);
        } else {
            log.warn("로그인 유저 정보가 없는 세션입니다.");
            session.close(CloseStatus.BAD_DATA);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser == null) {
            log.warn("로그인 유저 정보가 없는 세션에서 메시지 전송됨.");
            session.close(CloseStatus.BAD_DATA);
            return;
        }

        String userId = loginUser.getUserId();
        JsonObject json = JsonParser.parseString(message.getPayload()).getAsJsonObject();
        String messageContent = json.get("message").getAsString();
        String targetUserId = json.get("target").getAsString();

        MsgVo msgVo = new MsgVo();
        msgVo.setMsg(messageContent);
        msgVo.setUserid(userId);
        msgVo.setTargetUserid(targetUserId);
        msgVo.setTime(new Date().toString());

        sendMessageToUser(msgVo);
    }

    private void sendMessageToUser(MsgVo msgVo) {
        WebSocketSession senderSession = userSessions.get(msgVo.getUserid());
        WebSocketSession targetSession = userSessions.get(msgVo.getTargetUserid());

        if (targetSession != null && targetSession.isOpen()) {
            try {
                String messageJson = new Gson().toJson(msgVo);
                TextMessage textMessage = new TextMessage(messageJson);
                targetSession.sendMessage(textMessage);
                senderSession.sendMessage(textMessage);
            } catch (IOException e) {
                log.error("메시지 전송 실패: {}", e.getMessage());
            }
        } else {
            log.warn("대상 유저({})의 세션이 없습니다.", msgVo.getTargetUserid());
            if (senderSession != null && senderSession.isOpen()) {
                try {
                    senderSession.sendMessage(new TextMessage("대상 사용자가 오프라인 상태입니다."));
                } catch (IOException e) {
                    log.error("오프라인 알림 전송 실패: {}", e.getMessage());
                }
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser != null) {
            String userId = loginUser.getUserId();
            userSessions.remove(userId);
            log.info("WebSocket 연결 해제됨: UserID = {}", userId);
        }
        super.afterConnectionClosed(session, status);
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        log.error("WebSocket 오류: 세션 ID = {}, 오류 메시지 = {}", session.getId(), exception.getMessage());
        session.close(CloseStatus.SERVER_ERROR);
    }
}
