/* applicantsStatus.jsp */

// 진행중인 공고가 있는지 우선 판별
window.onload = function() {
    // 'method' 값이 '0'이라면 알림을 띄우고 페이지 리다이렉트
    if (method === '0') {
        alert("워크드림에서 진행 중인 공고가 없습니다.");
        window.location.href = contextPath + "/business/recruitmentManager";
    }
};


/* applicantsList.jsp */

// 필터창 온오프
function listFilter(event) {
    const btnFilter = event.target;
    const filter = document.querySelector(".list-filter");

    if (!btnFilter.classList.contains("On")) {
        btnFilter.classList.add("On");
        filter.style.display = "flex";
    } else {
        btnFilter.classList.remove("On");
        filter.style.display = "none";
    }
}

// 필터창 닫기 버튼
function filterClose() {
	const filter = document.querySelector(".list-filter");
	filter.style.display = "none";
}

// 체크박스 전체 선택&해제
const allCheck = document.getElementById("allCheck");
const checkboxes = document.querySelectorAll(".btnList input[type='checkBox']");

allCheck.addEventListener('change', function() {
    checkboxes.forEach(checkbox => {
        checkbox.checked = allCheck.checked;
    })
});

checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
        if (Array.from(checkboxes).every(chk => chk.checked)) {
            allCheck.checked = true;
            allCheck.indeterminate = false;
        } else if (Array.from(checkboxes).every(chk => !chk.checked)) {
            allCheck.checked = false;
            allCheck.indeterminate = false;
        } else {
            allCheck.checked = false;
            allCheck.indeterminate = true;
        }
    });
});

// 즐겨찾기 등록&해제
function bookmark(event, applicantNo) {
    const btnStar = event.currentTarget;
    const img = btnStar.querySelector("img");

    if (!btnStar.classList.contains("On")) {
        btnStar.classList.add("On");
        img.src = "../img/btn_star_on.png";
        alert("관심 구직자 목록에 등록되었습니다.");
    } else {
        btnStar.classList.remove("On");
        img.src = "../img/btn_star_off.png";
        alert("관심 구직자 목록에서 해제되었습니다.");
    }
}