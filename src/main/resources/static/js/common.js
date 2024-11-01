/* header.jsp */

// 햄버거 버튼 전용
const menuButton = document.getElementById("menuButton");
const menuImg = menuButton.querySelector("img");

function changeMenuImg(event) {
    switch (event.type) {
        case 'mouseenter':
            menuImg.src = contextPath + "/img/btn_menu(on).png";
            break;
        case 'mouseleave':
            if (!menuButton.classList.contains('On')) {
                menuImg.src = contextPath + "/img/btn_menu.png";
            }
            break;
        case 'click' :
            if (!menuButton.classList.contains('On')) {
                menuButton.classList.add('On');
                menuImg.src = contextPath + "/img/btn_menu(on).png";
            } else {
                menuButton.classList.remove('On');
                menuImg.src = contextPath + "/img/btn_menu.png";
            }
            break;
    }
}

menuButton.addEventListener('mouseenter', changeMenuImg);
menuButton.addEventListener('mouseleave', changeMenuImg);
menuButton.addEventListener('click', changeMenuImg);

// 대메뉴 판별
function activeMenu(menuNo) {
    const menuItems = document.querySelectorAll("#header-nav-bottom .menu > li");
    menuItems[menuNo].classList.add("On");
}