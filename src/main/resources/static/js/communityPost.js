document.addEventListener("DOMContentLoaded", function() {
    // 게시글 등록 버튼 클릭 시 이벤트
    document.querySelector(".submit-button").addEventListener("click", function() {
        // 선택된 카테고리, 제목, 내용 가져오기
        const category = document.getElementById("category").value;
        const title = document.querySelector(".title-input input").value;
        const content = document.querySelector(".content-input textarea").value;

        // 유효성 검사 (예시: 제목과 내용이 비어있지 않은지 확인)
        if (!title || !content) {
            alert("제목과 내용을 입력해 주세요.");
            return;
        }

        // 서버에 게시글 데이터를 저장하는 비동기 요청 (예시)
        fetch("/api/posts", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                category: category,
                title: title,
                content: content
            })
        })
        .then(response => response.json())
        .then(data => {
            // 게시글이 성공적으로 등록되면 communityView.jsp로 이동
            location.href = `/board/communityView?postId=${data.postId}`;
        })
        .catch(error => {
            console.error("Error:", error);
            alert("게시글 등록 중 오류가 발생했습니다.");
        });
    });

    // 해시태그 입력 처리
    const hashtagInput = document.querySelector(".hashtag-box input");
    const hashtagContainer = document.querySelector(".hashtag-box");

    hashtagInput.addEventListener("keydown", function(event) {
        if (event.key === "Enter" && hashtagInput.value.trim() !== "") {
            const newHashtag = hashtagInput.value.trim();

            // 중복 해시태그 검사
            const existingHashtags = Array.from(document.querySelectorAll(".hashtag")).map(
                tag => tag.textContent.replace("#", "").replace("×", "").trim()
            );

            if (existingHashtags.includes(newHashtag)) {
                alert("이미 추가된 해시태그입니다.");
                hashtagInput.value = "";
                event.preventDefault();
                return;
            }

            // 최대 해시태그 수 검사
            if (existingHashtags.length >= 5) {
                alert("최대 5개의 해시태그만 추가할 수 있습니다.");
                hashtagInput.value = "";
                event.preventDefault();
                return;
            }

            // 해시태그 추가
            const hashtag = document.createElement("span");
            hashtag.classList.add("hashtag");
            hashtag.innerHTML = `#${newHashtag} <span class="remove-hashtag">×</span>`;

            // 삭제 버튼 (x) 클릭 시 해시태그 삭제
            hashtag.querySelector(".remove-hashtag").addEventListener("click", function() {
                hashtag.remove();
            });

            hashtagContainer.insertBefore(hashtag, hashtagInput);
            hashtagInput.value = "";
            event.preventDefault();
        }
    });

    // 직무 카테고리에서 한 개만 선택 가능하도록 설정
    const jobCheckboxes = document.querySelectorAll(".job-category-container input[type='checkbox']");
    jobCheckboxes.forEach(checkbox => {
        checkbox.addEventListener("change", function() {
            if (checkbox.checked) {
                jobCheckboxes.forEach(cb => {
                    if (cb !== checkbox) cb.checked = false;
                });
            }
        });
    });

    // 이미지 첨부 및 미리보기 기능
    const imageInput = document.getElementById("imageInput");
    const imagePreview = document.getElementById("imagePreview");

    imageInput.addEventListener("change", function(event) {
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
            imageInput.value = ""; // 입력 필드 초기화
        }
    });
});