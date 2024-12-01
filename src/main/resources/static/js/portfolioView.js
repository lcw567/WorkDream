$(document).ready(function() {
    console.log("portfolioView.js 로드됨"); // 디버깅용 로그

    $('#summernote').summernote({
        tabsize: 2,
        height: 500,
        toolbar: false, // 툴바 비활성화
        readOnly: true, // 읽기 전용 모드
        callbacks: {
            onInit: function() {
                // disable() 메서드 제거
            }
        }
    });
    console.log("Summernote 초기화 완료"); // 디버깅용 로그
});
