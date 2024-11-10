function handleClick(button) {
    // 모든 버튼을 기본 스타일로 초기화
    document.querySelectorAll('.select a').forEach(btn => {
        btn.classList.remove('active');
    });

    // 클릭된 버튼에만 'active' 클래스 추가
    button.classList.add('active');
}
