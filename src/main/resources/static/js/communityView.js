document.addEventListener("DOMContentLoaded", function() {
    // 컨텍스트 경로 가져오기
    const contextPath = window.contextPath; // 글로벌 변수로 설정된 contextPath 사용

    // 게시글 공감 상태 (서버에서 전달된 변수라고 가정)
    let postLikedBool = Boolean(postLiked); // 'postLiked' 변수를 서버에서 전달한다고 가정
    console.log(`postLikedBool: ${postLikedBool}`);

    // 수정 버튼 기능
    const editButton = document.querySelector(".edit-button");
    if (editButton) {
        console.log("Edit 버튼을 찾았습니다.");
        editButton.addEventListener("click", function() {
            console.log("Edit 버튼이 클릭되었습니다.");
            const postId = new URLSearchParams(window.location.search).get('postId');
            console.log(`postId: ${postId}`);
            window.location.href = `${contextPath}/board/editPost?postId=${postId}`;
        });
    } else {
        console.log("Edit 버튼을 찾을 수 없습니다.");
    }

    // 삭제 버튼 기능
    const deleteButton = document.querySelector(".delete-button");
    if (deleteButton) {
        console.log("Delete 버튼을 찾았습니다.");
        deleteButton.addEventListener("click", function() {
            console.log("Delete 버튼이 클릭되었습니다.");
            if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                const postId = new URLSearchParams(window.location.search).get('postId');
                console.log(`삭제할 postId: ${postId}`);
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
    } else {
        console.log("Delete 버튼을 찾을 수 없습니다.");
    }

    // 공감 버튼 기능 (게시글)
    const postLikeButton = document.querySelector(".like-button[data-post-no]");
    if(postLikeButton) {
        const postingNo = postLikeButton.getAttribute("data-post-no");
        console.log(`게시글 공감 버튼 찾음: postingNo=${postingNo}`);
        if(postLikedBool) {
            postLikeButton.classList.add("liked");
        }
        postLikeButton.addEventListener("click", function() {
            console.log("게시글 공감 버튼이 클릭되었습니다.");
            const likeCount = postLikeButton.querySelector(".like-count");
            if (postLikedBool) {
                // 공감 취소 요청
                fetch(`${contextPath}/board/api/posts/${postingNo}/unlike`, {
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
                        console.log("공감 취소 성공");
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
                fetch(`${contextPath}/board/api/posts/${postingNo}/like`, {
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
                        console.log("공감 성공");
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
        console.log("댓글 등록 버튼을 찾았습니다.");
        commentSubmitButton.addEventListener("click", function() {
            console.log("댓글 등록 버튼이 클릭되었습니다.");
            const commentInput = document.querySelector(".comment-input");
            const commentText = commentInput.value.trim();
            if (commentText) {
                // AJAX를 통해 댓글을 서버에 전송
                const postId = new URLSearchParams(window.location.search).get('postId');
                console.log(`댓글을 추가할 postId: ${postId}`);
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
                        console.log("댓글 등록 성공");
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
    } else {
        console.log("댓글 등록 버튼을 찾을 수 없습니다.");
    }

    // 댓글의 신고, 공감, 삭제 버튼 이벤트 위임
    const commentList = document.querySelector(".comment-list");
    if(commentList) { // 요소 존재 여부 확인
        console.log("댓글 리스트를 찾았습니다.");
        commentList.addEventListener("click", function(event) {
            const target = event.target;
            console.log("댓글 리스트 내에서 클릭된 요소:", target);

            if (target.classList.contains("comment-report-button")) {
                console.log("댓글 신고 버튼이 클릭되었습니다.");
                alert("신고되었습니다.");
            } else if (target.classList.contains("like-button")) {
                console.log("댓글 공감 버튼이 클릭되었습니다.");
                const likeBtn = target;
                const likeCountSpan = likeBtn.querySelector(".like-count");
                const commentDiv = likeBtn.closest(".comment");
                const replyNo = commentDiv.getAttribute("data-reply-no");
                const isLiked = likeBtn.classList.contains("liked");
                const url = isLiked ? `${contextPath}/board/api/replies/${replyNo}/unlike` : `${contextPath}/board/api/replies/${replyNo}/like`;

                fetch(url, {
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
                        if(isLiked) {
                            likeBtn.classList.remove("liked");
                            likeCountSpan.innerText = parseInt(likeCountSpan.innerText) - 1;
                            console.log("댓글 공감 취소 성공");
                        } else {
                            likeBtn.classList.add("liked");
                            likeCountSpan.innerText = parseInt(likeCountSpan.innerText) + 1;
                            console.log("댓글 공감 성공");
                        }
                    } else {
                        alert("공감 처리에 실패했습니다: " + result.message);
                    }
                })
                .catch(error => {
                    console.error("공감 처리 중 오류가 발생했습니다:", error);
                    alert("공감 처리 중 오류가 발생했습니다.");
                });
            } else if (target.classList.contains("comment-delete-button")) {
                console.log("댓글 삭제 버튼이 클릭되었습니다.");
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
                            console.log("댓글 삭제 성공");
                            comment.remove();
                            // 댓글 수 업데이트
                            const rcount = document.getElementById('rcount');
                            if(rcount) {
                                rcount.innerText = parseInt(rcount.innerText) - 1;
                                console.log(`댓글 수 업데이트: ${rcount.innerText}`);
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
    } else {
        console.log("댓글 리스트를 찾을 수 없습니다.");
    }

    // 댓글 목록 로드 함수
    function loadReplies() {
        const postId = new URLSearchParams(window.location.search).get('postId');
        console.log(`댓글을 로드할 postId: ${postId}`);

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
        if(!replyBody) {
            console.log("댓글 리스트 요소를 찾을 수 없습니다.");
            return; 
        }
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
                    <button class="comment-action like-button ${reply.userLiked ? 'liked' : ''}" data-reply-no="${reply.replyNo}">
                        👍 <span class="like-count">${reply.likeCount}</span>
                    </button>
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
            console.log(`댓글 수 업데이트: ${count}`);
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
