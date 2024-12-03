package com.cs.workdream.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.cs.workdream.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component("chatServer")
public class ChatServer extends TextWebSocketHandler {

    private final ConcurrentHashMap<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();
    private static final SimpleDateFormat timeFormatter = new SimpleDateFormat("a hh:mm:ss");

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser != null) {
            String userId = loginUser.getUserId();

            // 기존 세션 제거
            WebSocketSession existingSession = userSessions.put(userId, session);
            if (existingSession != null && existingSession.isOpen()) {
                existingSession.close(CloseStatus.NORMAL);
            }

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

        log.info("Received message from {} to {}: {}", userId, targetUserId, messageContent);

        JsonObject msgVo = new JsonObject();
        msgVo.addProperty("msg", messageContent);
        msgVo.addProperty("userid", userId);
        msgVo.addProperty("targetUserid", targetUserId);

        // 시간 포맷 적용
        String formattedTime = timeFormatter.format(new Date());
        msgVo.addProperty("time", formattedTime);

        sendMessageToUser(msgVo);
    }

    private void sendMessageToUser(JsonObject msgVo) {
        WebSocketSession senderSession = userSessions.get(msgVo.get("userid").getAsString());
        WebSocketSession targetSession = userSessions.get(msgVo.get("targetUserid").getAsString());

        if (targetSession != null && targetSession.isOpen()) {
            try {
                msgVo.addProperty("type", "message");
                TextMessage textMessage = new TextMessage(msgVo.toString());
                targetSession.sendMessage(textMessage);
                senderSession.sendMessage(textMessage);

                log.info("Sent message to {}: {}", msgVo.get("targetUserid").getAsString(), msgVo.get("msg").getAsString());
            } catch (IOException e) {
                log.error("메시지 전송 실패: {}", e.getMessage());
            }
        } else {
            log.warn("대상 유저({})의 세션이 없습니다.", msgVo.get("targetUserid").getAsString());
            if (senderSession != null && senderSession.isOpen()) {
                try {
                    JsonObject errorJson = new JsonObject();
                    errorJson.addProperty("type", "error");
                    errorJson.addProperty("message", "대상 사용자가 오프라인 상태입니다.");
                    senderSession.sendMessage(new TextMessage(errorJson.toString()));

                    log.info("Sent error message to {}: 대상 사용자가 오프라인 상태입니다.", msgVo.get("userid").getAsString());
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
