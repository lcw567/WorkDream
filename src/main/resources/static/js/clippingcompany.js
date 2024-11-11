function handleClick(button) {
    // 모든 버튼을 기본 스타일로 초기화
    document.querySelectorAll('.select a').forEach(btn => {
        btn.classList.remove('active');
    });

    // 클릭된 버튼에만 'active' 클래스 추가
    button.classList.add('active');

    if (button.classList.contains('btntype1')) {
        const contextPath = document.getElementsByTagName('body')[0].getAttribute('data-context-path');
        window.location.href = `${contextPath}/member/clipping`;
    } else if (button.classList.contains('btntype2')) {
        const contextPath = document.getElementsByTagName('body')[0].getAttribute('data-context-path');
        window.location.href = `${contextPath}/member/clippingcompany`;
    }

}

function deleteJob(element) {
    const confirmed = confirm("삭제 하시겠어요?");
    if (confirmed) {
        // content div를 삭제합니다.
        const contentDiv = element.closest('.content');
        contentDiv.remove();
    }
}
