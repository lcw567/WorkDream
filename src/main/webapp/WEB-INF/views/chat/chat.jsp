<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cs.workdream.member.model.vo.Member" %>
<%
    // 서버 측에서 loginUser 객체를 세션에서 가져옴
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
        // 로그인되지 않은 경우, 로그인 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
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
            background-color: #f9f9f9; /* 배경색 추가 */
        }
        .message {
            margin-bottom: 10px;
            padding: 5px; /* 패딩 추가 */
            border-radius: 5px; /* 모서리 둥글게 */
        }
        .message strong {
            color: blue;
        }
        .system-message {
            color: red;
            font-style: italic;
            background-color: #ffe0e0; /* 연한 빨간색 배경 */
        }
        .my-message {
            color: green;
            background-color: #e0ffe0; /* 연한 녹색 배경 */
        }
        .other-message {
            color: black;
            background-color: #e0e0ff; /* 연한 파란색 배경 */
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
        // 현재 사용자의 ID를 서버에서 전달
        const currentUserId = '<c:out value="${loginUser.userId}" />';
        console.log("Current User ID:", currentUserId); // 디버깅 로그

        const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const contextPath = '${pageContext.request.contextPath}';
        const socket = new WebSocket(`${protocol}${window.location.host}${contextPath}/WorkDream/server`);

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
                    // 메시지가 자신이 보낸 것인지 다른 사용자가 보낸 것인지 구분
                    const isMyMessage = data.userid === currentUserId;
                    const className = isMyMessage ? "my-message" : "other-message";
                    const sender = isMyMessage ? "나" : data.userid;
                    appendMessage(sender, data.msg, className);
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
            // 아래 라인은 중복 메시지 출력을 방지하기 위해 주석 처리 또는 삭제합니다.
            // appendMessage("나", msg, "my-message");
            document.getElementById("msg").value = "";
        });

        // 메시지를 화면에 추가
        function appendMessage(sender, message, className) {
            console.log("화면에 추가할 메시지:", sender, message, className); // 디버깅 로그
            const container = document.getElementById("msg-container");
            const messageElement = document.createElement("div");
            messageElement.className = `message ${className}`;
            // 안전한 문자열 결합 사용
            messageElement.innerHTML = '<strong>' + sender + '</strong>: ' + message;
            container.appendChild(messageElement);
            container.scrollTop = container.scrollHeight;
        }
    </script>
</body>
</html>
