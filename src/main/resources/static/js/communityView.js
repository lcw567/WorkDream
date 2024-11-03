document.addEventListener("DOMContentLoaded", function() {
    
    // 신고 버튼 클릭 시 알림창 표시
    document.querySelector(".report-button").addEventListener("click", function() {
        alert("신고되었습니다.");
    });

    // 공감 버튼 기능
    const likeButton = document.querySelector(".like-button");
    let liked = false;
    likeButton.addEventListener("click", function() {
        const likeCount = likeButton.querySelector("span");
        if (liked) {
            likeButton.classList.remove("liked");
            likeCount.innerText = parseInt(likeCount.innerText) - 1;
        } else {
            likeButton.classList.add("liked");
            likeCount.innerText = parseInt(likeCount.innerText) + 1;
        }
        liked = !liked;
    });

    // 댓글 등록 버튼 클릭 시 댓글 추가
    document.querySelector(".comment-submit-button").addEventListener("click", function() {
        const commentText = document.querySelector(".comment-input").value.trim();
        if (commentText) {
            addComment(commentText, false);  // 댓글 추가 시 reply=false로 설정
            document.querySelector(".comment-input").value = ""; // 입력 필드 초기화
        } else {
            alert("댓글 내용을 입력해 주세요.");
        }
    });

    // 답글 버튼 클릭 시 답글 입력 박스 표시
    document.querySelector(".comment-list").addEventListener("click", function(event) {
        if (event.target.classList.contains("reply-button")) {
            const replyBox = document.querySelector(".reply-box");
            replyBox.style.display = "flex";
            event.target.closest(".comment").appendChild(replyBox);
        }
    });

    // 답글 등록 버튼 클릭 시 답글 추가
    document.querySelector(".reply-submit-button").addEventListener("click", function() {
        const replyText = document.querySelector(".reply-input").value.trim();
        if (replyText) {
            const replyBox = document.querySelector(".reply-box");
            addComment(replyText, true);  // 답글 추가 시 reply=true로 설정
            replyBox.style.display = "none"; // 답글 입력 박스 숨기기
            document.querySelector(".reply-input").value = ""; // 입력 필드 초기화
        } else {
            alert("답글 내용을 입력해 주세요.");
        }
    });

    // 댓글 또는 답글 추가 함수
    function addComment(text, isReply) {
        const commentList = document.querySelector(".comment-list");
        const comment = document.createElement("div");
        comment.classList.add("comment");
        if (isReply) {
            comment.classList.add("reply");  // 답글일 경우 클래스 추가
        }

        comment.innerHTML = `
            <div class="comment-info">
                <img src="user-icon.png" alt="User Icon" class="comment-user-icon">
                <span class="comment-user-name">홍길동</span>
                <span class="comment-date">방금 전</span>
                <button class="comment-report-button">신고</button>
            </div>
            <p class="comment-text">${text}</p>
            <div class="comment-actions">
                ${!isReply ? '<button class="comment-action reply-button">답글</button>' : ''}  <!-- 댓글에는 답글 버튼 표시, 답글에는 표시 안 함 -->
                <button class="comment-action like-button">👍 0</button>
            </div>`;

        // 댓글이면 리스트에 추가, 답글이면 댓글 아래 추가
        if (isReply) {
            document.querySelector(".reply-box").insertAdjacentElement("beforebegin", comment);
        } else {
            commentList.appendChild(comment);
        }
    }

    // 댓글의 신고 및 공감 버튼 이벤트 위임
    document.querySelector(".comment-list").addEventListener("click", function(event) {
        if (event.target.classList.contains("comment-report-button")) {
            alert("신고되었습니다.");
        } else if (event.target.classList.contains("like-button")) {
            const likeBtn = event.target;
            const likeCount = likeBtn.innerText.match(/\d+/) ? parseInt(likeBtn.innerText.match(/\d+/)[0]) : 0;
            likeBtn.innerText = likeBtn.innerText.includes("👍") ? `👍 ${likeCount + 1}` : `👍 ${likeCount - 1}`;
            likeBtn.classList.toggle("liked");
        }
    });
});
