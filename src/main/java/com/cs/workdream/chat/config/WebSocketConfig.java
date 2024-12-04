package com.cs.workdream.chat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.cs.workdream.chat.ChatServer;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Autowired
    private ChatServer chatServer; // ChatServer를 WebSocket 핸들러로 사용

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(chatServer, "/server")
                .addInterceptors(new HttpSessionHandshakeInterceptor()) // 세션 속성 전달
                .setAllowedOrigins("*") // 실제 서비스 시 보안을 위해 제한 필요
                .withSockJS();
    }
}
