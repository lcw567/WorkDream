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
        }
        .message {
            margin-bottom: 10px;
        }
        .message strong {
            color: blue;
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
	    const socket = new WebSocket(`${protocol}${window.location.host}/WorkDream/server`);
	
	    // WebSocket 상태 확인
	    const checkWebSocketOpen = () => {
	        if (socket.readyState !== WebSocket.OPEN) {
	            alert("WebSocket 연결이 열려 있지 않습니다. 다시 시도하세요.");
	            return false;
	        }
	        return true;
	    };
	
	    // WebSocket 연결 성공 이벤트
	    socket.onopen = () => {
	        console.log("WebSocket 연결 성공");
	        appendMessage("시스템", "WebSocket 연결이 성공적으로 열렸습니다.");
	    };
	
	    // 메시지 수신 이벤트
	    socket.onmessage = (event) => {
	        try {
	            const data = JSON.parse(event.data);
	            appendMessage(data.userid, data.msg);
	        } catch (err) {
	            console.error("수신 메시지 처리 중 오류:", err);
	        }
	    };
	
	    // WebSocket 연결 종료 이벤트
	    socket.onclose = () => {
	        console.log("WebSocket 연결 종료");
	        appendMessage("시스템", "WebSocket 연결이 종료되었습니다.");
	    };
	
	    // WebSocket 오류 발생 이벤트
	    socket.onerror = (error) => {
	        console.error("WebSocket 오류 발생:", error);
	        appendMessage("시스템", "WebSocket 오류가 발생했습니다.");
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
	
	        // WebSocket 연결 상태 확인 후 메시지 전송
	        if (checkWebSocketOpen()) {
	            try {
	                const messageData = JSON.stringify({ message: msg, target });
	                socket.send(messageData);
	                appendMessage("나", msg); // 발신자 메시지 표시
	                document.getElementById("msg").value = "";
	            } catch (err) {
	                console.error("메시지 전송 중 오류:", err);
	            }
	        }
	    });
	
	    // 메시지를 화면에 추가
	    function appendMessage(sender, message) {
	        const container = document.getElementById("msg-container");
	        const messageElement = document.createElement("div");
	        messageElement.className = "message";
	        messageElement.innerHTML = `<strong>${sender}</strong>: ${message}`;
	        container.appendChild(messageElement);
	        container.scrollTop = container.scrollHeight; // 스크롤 아래로 이동
	    }
	</script>
</body>
</html>
