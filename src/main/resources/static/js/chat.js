const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
const socket = new WebSocket(`${protocol}${window.location.host}/WorkDream/server`);

socket.onopen = () => {
    appendMessage("시스템", "WebSocket 연결이 성공적으로 열렸습니다.", "system-message");
};

socket.onmessage = (event) => {
    try {
        const data = JSON.parse(event.data);
        if (data.type === 'error') {
            appendMessage("시스템", data.message, "system-message");
        } else if (data.type === 'message') {
            const isMyMessage = data.userid === currentUserId;

            // 중복 방지: 서버에서 온 메시지만 표시
            if (!isMyMessage || !document.querySelector(`[data-msg-id="${data.time}-${data.userid}"]`)) {
                const className = isMyMessage ? "my-message" : "other-message";
                appendMessage(
                    isMyMessage ? "나" : data.userid,
                    `${data.msg} <span class="msg-time">(${data.time})</span>`,
                    className,
                    `${data.time}-${data.userid}` // 메시지의 고유 ID 설정
                );
            }
        }
    } catch (err) {
        console.error("수신 메시지 처리 중 오류:", err);
    }
};

socket.onclose = () => {
    appendMessage("시스템", "WebSocket 연결이 종료되었습니다.", "system-message");
};

socket.onerror = () => {
    appendMessage("시스템", "WebSocket 오류가 발생했습니다.", "system-message");
};

document.getElementById("chat-form").addEventListener("submit", (e) => {
    e.preventDefault();

    const msg = document.getElementById("msg").value.trim();
    const target = document.getElementById("target").value.trim();

    if (!msg || !target) {
        alert("메시지와 수신자 정보를 입력하세요.");
        return;
    }

    // 서버로 메시지 전송 (화면에는 추가하지 않음)
    socket.send(JSON.stringify({ message: msg, target }));

    // 입력 필드 초기화
    document.getElementById("msg").value = "";
});

function appendMessage(sender, message, className, msgId = "") {
    const container = document.getElementById("msg-container");
    const messageElement = document.createElement("div");
    messageElement.className = `message ${className}`;
    if (msgId) {
        messageElement.setAttribute("data-msg-id", msgId); // 고유 ID 설정
    }
    messageElement.innerHTML = `<strong>${sender}</strong>: ${message}`;
    container.appendChild(messageElement);
    container.scrollTop = container.scrollHeight;
}
