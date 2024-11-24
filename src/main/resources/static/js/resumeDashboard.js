document.addEventListener('DOMContentLoaded', function () {
    // 요소 선택
    const registerButton = document.querySelector('.toenroll_page');
    const totalCountElement = document.querySelector('.total-count');

    // 초기 카운트 설정
    let totalCount = parseInt(totalCountElement.textContent.replace(/\D/g, ''));
    let loading = false;
    let page = 1;
    const limit = 5; // 한 번에 로드할 자소서 수

if (registerButton) {
    registerButton.addEventListener('click', function () {
        window.location.href = `${contextPath}/resume/enrollresume`;
    });
}

});

function deleteResume(resumeNo) {
    if (confirm('정말 삭제하시겠습니까?')) {
        $.ajax({
            url: '/WorkDream/resume/deleteResume',
            type: 'POST',
            data: {
                id: resumeNo,
                _csrf: $('meta[name="_csrf"]').attr('content')
            },
            success: function (response) {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function (xhr) {
                alert('삭제 중 오류가 발생했습니다.');
            }
        });
    }
}
