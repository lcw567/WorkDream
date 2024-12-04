// chat.js

// 채팅 목록 요소 가져오기
const chatList = document.getElementById('chat-list');

let selectedUserId = null; // 현재 선택된 사용자

// 디버깅용 로그 추가
console.log("chat.js 시작");
console.log("contextPath:", window.contextPath);
console.log("currentUserId:", window.currentUserId);

// WebSocket 연결 초기화
const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
let socketURL = `${protocol}${window.location.host}${window.contextPath}/server`;

console.log("WebSocket URL:", socketURL);

let socket;

try {
    socket = new WebSocket(socketURL);
} catch (error) {
    console.error('WebSocket 초기화 오류:', error);
}

// WebSocket 연결 이벤트 처리
socket.onopen = () => {
    updateStatusIndicator('Online', 'online', 'offline');
    appendMessage('시스템', 'WebSocket 연결이 성공적으로 열렸습니다.', 'system-message');
};

socket.onclose = () => {
    updateStatusIndicator('Offline', 'offline', 'online');
    appendMessage('시스템', 'WebSocket 연결이 종료되었습니다.', 'system-message');

    // WebSocket 재연결 시도
    setTimeout(() => {
        try {
            socket = new WebSocket(`${protocol}${window.location.host}${window.contextPath}/server`);
        } catch (error) {
            console.error('WebSocket 재연결 오류:', error);
        }
    }, 3000);
};

socket.onmessage = (event) => {
    const data = JSON.parse(event.data);

    if (data.type === 'message') {
        // 채팅창이 선택된 사용자와 일치하는 경우에만 메시지 표시
        if (data.userid === selectedUserId || data.targetUserid === selectedUserId) {
            const className = data.userid === window.currentUserId ? 'my-message' : 'other-message';
            appendMessage(data.userid, data.msg, className, data.time);
        }
    } else if (data.type === 'error') {
        alert(data.message);
    }
};

// 상태 표시 업데이트 함수
function updateStatusIndicator(text, addClass, removeClass) {
    const statusIndicator = document.getElementById('status-indicator');
    statusIndicator.textContent = text;
    statusIndicator.classList.add(addClass);
    statusIndicator.classList.remove(removeClass);
}

// 채팅 목록에 사용자 추가 함수
function addUserToChatList(userId) {
    if (!userId || !/^[a-zA-Z0-9]+$/.test(userId)) {
        alert('유효한 사용자 ID를 입력하세요 (영문, 숫자만 허용).');
        return;
    }

    if (document.querySelector(`#chat-list li[data-userid="${userId}"]`)) {
        alert('이미 존재하는 사용자입니다.');
        return;
    }

    // 서버에 사용자 추가 요청
    fetch(`${window.contextPath}/chat/addUser`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            targetUserId: userId
        })
    })
    .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            return response.text().then(text => { throw new Error(text) });
        }
    })
    .then(message => {
        if (message === "사용자가 채팅 목록에 추가되었습니다.") {
            appendMessage('시스템', `${userId} 사용자가 목록에 추가되었습니다.`, 'system-message');
            // 채팅 목록 다시 로드
            loadChatList();
        } else {
            alert(message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert(`사용자 추가 중 오류가 발생했습니다: ${error.message}`);
    });
}

// 채팅 목록 로드 함수
function loadChatList() {
    fetch(`${window.contextPath}/chat/list`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log("Fetched chat list:", data); // 디버깅용 로그 추가
            chatList.innerHTML = '';
            data.forEach(chat => {
                const li = document.createElement('li');
                li.textContent = chat.chatWithId;
                li.dataset.userid = chat.chatWithId;
                li.onclick = () => selectChat(chat.chatWithId);
                if (chat.chatWithId === selectedUserId) {
                    li.classList.add('active');
                }
                chatList.appendChild(li);
            });
        })
        .catch(error => console.error('Error:', error));
}

// 채팅 목록 초기 로드
document.addEventListener('DOMContentLoaded', () => {
    loadChatList();
});

// 채팅 목록에서 사용자 선택 함수
function selectChat(userId) {
    selectedUserId = userId;
    document.getElementById('msg-container').innerHTML = '';

    document.querySelectorAll('#chat-list li').forEach((li) => li.classList.remove('active'));
    const selectedListItem = document.querySelector(`#chat-list li[data-userid="${userId}"]`);
    if (selectedListItem) selectedListItem.classList.add('active');

    appendMessage('시스템', `${userId}님과의 채팅을 시작합니다.`, 'system-message');

    // 채팅 기록 로드
    loadChatHistory(userId);
}

// 채팅 기록 로드 함수
function loadChatHistory(userId) {
    fetch(`${window.contextPath}/chat/history?chatWithId=${encodeURIComponent(userId)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            data.forEach(msg => {
                const className = msg.senderId === window.currentUserId ? 'my-message' : 'other-message';
                appendMessage(msg.senderId, msg.message, className, new Date(msg.timestamp).toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' }));
            });
        })
        .catch(error => console.error('Error:', error));
}

// 메시지 전송
document.getElementById('chat-form').addEventListener('submit', (e) => {
    e.preventDefault();

    if (!selectedUserId) {
        alert('먼저 채팅할 사용자를 선택하세요.');
        return;
    }

    const msgInput = document.getElementById('msg');
    const msg = msgInput.value.trim();
    if (!msg) return;

    if (socket.readyState !== WebSocket.OPEN) {
        alert('WebSocket 연결이 끊어졌습니다. 다시 시도하세요.');
        return;
    }

    socket.send(JSON.stringify({ message: msg, target: selectedUserId }));
    msgInput.value = '';

    appendMessage('나', msg, 'my-message');
});

// 메시지 추가 함수
function appendMessage(sender, message, className, time = null) {
    const container = document.getElementById('msg-container');
    const messageElement = document.createElement('div');
    messageElement.className = `message ${className}`;
    
    // 시간 표시가 없으면 현재 시간 사용
    if (!time) {
        time = new Date().toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
    }
    
    messageElement.innerHTML = `
        <strong>${sender}</strong>: ${message}
        <div class="msg-time">${time}</div>
    `;
    container.appendChild(messageElement);

    // 메시지 창 자동 스크롤
    container.scrollTop = container.scrollHeight;
}

// 사용자 추가 버튼 이벤트
document.getElementById('add-user-btn').addEventListener('click', () => {
    const userId = prompt('추가할 사용자 ID를 입력하세요:');
    if (userId) addUserToChatList(userId);
});
