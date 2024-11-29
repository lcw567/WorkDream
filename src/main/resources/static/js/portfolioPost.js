$(document).ready(function() {
    $('#summernote').summernote({
        tabsize: 2,
        height: 500, // 에디터 높이 조정
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'clear']],
            ['fontsize', ['fontsize']], // 폰트 크기 옵션 추가
            ['fontname', ['fontname']],
            ['color', ['color']], // 텍스트 색상 변경
            ['para', ['ul', 'ol', 'paragraph']], // 순서 없는 목록, 순서 있는 목록
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        callbacks: {
            onChange: function(contents) {
                // <font> 태그를 <span>으로 변환할 필요가 없으므로, 기존 내용 유지
                console.log("내용 변경됨 (수정 후):", contents);
            }
        }
    });
});
