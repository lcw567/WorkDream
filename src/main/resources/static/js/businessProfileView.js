document.addEventListener("DOMContentLoaded", function () {
    // --- 전체보기 / 간략히 보기 버튼 처리 ---
    const toggleButtons = document.querySelectorAll(".toggle-btn");
    toggleButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const targetId = button.getAttribute("data-target");
            const targetElement = document.getElementById(targetId);

            // 'expanded' 클래스를 토글 (내용 확장/축소)
            const isExpanded = targetElement.classList.toggle("expanded");

            // 상태에 따라 버튼 텍스트 변경
            button.textContent = isExpanded ? "간략히 보기" : "전체보기";

            // 접근성을 위해 aria-expanded 속성 업데이트
            button.setAttribute("aria-expanded", isExpanded);

            // 선택적으로 대상 요소로 부드럽게 스크롤
            targetElement.scrollIntoView({ behavior: "smooth" });
        });
    });

    // --- 갤러리 내비게이션 처리 ---
    const leftBtn = document.querySelector(".left-btn"); // 왼쪽 버튼
    const rightBtn = document.querySelector(".right-btn"); // 오른쪽 버튼
    const gallery = document.getElementById("work-environment-gallery"); // 갤러리 컨테이너

    if (leftBtn && rightBtn && gallery) {
        // 왼쪽 버튼 클릭 시 갤러리를 왼쪽으로 스크롤
        leftBtn.addEventListener("click", () => {
            gallery.scrollBy({
                top: 0,
                left: -300,
                behavior: "smooth",
            });
        });

        // 오른쪽 버튼 클릭 시 갤러리를 오른쪽으로 스크롤
        rightBtn.addEventListener("click", () => {
            gallery.scrollBy({
                top: 0,
                left: 300,
                behavior: "smooth",
            });
        });
    }

    // --- 관심 기업 추가 버튼 처리 ---
    const favoriteButton = document.getElementById("add-favorite-btn"); // 관심 기업 추가 버튼

    if (favoriteButton) {
        favoriteButton.addEventListener("click", function () {
            // 백엔드 연결 없이 상태만 변경
            if (!favoriteButton.disabled) {
                favoriteButton.textContent = "이미 추가됨"; // 버튼 텍스트 변경
                favoriteButton.disabled = true; // 버튼 비활성화
                alert("관심 기업에 추가되었습니다!"); // 알림 메시지
            } else {
                alert("이미 추가된 기업입니다.");
            }
        });
    }
});
