// editPost.js

document.addEventListener("DOMContentLoaded", function() {
    const contextPath = document.getElementById("contextPath").value;

    // 게시글 수정 폼 제출 이벤트
    document.getElementById('editPostForm').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        const postingNo = document.querySelector('input[name="postingNo"]').value;
        const category = document.getElementById("category").value;
        const title = document.querySelector(".title-input input").value.trim();
        const content = document.querySelector(".content-input textarea").value.trim();

        const selectedJobs = Array.from(document.querySelectorAll(".job-checkbox:checked"))
                                  .map(cb => cb.value);

        // 해시태그 가져오기 (기존과 새로운 해시태그 모두 포함)
        const existingHashtags = Array.from(document.querySelectorAll(".hashtag"))
                                      .map(tag => tag.textContent.replace("#", "").replace("×", "").trim());
        const newHashtagInput = document.getElementById("hashtags").value.trim();
        let hashtags = existingHashtags;
        if(newHashtagInput) {
            const newHashtags = newHashtagInput.split(',').map(tag => tag.trim()).filter(tag => tag !== '');
            hashtags = hashtags.concat(newHashtags);
        }

        // 중복 제거 (최대 5개)
        hashtags = [...new Set(hashtags)].slice(0, 5);

        // 이미지 첨부
        const imageInput = document.getElementById("imageInput");
        let imageFile = imageInput.files[0];

        // 폼 데이터 준비
        const formData = new FormData();
        formData.append("category", category);
        formData.append("title", title);
        formData.append("content", content);
        formData.append("postingNo", postingNo);
        if(imageFile) {
            formData.append("image", imageFile);
        }
        selectedJobs.forEach(job => formData.append("jobs", job));
        hashtags.forEach(tag => formData.append("hashtags", tag));

        // 서버에 게시글 데이터를 수정하는 비동기 요청
        fetch(`${contextPath}/board/api/posts/${postingNo}/update`, {
            method: "POST", // PUT에서 POST로 변경
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data.status === "success") {
                // 게시글이 성공적으로 수정되면 communityView.jsp로 이동
                alert("게시글이 수정되었습니다.");
                location.href = `${contextPath}/board/communityView?postId=${data.postId}`;
            } else {
                alert(`게시글 수정에 실패했습니다: ${data.message}`);
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("게시글 수정 중 오류가 발생했습니다.");
        });
    });

    // 해시태그 입력 처리
    const hashtagInput = document.querySelector(".hashtag-box input");
    const hashtagContainer = document.querySelector(".hashtag-box");

    hashtagInput.addEventListener("keydown", function(event) {
        if (event.key === "Enter" && hashtagInput.value.trim() !== "") {
            event.preventDefault(); // 기본 엔터 동작 방지

            const newHashtag = hashtagInput.value.trim();

            // 중복 해시태그 검사
            const existingHashtags = Array.from(document.querySelectorAll(".hashtag")).map(
                tag => tag.textContent.replace("#", "").replace("×", "").trim()
            );

            if (existingHashtags.includes(newHashtag)) {
                alert("이미 추가된 해시태그입니다.");
                hashtagInput.value = "";
                return;
            }

            // 최대 해시태그 수 검사
            if (existingHashtags.length >= 5) {
                alert("최대 5개의 해시태그만 추가할 수 있습니다.");
                hashtagInput.value = "";
                return;
            }

            // 해시태그 추가
            const hashtag = document.createElement("span");
            hashtag.classList.add("hashtag");
            hashtag.innerHTML = `#${newHashtag} <span class="remove-btn">×</span>`;

            // 삭제 버튼 (x) 클릭 시 해시태그 삭제
            hashtag.querySelector(".remove-btn").addEventListener("click", function() {
                hashtag.remove();
            });

            hashtagContainer.insertBefore(hashtag, hashtagInput);
            hashtagInput.value = "";
        }
    });

    // 이미지 첨부 및 미리보기 기능
    const imageInputElement = document.getElementById("imageInput");
    const imagePreview = document.getElementById("imagePreview");

    imageInputElement.addEventListener("change", function(event) {
        const file = event.target.files[0];

        // 파일이 이미지인지 확인
        if (file && file.type.startsWith("image/")) {
            const reader = new FileReader();

            reader.onload = function(e) {
                // 기존 미리보기 이미지 제거
                imagePreview.innerHTML = '';

                // 이미지 요소 생성 및 추가
                const imgElement = document.createElement("img");
                imgElement.src = e.target.result;
                imagePreview.appendChild(imgElement);
            };

            reader.readAsDataURL(file);
        } else {
            // 이미지가 아닌 파일을 선택했을 때 처리
            alert("이미지 파일을 선택해 주세요.");
            imageInputElement.value = ""; // 입력 필드 초기화
        }
    });

    // 직무 카테고리 체크박스 제어
    const jobCheckboxes = document.querySelectorAll(".job-checkbox");

    jobCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener("change", function() {
            if (checkbox.checked) {
                // 다른 모든 체크박스 해제
                jobCheckboxes.forEach(function(box) {
                    if (box !== checkbox) {
                        box.checked = false;
                    }
                });
            }
        });
    });
});
