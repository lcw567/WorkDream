// communityView.js

document.addEventListener("DOMContentLoaded", function() {
    // 신고 버튼 클릭 시 알림창 표시
    const reportButtons = document.querySelectorAll(".report-button");
    reportButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            alert("신고되었습니다.");
        });
    });

    // 공감 버튼 기능 (게시글)
    const postLikeButton = document.querySelector(".post-buttons .like-button");
    let postLiked = false;
    postLikeButton.addEventListener("click", function() {
        const likeCount = postLikeButton.querySelector(".like-count"); // .like-count 클래스로 변경
        if (postLiked) {
            postLikeButton.classList.remove("liked");
            likeCount.innerText = parseInt(likeCount.innerText) - 1;
        } else {
            postLikeButton.classList.add("liked");
            likeCount.innerText = parseInt(likeCount.innerText) + 1;
        }
        postLiked = !postLiked;
    });

    // 댓글 등록 버튼 클릭 시 댓글 추가
    const commentSubmitButton = document.querySelector(".comment-submit-button");
    commentSubmitButton.addEventListener("click", function() {
        const commentInput = document.querySelector(".comment-input");
        const commentText = commentInput.value.trim();
        if (commentText) {
            addComment(commentText, false);  // 댓글 추가 시 reply=false로 설정
            commentInput.value = ""; // 입력 필드 초기화
        } else {
            alert("댓글 내용을 입력해 주세요.");
        }
    });

    // 댓글의 신고, 공감, 답글 버튼 이벤트 위임
    const commentList = document.querySelector(".comment-list");
    commentList.addEventListener("click", function(event) {
        const target = event.target;

        if (target.classList.contains("comment-report-button")) {
            alert("신고되었습니다.");
        } else if (target.classList.contains("like-button")) {
            const likeBtn = target;
            const likeCountSpan = likeBtn.querySelector("span");
            let likeCount = parseInt(likeCountSpan.innerText);
            if (likeBtn.classList.contains("liked")) {
                likeBtn.classList.remove("liked");
                likeCount--;
            } else {
                likeBtn.classList.add("liked");
                likeCount++;
            }
            likeCountSpan.innerText = likeCount;
        } else if (target.classList.contains("reply-action")) {
            const comment = target.closest(".comment");
            toggleReplyBox(comment);
        }
    });

    // 답글 등록 버튼 클릭 시 답글 추가 (이벤트 위임)
    document.body.addEventListener("click", function(event) {
        if (event.target.classList.contains("reply-submit-button")) {
            const replyBox = event.target.closest(".reply-box");
            const replyInput = replyBox.querySelector(".reply-input");
            const replyText = replyInput.value.trim();
            if (replyText) {
                const parentComment = replyBox.closest(".comment");
                addComment(replyText, true, parentComment);  // reply=true, append to parent comment
                replyInput.value = ""; // 입력 필드 초기화
                replyBox.style.display = "none"; // 답글 입력 박스 숨기기
            } else {
                alert("답글 내용을 입력해 주세요.");
            }
        }
    });

    // 댓글 추가 함수
    function addComment(text, isReply, parentComment = null) {
        const commentList = document.querySelector(".comment-list");
        const comment = document.createElement("div");
        comment.classList.add("comment");
        if (isReply) {
            comment.classList.add("reply");  // 답글일 경우 클래스 추가
        }

        comment.innerHTML = `
            <div class="comment-info">
                <img src="${contextPath}/img/icon_user.png" alt="사용자 아이콘" class="comment-user-icon">
                <span class="comment-user-name">홍길동</span>
                <span class="comment-date">방금 전</span>
                <button class="comment-report-button">신고</button>
            </div>
            <p class="comment-text">${escapeHtml(text)}</p>
            <div class="comment-actions">
                ${!isReply ? '<button class="comment-action reply-action">답글</button>' : ''}  <!-- 댓글에는 답글 버튼 표시, 답글에는 표시 안 함 -->
                <button class="comment-action like-button">👍 <span class="like-count">0</span></button>
            </div>
            ${!isReply ? '<div class="reply-section"></div>' : ''}
        `;

        // 댓글이면 리스트에 추가, 답글이면 특정 댓글의 reply-section에 추가
        if (isReply && parentComment) {
            const replySection = parentComment.querySelector(".reply-section");
            if (replySection) {
                replySection.appendChild(comment);
            }
        } else {
            commentList.appendChild(comment);
        }
    }

    // 답글 박스 토글 함수
    function toggleReplyBox(comment) {
        // 먼저 모든 reply-box를 숨김
        document.querySelectorAll(".reply-box").forEach(function(box) {
            box.style.display = "none";
        });

        // 해당 댓글에 reply-box가 없으면 생성
        let replyBox = comment.querySelector(".reply-box");
        if (!replyBox) {
            replyBox = document.createElement("div");
            replyBox.classList.add("reply-box");
            replyBox.innerHTML = `
                <img src="${contextPath}/img/down-right.png" alt="답글 아이콘" class="down-right">
                <input type="text" placeholder="답변에 댓글을 입력해 보세요." class="reply-input">
                <button class="reply-submit-button">등록</button>
            `;
            comment.appendChild(replyBox);
        }

        // 토글
        if (replyBox.style.display === "flex") {
            replyBox.style.display = "none";
        } else {
            replyBox.style.display = "flex";
        }
    }

    // XSS 방지용 HTML 이스케이프 함수
    function escapeHtml(text) {
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return text.replace(/[&<>"']/g, function(m) { return map[m]; });
    }
});
