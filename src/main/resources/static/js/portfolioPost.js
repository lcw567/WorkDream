// portfolioPost.js
$(document).ready(function() {
    console.log("portfolioPost.js 로드됨"); // 디버깅용 로그
    $('#summernote').summernote({
        placeholder: '포트폴리오 내용을 입력하세요...',
        tabsize: 4,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['fontname', ['fontname']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
    console.log("Summernote 초기화 완료"); // 디버깅용 로그
});
