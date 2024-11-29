// portfolioDashboard.js
$(document).ready(function() {
    console.log("portfolioDashboard.js 로드됨"); // 디버깅용 로그

    // 삭제 버튼 클릭 시 확인 창 표시
    $('button.btn-danger').on('click', function(e) {
        var confirmed = confirm("정말로 이 포트폴리오를 삭제하시겠습니까?");
        if (!confirmed) {
            e.preventDefault(); // 삭제 취소
        }
        // 실제 삭제 기능은 백엔드와 연동 후 구현
    });

    // 수정 버튼 클릭 시 포트폴리오 열람 페이지로 이동 (임시)
    $('a.btn.grape').on('click', function(e) {
        e.preventDefault();
        alert("수정 기능은 아직 구현되지 않았습니다.");
        // 실제 수정 기능은 링크를 포트폴리오 수정 페이지로 연결
    });
});
