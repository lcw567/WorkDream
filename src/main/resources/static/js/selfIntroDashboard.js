// selfIntroDashboard.js

document.addEventListener('DOMContentLoaded', function () {
    // 요소 선택
    const registerButton = document.querySelector('.register-button');
    const introList = document.querySelector('.intro-list');
    const totalCountElement = document.querySelector('.total-count');

    // 초기 카운트 설정
    let totalCount = parseInt(totalCountElement.textContent.replace(/\D/g, ''));
    let loading = false;
    let page = 1;
    const limit = 5; // 한 번에 로드할 자소서 수

    // contextPath 설정 (필요에 따라 수정)
    const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    // CSRF 토큰 가져오기 (Spring Security 사용 시)
    const csrfTokenElement = document.querySelector('meta[name="_csrf"]');
    const csrfHeaderElement = document.querySelector('meta[name="_csrf_header"]');
    const csrfToken = csrfTokenElement ? csrfTokenElement.getAttribute('content') : '';
    const csrfHeader = csrfHeaderElement ? csrfHeaderElement.getAttribute('content') : '';

    // 1. 자소서 등록하기 버튼 클릭 시 selfIntro.jsp로 이동
    if (registerButton) {
        registerButton.addEventListener('click', function () {
            window.location.href = `${contextPath}/resume/selfIntro`;
        });
    }

    // 2. 삭제 및 수정 버튼 클릭 이벤트 처리
    if (introList) {
        introList.addEventListener('click', function (e) {
            const target = e.target;

            // 삭제 버튼 클릭 처리
            if (target.classList.contains('delete-button')) {
                const introItem = target.closest('.intro-item');
                if (!introItem) return;

                const introName = introItem.querySelector('.intro-name')?.textContent || '자소서';
                const introId = introItem.getAttribute('data-id');

                if (confirm(`"${introName}" 자소서를 정말 삭제하시겠습니까?`)) {
                    // 서버로 삭제 요청 보내기
                    fetch(`${contextPath}/resume/deleteIntro`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                            ...(csrfToken && csrfHeader ? { [csrfHeader]: csrfToken } : {})
                        },
                        body: `id=${encodeURIComponent(introId)}`
                    })
                    .then(response => response.text())
                    .then(data => {
                        if (data.trim() === 'success') {
                            // 삭제 성공 시 클라이언트 측에서 항목 제거
                            introItem.remove();
                            totalCount--;
                            totalCountElement.textContent = `총 ${totalCount}건`;
                        } else {
                            alert('삭제에 실패했습니다.');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('삭제 요청 중 오류가 발생했습니다.');
                    });
                }
            }

            // 수정 버튼 클릭 처리
            if (target.classList.contains('edit-button')) {
                const introItem = target.closest('.intro-item');
                if (!introItem) return;

                const introId = introItem.getAttribute('data-id');
                if (introId) {
                    window.location.href = `${contextPath}/resume/editIntro?id=${introId}`;
                } else {
                    alert('수정할 자소서의 ID가 존재하지 않습니다.');
                }
            }
        });
    }

    // 무한 스크롤 또는 페이지네이션이 필요한 경우 추가 로직 구현
    // 예를 들어, 스크롤 이벤트를 감지하여 새로운 자소서를 로드하는 로직 등
});
