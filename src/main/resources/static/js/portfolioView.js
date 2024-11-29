// portfolioView.js
$(document).ready(function() {
    console.log("portfolioView.js 로드됨"); // 디버깅용 로그
    var content = $('#summernote').data('content'); // 임시 데이터에서 내용 가져오기

    $('#summernote').summernote({
        placeholder: '포트폴리오 내용을 확인하세요...',
        tabsize: 2,
        height: 300,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['link', 'picture']],
            ['view', ['fullscreen', 'codeview']]
        ],
        callbacks: {
            onInit: function() {
                // Summernote를 읽기 전용으로 설정
                $(this).summernote('disable');
            }
        }
    });

    // 임시 데이터 내용 설정
    $('#summernote').summernote('code', content);
    console.log("Summernote 초기화 완료"); // 디버깅용 로그
});
