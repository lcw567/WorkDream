$(document).ready(function () {
    $('#summernote').summernote({
        tabsize: 2,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'clear']],
            ['fontsize', ['fontsize']],
            ['fontname', ['fontname']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '굴림', '바탕', '돋움', '나눔고딕', 'Nanum Gothic'],
        fontNamesIgnoreCheck: ['맑은 고딕', '굴림', '바탕', '돋움', '나눔고딕', 'Nanum Gothic'],
    });
});
