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