// portfolioView.js
$(document).ready(function() {
    console.log("portfolioView.js 로드됨"); // 디버깅용 로그
    var content = $('#summernote').data('content'); // 서버에서 전달된 내용 가져오기

    $('#summernote').summernote({
        tabsize: 2,
        height: 500,
        toolbar: false, // 툴바 비활성화
        callbacks: {
            onInit: function() {
                // Summernote를 읽기 전용으로 설정
                $(this).summernote('code', content);
                $(this).summernote('disable');
            }
        }
    });
    console.log("Summernote 초기화 완료"); // 디버깅용 로그
});
