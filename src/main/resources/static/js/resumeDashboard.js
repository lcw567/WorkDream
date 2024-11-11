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