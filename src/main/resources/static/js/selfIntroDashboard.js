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

    // 1. 자소서 등록하기 버튼 클릭 시 selfIntro.jsp로 이동
    if (registerButton) {
        registerButton.addEventListener('click', function () {
            window.location.href = `${contextPath}/resume/selfIntro`;
        });
    }

    // 2. 삭제 버튼 클릭 시 해당 자소서 항목 삭제 (시뮬레이션)
    // 3. 수정 버튼 클릭 시 selfIntro.jsp로 이동
    if (introList) {
        introList.addEventListener('click', function (e) {
            const target = e.target;

            // 삭제 버튼 클릭 처리
            if (target.classList.contains('delete-button')) {
                const introItem = target.closest('.intro-item');
                if (!introItem) return;

                const introName = introItem.querySelector('.intro-name')?.textContent || '자소서';
                if (confirm(`"${introName}" 자소서를 정말 삭제하시겠습니까?`)) {
                    // 시뮬레이션: 클라이언트 측에서만 삭제
                    introItem.remove();
                    totalCount--;
                    totalCountElement.textContent = `총 ${totalCount}건`;
                }
            }

            // 수정 버튼 클릭 처리
            if (target.classList.contains('edit-button')) {
                const introItem = target.closest('.intro-item');
                if (!introItem) return;

                const introId = introItem.getAttribute('data-id');
                if (introId) {
                    window.location.href = `${contextPath}/resume/selfIntro?id=${introId}`;
                } else {
                    alert('수정할 자소서의 ID가 존재하지 않습니다.');
                }
            }
        });
    }
});
