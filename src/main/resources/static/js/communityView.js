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
        const likeCount = postLikeButton.querySelector(".like-count");
        if (postLiked) {
            postLikeButton.classList.remove("liked");
            likeCount.innerText = parseInt(likeCount.innerText) - 1;
        } else {
            postLikeButton.classList.add("liked");
            likeCount.innerText = parseInt(likeCount.innerText) + 1;
        }
        postLiked = !postLiked;
        // 선택적으로, 서버에 공감 수를 전송할 수 있습니다.
    });

    // 댓글 등록 버튼 클릭 시 댓글 추가
    const commentSubmitButton = document.querySelector(".comment-submit-button");
    commentSubmitButton.addEventListener("click", function() {
        const commentInput = document.querySelector(".comment-input");
        const commentText = commentInput.value.trim();
        if (commentText) {
            // AJAX를 통해 댓글을 서버에 전송
            const postId = new URLSearchParams(window.location.search).get('postId');
            // 실제 사용자 정보는 세션이나 다른 방법으로 가져와야 합니다.
            const userId = "홍길동"; // 실제 사용자 정보로 대체 필요
            const data = {
                postingNo: postId,
                content: commentText
                // userNo는 세션/사용자 컨텍스트에서 가져와야 합니다.
            };

            fetch(`${contextPath}/board/api/replies`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(result => {
                if(result.status === "success") {
                    // 댓글이 성공적으로 등록되면 댓글 목록을 새로고침
                    loadReplies();
                    commentInput.value = "";
                } else {
                    alert("댓글 등록에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error("Error adding reply:", error);
                alert("댓글 등록 중 오류가 발생했습니다.");
            });
        } else {
            alert("댓글 내용을 입력해 주세요.");
        }
    });

    // 댓글의 신고, 공감, 삭제 버튼 이벤트 위임
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
            // 선택적으로, 서버에 공감 수를 전송할 수 있습니다.
        } else if (target.classList.contains("comment-delete-button")) {
            const comment = target.closest(".comment");
            const replyNo = comment.getAttribute("data-reply-no");
            if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
                // AJAX를 통해 댓글 삭제 요청
                fetch(`${contextPath}/board/api/replies/${replyNo}`, {
                    method: "DELETE"
                })
                .then(response => response.json())
                .then(result => {
                    if(result.status === "success") {
                        comment.remove();
                        // 댓글 수 업데이트
                        const rcount = document.getElementById('rcount');
                        rcount.innerText = parseInt(rcount.innerText) - 1;
                    } else {
                        alert("댓글 삭제에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error("Error deleting reply:", error);
                    alert("댓글 삭제 중 오류가 발생했습니다.");
                });
            }
        }
    });

    // 댓글 목록 로드 함수
    function loadReplies() {
        const postId = new URLSearchParams(window.location.search).get('postId');

        fetch(`${contextPath}/board/api/replies?postId=${postId}`)
            .then(response => response.json())
            .then(data => {
                populateReplies(data.replies);
                setReplyCount(data.replies.length);
            })
            .catch(error => console.error("Error loading replies:", error));
    }

    // 댓글 목록 업데이트 함수
    function populateReplies(replies) {
        const replyBody = document.querySelector(".comment-list");
        replyBody.innerHTML = '';

        replies.forEach(reply => {
            const replyDiv = document.createElement("div");
            replyDiv.classList.add("comment");
            replyDiv.setAttribute("data-reply-no", reply.replyNo);
            replyDiv.innerHTML = `
                <div class="comment-info">
                    <img src="${contextPath}/img/icon_user.png" alt="사용자 아이콘" class="comment-user-icon">
                    <span class="comment-user-name">${reply.author}</span>
                    <span class="comment-date">${new Date(reply.createdTime).toLocaleString()}</span>
                    <button class="comment-report-button">신고</button>
                    <button class="comment-delete-button">삭제</button>
                </div>
                <p class="comment-text">${escapeHtml(reply.content)}</p>
                <div class="comment-actions">
                    <button class="comment-action like-button">👍 <span class="like-count">${reply.likeCount}</span></button>
                </div>
            `;
            replyBody.appendChild(replyDiv);
        });
    }

    // 댓글 수 업데이트 함수
    function setReplyCount(count) {
        document.getElementById('rcount').innerText = count;
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

    // 초기 로드 시 댓글 목록 불러오기
    loadReplies();
});
