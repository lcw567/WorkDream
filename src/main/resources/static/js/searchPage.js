// 검색 기능을 위한 JavaScript 코드
document.addEventListener("DOMContentLoaded", () => {
    // 필요한 요소 가져오기
    const searchInput = document.querySelector("#searchHeader input");
    const searchButton = document.querySelector("#searchHeader button");
    const initializationPre = document.querySelector("#searchedKeyword .Initialization pre:nth-child(2)");
    const searchFindPre = document.querySelector("#searchFind pre");

    // 검색 버튼 클릭 이벤트 리스너
    searchButton.addEventListener("click", () => {
        const inputValue = searchInput.value.trim(); // 입력값 가져오고 공백 제거

        if (inputValue) {
            // Initialization 영역의 pre 텍스트 업데이트
            initializationPre.textContent = inputValue;

            // searchFind 영역의 pre 텍스트 업데이트
            const resultCount = 42; // 예제 결과 개수 (필요시 실제 개수로 대체)
            searchFindPre.innerHTML = `검색어 "[<span>${inputValue}</span>]" 에 대한 ${resultCount}개의 웹페이지 결과를 찾았습니다.`;
        } else {
            alert("검색어를 입력하세요.");
        }
    });
});
