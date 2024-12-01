// portfolioDashboard.js
$(document).ready(function() {
    console.log("portfolioDashboard.js 로드됨"); // 디버깅용 로그

    // 삭제 버튼 클릭 시 확인 창 표시
    $('button.delete-button').on('click', function(e) {
        var confirmed = confirm("정말로 이 포트폴리오를 삭제하시겠습니까?");
        if (!confirmed) {
            e.preventDefault(); // 삭제 취소
        }
    });
});
