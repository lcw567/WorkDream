package com.cs.workdream.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cs.workdream.chat.model.vo.ChatHistory;
import com.cs.workdream.chat.model.vo.ChatList;
import com.cs.workdream.chat.service.ChatService;
import com.cs.workdream.member.model.vo.Member;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component("chatServer")
public class ChatServer extends TextWebSocketHandler {

    private final ConcurrentHashMap<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();
    private static final SimpleDateFormat timeFormatter = new SimpleDateFormat("a hh:mm:ss");

    @Autowired
    private ChatService chatService;

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

            // 로그인 시 오프라인 메시지(읽지 않은 메시지) 전송
            sendOfflineMessages(userId);
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

        // 현재 시간
        String formattedTime = timeFormatter.format(new Date());

        // 메시지 객체 생성
        ChatHistory chatHistory = new ChatHistory();
        chatHistory.setSenderId(userId);
        chatHistory.setRecipientId(targetUserId);
        chatHistory.setMessage(messageContent);
        chatHistory.setTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));
        chatHistory.setReadStatus("N");

        // DB에 메시지 저장
        chatService.saveChatMessage(chatHistory);

        // 채팅 목록 업데이트 (발신자)
        ChatList senderChatList = new ChatList();
        senderChatList.setUserId(userId);
        senderChatList.setChatWithId(targetUserId);
        senderChatList.setLastMessage(messageContent);
        senderChatList.setLastTimestamp(chatHistory.getTimestamp());
        chatService.updateChatList(senderChatList);

        // 채팅 목록 업데이트 (수신자)
        ChatList recipientChatList = new ChatList();
        recipientChatList.setUserId(targetUserId);
        recipientChatList.setChatWithId(userId);
        recipientChatList.setLastMessage(messageContent);
        recipientChatList.setLastTimestamp(chatHistory.getTimestamp());
        chatService.updateChatList(recipientChatList);

        // 메시지 JSON 객체 생성
        JsonObject msgVo = new JsonObject();
        msgVo.addProperty("msg", messageContent);
        msgVo.addProperty("userid", userId);
        msgVo.addProperty("targetUserid", targetUserId);
        msgVo.addProperty("time", formattedTime);

        sendMessageToUser(msgVo, chatHistory.getMessageId());
    }

    private void sendMessageToUser(JsonObject msgVo, int messageId) {
        String senderId = msgVo.get("userid").getAsString();
        String targetUserId = msgVo.get("targetUserid").getAsString();

        WebSocketSession senderSession = userSessions.get(senderId);
        WebSocketSession targetSession = userSessions.get(targetUserId);

        if (targetSession != null && targetSession.isOpen()) {
            try {
                msgVo.addProperty("type", "message");
                TextMessage textMessage = new TextMessage(msgVo.toString());
                targetSession.sendMessage(textMessage);
                senderSession.sendMessage(textMessage);

                log.info("Sent message to {}: {}", targetUserId, msgVo.get("msg").getAsString());

                // 메시지 읽음 처리
                chatService.markMessageAsRead(messageId);
            } catch (IOException e) {
                log.error("메시지 전송 실패: {}", e.getMessage());
            }
        } else {
            log.warn("대상 유저({})의 세션이 없습니다.", targetUserId);
            if (senderSession != null && senderSession.isOpen()) {
                try {
                    JsonObject errorJson = new JsonObject();
                    errorJson.addProperty("type", "error");
                    errorJson.addProperty("message", "대상 사용자가 오프라인 상태입니다.");
                    senderSession.sendMessage(new TextMessage(errorJson.toString()));

                    log.info("Sent error message to {}: 대상 사용자가 오프라인 상태입니다.", senderId);
                } catch (IOException e) {
                    log.error("오프라인 알림 전송 실패: {}", e.getMessage());
                }
            }
        }
    }

    // 로그인 시 오프라인 메시지 전송
    private void sendOfflineMessages(String userId) {
        // 읽지 않은 메시지 조회
        List<ChatHistory> offlineMessages = chatService.getChatHistoryForRecipient(userId);

        for (ChatHistory msg : offlineMessages) {
            JsonObject msgVo = new JsonObject();
            msgVo.addProperty("msg", msg.getMessage());
            msgVo.addProperty("userid", msg.getSenderId());
            msgVo.addProperty("targetUserid", msg.getRecipientId());
            msgVo.addProperty("time", timeFormatter.format(msg.getTimestamp()));

            try {
                msgVo.addProperty("type", "message");
                WebSocketSession targetSession = userSessions.get(userId);
                if (targetSession != null && targetSession.isOpen()) {
                    targetSession.sendMessage(new TextMessage(msgVo.toString()));
                    // 메시지 읽음 처리
                    chatService.markMessageAsRead(msg.getMessageId());
                }
            } catch (IOException e) {
                log.error("오프라인 메시지 전송 실패: {}", e.getMessage());
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
