// portfolioDashboard.js
$(document).ready(function() {
    console.log("portfolioDashboard.js 로드됨"); // 디버깅용 로그

    // 삭제 버튼 클릭 시 확인 창 표시
    $('button.delete-button').on('click', function(e) {
        var confirmed = confirm("정말로 이 포트폴리오를 삭제하시겠습니까?");
        if (!confirmed) {
            e.preventDefault(); // 삭제 취소
        } else {
            // 실제 삭제 기능은 백엔드와 연동 후 구현
            alert("포트폴리오가 삭제되었습니다."); // 임시 알림
            // 예시: 삭제 후 페이지 새로 고침
            // location.reload();
        }
    });

    // 페이지네이션 버튼 이벤트
    document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
        }
    });

    document.getElementById('nextPage').addEventListener('click', () => {
        currentPage++;
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
    });
});
