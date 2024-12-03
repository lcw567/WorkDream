<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WorkDream 채팅</title>
    <style>
        #msg-container {
            border: 1px solid #ccc;
            width: 500px;
            height: 300px;
            overflow-y: auto;
            padding: 10px;
        }
        .message {
            margin-bottom: 10px;
        }
        .message strong {
            color: blue;
        }
        .system-message {
            color: red;
            font-style: italic;
        }
        .my-message {
            color: green;
        }
    </style>
</head>
<body>
    <h1>채팅</h1>
    <form id="chat-form">
        메시지: <input type="text" id="msg" required>
        수신자: <input type="text" id="target" required>
        <button type="submit">전송</button>
    </form>
    <div id="msg-container"></div>

    <script>
        const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const contextPath = '${pageContext.request.contextPath}';
        const socket = new WebSocket(`${protocol}${window.location.host}/WorkDream/server`);

        // WebSocket 연결 성공 이벤트
        socket.onopen = () => {
            appendMessage("시스템", "WebSocket 연결이 성공적으로 열렸습니다.", "system-message");
        };

        // 메시지 수신 이벤트
        socket.onmessage = (event) => {
            try {
                const data = JSON.parse(event.data);
                console.log("수신된 메시지 데이터:", data); // 디버깅 로그
                if (data.type === 'error') {
                    appendMessage("시스템", data.message, "system-message");
                } else if (data.type === 'message') {
                    appendMessage(data.userid, data.msg, "message");
                }
            } catch (err) {
                console.error("수신 메시지 처리 중 오류:", err);
            }
        };

        // WebSocket 연결 종료 이벤트
        socket.onclose = () => {
            appendMessage("시스템", "WebSocket 연결이 종료되었습니다.", "system-message");
        };

        // WebSocket 오류 발생 이벤트
        socket.onerror = (error) => {
            appendMessage("시스템", "WebSocket 오류가 발생했습니다.", "system-message");
        };

        // 메시지 전송
        document.getElementById("chat-form").addEventListener("submit", (e) => {
            e.preventDefault();

            const msg = document.getElementById("msg").value.trim();
            const target = document.getElementById("target").value.trim();

            if (!msg || !target) {
                alert("메시지와 수신자 정보를 입력하세요.");
                return;
            }

            const messageData = { message: msg, target };
            socket.send(JSON.stringify(messageData));
            appendMessage("나", msg, "my-message");
            document.getElementById("msg").value = "";
        });

        // 메시지를 화면에 추가
        function appendMessage(sender, message, className) {
            console.log("화면에 추가할 메시지:", sender, message, className); // 디버깅 로그
            const container = document.getElementById("msg-container");
            const messageElement = document.createElement("div");
            messageElement.className = "message " + className;
            messageElement.innerHTML = `<strong>${sender}</strong>: ${message}`;
            container.appendChild(messageElement);
            container.scrollTop = container.scrollHeight;
        }
    </script>
</body>
</html>
