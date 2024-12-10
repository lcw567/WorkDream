document.addEventListener('DOMContentLoaded', function() {
    const favoriteButton = document.querySelector('.favorite');
    const applyButtons = document.querySelectorAll('.apply');
    const interestButton = document.querySelector('.interest-button');
    let isFavorite = false;
    let favoriteCount = 0;

    // 즐겨찾기 버튼 클릭 이벤트
    favoriteButton.addEventListener('click', function() {
        isFavorite = !isFavorite;
        if (isFavorite) {
            favoriteCount++;
            favoriteButton.style.backgroundColor = '#5d3fd3';
            favoriteButton.style.color = '#ffffff';
        } else {
            favoriteCount--;
            favoriteButton.style.backgroundColor = 'white';
            favoriteButton.style.color = '#333';
        }
        favoriteButton.querySelector('.star').textContent = isFavorite ? '★' : '☆';
        favoriteButton.innerHTML = `<span class="star">${isFavorite ? '★' : '☆'}</span> ${favoriteCount}`;
    });

    // 입사지원 버튼 클릭 이벤트
    applyButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            alert('입사지원했습니다');
            window.location.href = contextPath + '/person/applicationmanage';
        });
    });

    // 관심기업 버튼 클릭 이벤트
    interestButton.addEventListener('click', function() {
        alert('관심기업에 추가되었습니다.');
        window.location.href = contextPath + '/person/clippingcompany';
    });
});
