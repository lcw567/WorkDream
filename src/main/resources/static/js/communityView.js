document.addEventListener("DOMContentLoaded", function() {
    // 컨텍스트 경로 가져오기
    const contextPath = window.contextPath; // 글로벌 변수로 설정된 contextPath 사용
    let postLikedBool = Boolean(postLiked); // 'let'으로 변경하여 재할당 가능하도록 설정

    // 수정 버튼 기능
    const editButton = document.querySelector(".edit-button");
    if (editButton) {
        editButton.addEventListener("click", function() {
            const postId = new URLSearchParams(window.location.search).get('postId');
            window.location.href = `${contextPath}/board/editPost?postId=${postId}`;
        });
    }

    // 삭제 버튼 기능
    const deleteButton = document.querySelector(".delete-button");
    if (deleteButton) {
        deleteButton.addEventListener("click", function() {
            if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                const postId = new URLSearchParams(window.location.search).get('postId');
                fetch(`${contextPath}/board/api/posts/${postId}`, {
                    method: "DELETE",
                    headers: {
                        "Content-Type": "application/json"
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 올바르지 않습니다');
                    }
                    return response.json();
                })
                .then(result => {
                    if (result.status === "success") {
                        alert("게시글이 삭제되었습니다.");
                        window.location.href = `${contextPath}/board/communityList`;
                    } else {
                        alert("게시글 삭제에 실패했습니다: " + result.message);
                    }
                })
                .catch(error => {
                    console.error("게시글 삭제 중 오류가 발생했습니다:", error);
                    alert("게시글 삭제 중 오류가 발생했습니다.");
                });
            }
        });
    }

    // 신고 버튼 기능
    const reportButtons = document.querySelectorAll(".report-button");
    reportButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            alert("신고되었습니다.");
        });
    });

    // 공감 버튼 기능 (게시글)
    const postLikeButton = document.querySelector(".post-buttons .like-button");
    if(postLikeButton) {
        if(postLikedBool) {
            postLikeButton.classList.add("liked");
        }
        postLikeButton.addEventListener("click", function() {
            const likeCount = postLikeButton.querySelector(".like-count");
            const postId = new URLSearchParams(window.location.search).get('postId');
            if (postLikedBool) {
                // 공감 취소 요청
                fetch(`${contextPath}/board/api/posts/${postId}/unlike`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 올바르지 않습니다');
                    }
                    return response.json();
                })
                .then(result => {
                    if(result.status === "success") {
                        postLikeButton.classList.remove("liked");
                        likeCount.innerText = parseInt(likeCount.innerText) - 1;
                        postLikedBool = false;
                    } else {
                        alert("공감 취소에 실패했습니다: " + result.message);
                    }
                })
                .catch(error => {
                    console.error("공감 취소 중 오류가 발생했습니다:", error);
                    alert("공감 취소 중 오류가 발생했습니다.");
                });
            } else {
                // 공감 요청
                fetch(`${contextPath}/board/api/posts/${postId}/like`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 올바르지 않습니다');
                    }
                    return response.json();
                })
                .then(result => {
                    if(result.status === "success") {
                        postLikeButton.classList.add("liked");
                        likeCount.innerText = parseInt(likeCount.innerText) + 1;
                        postLikedBool = true;
                    } else {
                        alert("공감에 실패했습니다: " + result.message);
                    }
                })
                .catch(error => {
                    console.error("공감 중 오류가 발생했습니다:", error);
                    alert("공감 중 오류가 발생했습니다.");
                });
            }
        });
    }

    // 댓글 등록 버튼 클릭 시 댓글 추가
    const commentSubmitButton = document.querySelector(".comment-submit-button");
    if(commentSubmitButton) { // 요소 존재 여부 확인
        commentSubmitButton.addEventListener("click", function() {
            const commentInput = document.querySelector(".comment-input");
            const commentText = commentInput.value.trim();
            if (commentText) {
                // AJAX를 통해 댓글을 서버에 전송
                const postId = new URLSearchParams(window.location.search).get('postId');
                const data = {
                    postingNo: parseInt(postId, 10), // 숫자로 변환
                    content: commentText
                    // userNo는 서버에서 처리됨
                };

                fetch(`${contextPath}/board/api/replies`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(data)
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 올바르지 않습니다');
                    }
                    return response.json();
                })
                .then(result => {
                    if(result.status === "success") {
                        // 댓글이 성공적으로 등록되면 댓글 목록을 새로고침
                        loadReplies();
                        commentInput.value = "";
                    } else {
                        alert("댓글 등록에 실패했습니다: " + result.message);
                    }
                })
                .catch(error => {
                    console.error("댓글 등록 중 오류가 발생했습니다:", error);
                    alert("댓글 등록 중 오류가 발생했습니다.");
                });
            } else {
                alert("댓글 내용을 입력해 주세요.");
            }
        });
    }

    // 댓글의 신고, 공감, 삭제 버튼 이벤트 위임
    const commentList = document.querySelector(".comment-list");
    if(commentList) { // 요소 존재 여부 확인
        commentList.addEventListener("click", function(event) {
            const target = event.target;

            if (target.classList.contains("comment-report-button")) {
                alert("신고되었습니다.");
            } else if (target.classList.contains("like-button")) {
                const likeBtn = target;
                const likeCountSpan = likeBtn.querySelector(".like-count");
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
                        method: "DELETE",
                        headers: {
                            "Content-Type": "application/json"
                        }
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('네트워크 응답이 올바르지 않습니다');
                        }
                        return response.json();
                    })
                    .then(result => {
                        if(result.status === "success") {
                            comment.remove();
                            // 댓글 수 업데이트
                            const rcount = document.getElementById('rcount');
                            if(rcount) {
                                rcount.innerText = parseInt(rcount.innerText) - 1;
                            }
                        } else {
                            alert("댓글 삭제에 실패했습니다: " + result.message);
                        }
                    })
                    .catch(error => {
                        console.error("댓글 삭제 중 오류가 발생했습니다:", error);
                        alert("댓글 삭제 중 오류가 발생했습니다.");
                    });
                }
            }
        });
    }

    // 댓글 목록 로드 함수
    function loadReplies() {
        const postId = new URLSearchParams(window.location.search).get('postId');

        fetch(`${contextPath}/board/api/replies?postId=${postId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답이 올바르지 않습니다');
                }
                return response.json();
            })
            .then(data => {
                console.log('받은 데이터:', data); // 디버깅용 로그
                populateReplies(data.replies);
                setReplyCount(data.replies.length);
            })
            .catch(error => console.error("댓글 목록 불러오기 중 오류가 발생했습니다:", error));
    }

    // 댓글 목록 업데이트 함수
    function populateReplies(replies) {
        const replyBody = document.querySelector(".comment-list");
        if(!replyBody) return; // 요소 존재 여부 확인
        replyBody.innerHTML = '';

        replies.forEach(reply => {
            const replyDiv = document.createElement("div");
            replyDiv.classList.add("comment");
            replyDiv.setAttribute("data-reply-no", reply.replyNo);
            replyDiv.innerHTML = `
                <div class="comment-info">
                    <img src="${contextPath}/img/icon_user.png" alt="사용자 아이콘" class="comment-user-icon">
                    <span class="comment-user-name">${escapeHtml(reply.author)}</span>
                    <span class="comment-date">${formatDate(reply.createdTime)}</span>
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

        // 댓글 수 업데이트
        setReplyCount(replies.length);
    }

    // 댓글 수 업데이트 함수
    function setReplyCount(count) {
        const rcount = document.getElementById('rcount');
        if(rcount) {
            rcount.innerText = count;
        }
        
    }

    // XSS 방지용 HTML 이스케이프 함수
    function escapeHtml(text) {
        if(!text) return '';
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return text.replace(/[&<>"']/g, function(m) { return map[m]; });
    } 

    // 날짜 형식 지정 함수
    function formatDate(dateString) {
        const date = new Date(dateString);
        if(isNaN(date)) return 'Invalid Date';
        return date.toLocaleString();
    }

    // 초기 로드 시 댓글 목록 불러오기
    loadReplies();
});
