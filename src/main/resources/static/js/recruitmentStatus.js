    document.addEventListener("DOMContentLoaded", () => {
        const statusLinks = document.querySelectorAll(".status-link");

        statusLinks.forEach(link => {
            link.addEventListener("click", (event) => {
                event.preventDefault();

                // 모든 링크의 'active' 클래스 제거
                statusLinks.forEach(link => link.classList.remove("active"));

                // 클릭된 링크에 'active' 클래스 추가
                event.currentTarget.classList.add("active");
            });
        });
    });

    document.addEventListener("DOMContentLoaded", () => {
        const dropdownButtons = document.querySelectorAll(".dropdownButton");
        const dropdownMenus = document.querySelectorAll(".dropdownMenu");
        const statusLinks = document.querySelectorAll(".status-link");
    
        // 초기 상태로 페이지 로드 시 '진행중' 상태에서 지원자 현황을 표시하도록 설정
        dropdownMenus.forEach(menu => {
            const supportStatusItem = menu.querySelector("li:last-child"); // 지원자 현황 항목 선택
            supportStatusItem.style.display = "block"; // 기본적으로 보이도록 설정
        });
    
        dropdownButtons.forEach((button, index) => {
            const correspondingMenu = dropdownMenus[index]; // 각 버튼에 대응하는 메뉴
    
            button.addEventListener("click", (event) => {
                event.stopPropagation();
    
                // 클릭한 버튼의 메뉴 표시/숨기기
                correspondingMenu.style.display = correspondingMenu.style.display === "block" ? "none" : "block";
    
                // 다른 모든 메뉴 닫기
                dropdownMenus.forEach((menu, menuIndex) => {
                    if (menuIndex !== index) {
                        menu.style.display = "none";
                    }
                });
            });
        });
    
        // '진행중', '대기중', '임시저장', '마감' 상태 버튼 클릭 시 지원자 현황 항목 제어
        statusLinks.forEach(link => {
            link.addEventListener("click", (event) => {
                event.preventDefault();
    
                // 모든 링크의 'active' 클래스 제거
                statusLinks.forEach(link => link.classList.remove("active"));
    
                // 클릭된 링크에 'active' 클래스 추가
                event.currentTarget.classList.add("active");
    
                dropdownMenus.forEach(menu => {
                    const supportStatusItem = menu.querySelector("li:last-child"); // 지원자 현황 항목 선택
    
                    // '진행중' 상태일 때만 지원자 현황을 표시
                    if (event.currentTarget.textContent.includes("진행중")) {
                        supportStatusItem.style.display = "block";
                    } else {
                        supportStatusItem.style.display = "none";
                    }
                });
            });
        });
    
        // 드롭다운 메뉴 외부 클릭 시 모든 메뉴 닫기
        document.addEventListener("click", () => {
            dropdownMenus.forEach(menu => {
                menu.style.display = "none";
            });
        });
    });
    
    