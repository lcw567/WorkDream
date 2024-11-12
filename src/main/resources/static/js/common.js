/* 공용 */

// 아이디칸 입력제한
function replaceInputId(event) {
    let value = event.target.value;
    
    // 영문 소문자, 숫자, '_' 외에는 입력 제한
    value = value.replace(/[^a-zA-Z0-9_]/g, '');
    value = value.toLowerCase();
    event.target.value = value;
}

// 비밀번호칸 입력제한
function replaceInputPwd(event) {
    let value = event.target.value;
    
    // 띄어쓰기 제한
    value = value.replace(/\s/g, '');
    event.target.value = value;
}

// 이메일칸 입력제한
function replaceInputEmail(event) {
    let value = event.target.value;

    // 영문 소문자, 숫자, 특수기호 '_', '@', '.' 만 허용
    value = value.replace(/[^a-zA-Z0-9@._-]/g, '');

    // '@'는 한 번만 포함되도록 제한
    const atCount = (value.match(/@/g) || []).length;
    if (atCount > 1) {
        // '@'가 두 번 이상 있을 경우, 두 번째 이후 '@'는 삭제
        value = value.replace(/@.*@/, '@');
    }

    // 도메인 부분을 위한 '.' 처리 (연속된 '.'은 하나로 합치기)
    value = value.replace(/\.{2,}/g, '.');

    // 이메일을 소문자로 변환
    value = value.toLowerCase();

    // 이메일에서 '@'와 '.'이 적절하게 들어간 경우만 허용
    if (value.indexOf('@') !== -1) {
        const parts = value.split('@');
        if (parts.length > 2) {
            // '@'가 두 개 이상인 경우, 첫 번째 '@' 이후의 값은 삭제
            value = parts[0] + '@' + parts[1];
        }
    }

    event.target.value = value;
}

// 휴대폰칸 입력제한
function replaceInputPhone(event) {
    let value = event.target.value;
    
    // 띄어쓰기 제한, 숫자만 입력 가능
    value = value.replace(/[^0-9]/g, '');
    event.target.value = value;
}

// 아이디 유효성 검사
function validateId() {

}

// 비밀번호 유효성 검사
function validatePwd(password) {
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;
    return regex.test(password);
}

// 이메일 유효성 검사
function validateEmail(email) {
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return regex.text(email);
}

/* header.jsp */

// 햄버거 버튼 전용 (전체 메뉴 테이블 온오프)
try {
    const menuButton = document.getElementById("menuButton");
    const menuImg = menuButton.querySelector("img");
    const menuDrop = document.getElementById("header-dropdown");
    const dropTable = menuDrop.querySelector("table");
    const dropUls = menuDrop.querySelectorAll("ul");

    function changeMenuImg(event) {
        switch (event.type) {
            case 'mouseenter':
                menuImg.src = contextPath + "/img/btn_menu_on.png";
                break;
            case 'mouseleave':
                if (!menuButton.classList.contains('On')) {
                    menuImg.src = contextPath + "/img/btn_menu.png";
                }
                break;
            case 'click' :
                if (!menuButton.classList.contains('On')) {
                    menuButton.classList.add('On');
                    menuImg.src = contextPath + "/img/btn_menu_on.png";
                    menuDrop.style.display = "flex";
                    dropTable.style.display = "table";
                    dropUls.forEach((ul) => {
                        ul.style.display = "none";
                    });
                } else {
                    menuButton.classList.remove('On');
                    menuImg.src = contextPath + "/img/btn_menu.png";
                    menuDrop.style.display = "none";
                    dropTable.style.display = "none";
                }
                break;
        }
    }

    menuButton.addEventListener('mouseenter', changeMenuImg);
    menuButton.addEventListener('mouseleave', changeMenuImg);
    menuButton.addEventListener('click', changeMenuImg);
} catch (error) {
    console.error("오류 발생: ", error);
}

// 소메뉴
function dropMenu(index) {

}

// 메뉴탭 활성화
function activeMenu(menuNo) {
    const menuItems = document.querySelectorAll("#header-nav-bottom .menu > li");
    menuItems[menuNo].classList.add("On");
}


/* login.jsp */

// 로그인 섹션 변경
function changeLoginSection() {
    const personSection = document.getElementById("login-section-person");
    const businessSection = document.getElementById("login-section-business");

    if(ut === "P") {
        personSection.classList.add("On");
        businessSection.classList.remove("On");
    }
    else {
        personSection.classList.remove("On");
        businessSection.classList.add("On");
    }
}

// 탭 클릭 시 섹션 변경
function changeUserType(userType) {
    ut = userType;
    changeLoginSection();
}

try {
    // 섹션 초기값
    document.addEventListener("DOMContentLoaded", function() {
        changeLoginSection();
    });
    
    // 로그인 페이지 input 제한 설정
    const loginIds = document.querySelectorAll("#loginId");
    loginIds.forEach(function(input) {
        input.addEventListener("input", replaceInputId);
    });
    
    const loginPwds = document.querySelectorAll("#loginPwd");
    loginPwds.forEach(function(input) {
        input.addEventListener("input", replaceInputPwd);
    });
} catch (error) {
    console.error("오류 발생: ", error);
}


/* registrationPerson.jsp */

try {
    const registId = document.getElementById("registId");

    const registPwd = document.getElementById("registPwd");
    const pwdPatternError = document.getElementById("pwd-error-pattern");

    const registPwdRe = document.getElementById("registPwdRe");
    const pwdMatchError = document.getElementById("pwd-error-match");

    const registEmail = document.getElementById("registEmail");
    const emailPatternError = document.getElementById("email-error-pattern");

    const registPhone = document.getElementById("registPhone");
    const registButton = document.getElementById("btnRegist");

    // 유효성 검사 함수
    function validateForm() {
        const isIdValid = registId.value.trim() !== "";
        const isPwdValid = registPwd.value.trim() !== "" && validatePwd(registPwd.value);
        const isPwdReValid = registPwdRe.value.trim() !== "" && registPwd.value == registPwd.value;
        const isEmailValid = registEmail.value.trim() !== "" && validateEmail(registEmail.value);

        // 조건을 모두 만족하면 버튼을 활성화, 아니면 비활성화
        if (isIdValid && isPwdValid && isPwdReValid && isEmailValid) {
            registButton.disabled = false;  // 버튼 활성화
        } else {
            registButton.disabled = true;   // 버튼 비활성화
        }
    }

    registId.addEventListener("input", (event) => {
        replaceInputId(event); 
        validateForm();
    });
    registPwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        validateForm();
    });
    registPwdRe.addEventListener("input", (event) => {
        replaceInputPwd(event); 
        validateForm();
    });
    registEmail.addEventListener("input", (event) => {
        replaceInputEmail(event);
        validateForm();
    });
    registPhone.addEventListener("input", (event) => {
        replaceInputPhone(event); 
    });
} catch(error) {
    console.error("오류 발생: ", error);
}