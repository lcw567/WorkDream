    document.addEventListener("DOMContentLoaded", () => {
        const dropdownButton = document.getElementById("dropdownButton");
        const dropdownMenu = document.getElementById("dropdownMenu");

        dropdownButton.addEventListener("click", (event) => {
            event.stopPropagation();
            dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
        });

        // 드롭다운 메뉴 외부 클릭 시 메뉴 닫기
        document.addEventListener("click", () => {
            dropdownMenu.style.display = "none";
        });
    });

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
