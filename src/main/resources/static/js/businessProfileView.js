// businessProfileView.js

// Toggle "전체보기" 기능
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.toggle-btn').forEach(button => {
        button.addEventListener('click', () => {
            const targetId = button.getAttribute('data-target');
            const target = document.getElementById(targetId);
            if (target.classList.contains('expanded')) {
                target.classList.remove('expanded');
                button.textContent = '전체보기';
            } else {
                target.classList.add('expanded');
                button.textContent = '간략히';
            }
        });
    });

    // 사내 근무 환경 갤러리 네비게이션
    const leftBtn = document.querySelector('.left-btn');
    const rightBtn = document.querySelector('.right-btn');
    const gallery = document.getElementById('work-environment-gallery');

    leftBtn.addEventListener('click', () => {
        gallery.scrollBy({
            top: 0,
            left: -300,
            behavior: 'smooth'
        });
    });

    rightBtn.addEventListener('click', () => {
        gallery.scrollBy({
            top: 0,
            left: 300,
            behavior: 'smooth'
        });
    });
});
