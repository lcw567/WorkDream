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

// 숫자칸 입력제한
function replaceInputNumber(event) {
    let value = event.target.value;

    // 띄어쓰기 제한, 숫자만 입력 가능
    value = value.replace(/[^0-9]/g, '');
    event.target.value = value;
}

// 아이디 유효성 검사
function validateId(id) {
    const idCheck = document.getElementById("id-check");
    const idConfirmError = document.getElementById("id-error-confirm");
    const regex = /^[a-z][a-z0-9_]{3,19}$/;

    if(regex.test(id)) {
        console.log("id 유효성 검사 통과");
        idCheck.style.display = "flex";
        idConfirmError.style.display = "none";
        return true;
    } else {
        idCheck.style.display = "none";
        idConfirmError.style.display = "flex";
        return false;
    }
}

// 비밀번호 유효성 검사
function validatePwd(password) {
    const pwdPatternError = document.getElementById("pwd-error-pattern");
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;
    
    if(regex.test(password)) {
        pwdPatternError.style.display = "none";
        return true;
    } else {
        pwdPatternError.style.display = "flex";
        return false;
    }
}

// 비밀번호 확인 유효성 검사
function validateRePwd(password, rePassword) {
    const pwdMatchError = document.getElementById("pwd-error-confirm");
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;

    if(password == rePassword && regex.test(rePassword)) {
        pwdMatchError.style.display = "none";
        return true;
    } else {
        pwdMatchError.style.display = "flex";
        return false;
    }
}

// 이메일 유효성 검사
function validateEmail(email) {
    const emailPatternError = document.getElementById("email-error-pattern");
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if(regex.test(email)) {
        emailPatternError.style.display = "none";
        return true;
    } else {
        emailPatternError.style.display = "flex";
        return false;
    }
}

// 약관 동의 유효성 검사
function validateTerms(requiredTerms) {
    const termsRequiredError = document.getElementById("terms-error-required");
    const allChecked = requiredTerms.every(checkbox => checkbox.checked);

    if (!allChecked) {
        termsRequiredError.style.display = "flex";
        return false;
    }

    termsRequiredError.style.display = "none";
    return true;
}

// 사업자등록번호 유효성 검사
function validateNumber(registNumber) {
    const numberCheck = document.getElementById("number-check");
    const numberConfirmError = document.getElementById("number-error-confirm");

    console.log("사업자등록번호 유효성 검사 통과");
    numberCheck.style.display = "flex";
    return true;
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
    const registId = document.querySelector("#registDetail-form.Person #registId");
    const registPwd = document.querySelector("#registDetail-form.Person #registPwd");
    const registRePwd = document.querySelector("#registDetail-form.Person #registRePwd");
    const registEmail = document.querySelector("#registDetail-form.Person #registEmail");
    const registPhone = document.querySelector("#registDetail-form.Person #registPhone");
    const registTermsCheckButton = document.querySelector("#registDetail-form.Person #allCheckTerms");
    const registTerms = document.querySelectorAll("#registDetail-form.Person .terms");
    const registButton = document.querySelector("#registDetail-form.Person #btnRegist");

    // 약관 전체 동의/해제
    registTermsCheckButton.addEventListener('change', function() {
        registTerms.forEach(checkbox => {
            checkbox.checked = registTermsCheckButton.checked;
        })
    });

    registTerms.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            if (Array.from(registTerms).every(chk => chk.checked)) {
                registTermsCheckButton.checked = true;
                registTermsCheckButton.indeterminate = false;
            } else if (Array.from(registTerms).every(chk => !chk.checked)) {
                registTermsCheckButton.checked = false;
                registTermsCheckButton.indeterminate = false;
            } else {
                registTermsCheckButton.checked = false;
                registTermsCheckButton.indeterminate = true;
            }
        });
    });

    // 전체 유효성 검사 함수
    function validateForm() {
        const isIdValid = validateId(registId.value);
        const isPwdValid = validatePwd(registPwd.value);
        const isRePwdValid = validateRePwd(registPwd.value, registRePwd.value);
        const isEmailValid = validateEmail(registEmail.value);
        const isTermsValid = validateTerms(Array.from(registTerms).filter(terms => terms.required));

        // 조건을 모두 만족하면 폼 제출
        if (isIdValid && isPwdValid && isRePwdValid && isEmailValid && isTermsValid) {
            form.submit();
        } else {
            alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
            window.scrollTo(0, 0);
        }
    }

    registId.addEventListener("input", (event) => {
        replaceInputId(event);
        if(registId.value.length >= 4) {
            validateId(registId.value);
        } else {
            const idCheck = document.getElementById("id-check");
            const idConfirmError = document.getElementById("id-error-confirm");

            idCheck.style.display = "none";
            idConfirmError.style.display = "none";
        }
    });
    registPwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        validatePwd(registPwd.value);
    });
    registRePwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        validateRePwd(registPwd.value, registRePwd.value);
    });
    registEmail.addEventListener("input", (event) => {
        replaceInputEmail(event);
        validateEmail(registEmail.value);
    });
    registPhone.addEventListener("input", (event) => {
        replaceInputNumber(event);
    });
    registButton.addEventListener("click", (event) => {
        validateForm();
    });
} catch(error) {
    console.error("오류 발생: ", error);
}


/* registrationBusiness.jsp */
try {
    const registNumber = document.querySelector("#registDetail-form.Business #registNumber");
    const registId = document.querySelector("#registDetail-form.Business #registId");
    const registPwd = document.querySelector("#registDetail-form.Business #registPwd");
    const registRePwd = document.querySelector("#registDetail-form.Business #registRePwd");
    const registEmail = document.querySelector("#registDetail-form.Business #registEmail");
    const registPhone = document.querySelector("#registDetail-form.Business #registPhone");
    const registTermsCheckButton = document.querySelector("#registDetail-form.Business #allCheckTerms");
    const registTerms = document.querySelectorAll("#registDetail-form.Business .terms");
    const registButton = document.querySelector("#registDetail-form.Business #btnRegist");

    // 약관 전체 동의/해제
    registTermsCheckButton.addEventListener('change', function() {
        registTerms.forEach(checkbox => {
            checkbox.checked = registTermsCheckButton.checked;
        })
    });

    registTerms.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            if (Array.from(registTerms).every(chk => chk.checked)) {
                registTermsCheckButton.checked = true;
                registTermsCheckButton.indeterminate = false;
            } else if (Array.from(registTerms).every(chk => !chk.checked)) {
                registTermsCheckButton.checked = false;
                registTermsCheckButton.indeterminate = false;
            } else {
                registTermsCheckButton.checked = false;
                registTermsCheckButton.indeterminate = true;
            }
        });
    });

    // 전체 유효성 검사 함수
    function validateForm() {
        const isNumberValid = validateNumber(registNumber.value);
        const isIdValid = validateId(registId.value);
        const isPwdValid = validatePwd(registPwd.value);
        const isRePwdValid = validateRePwd(registPwd.value, registRePwd.value);
        const isEmailValid = validateEmail(registEmail.value);
        const isTermsValid = validateTerms(Array.from(registTerms).filter(terms => terms.required));

        // 조건을 모두 만족하면 폼 제출
        if (isNumberValid && isIdValid && isPwdValid && isRePwdValid && isEmailValid && isTermsValid) {
            form.submit();
        } else {
            alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
            window.scrollTo(0, 0);
        }
    }

    registNumber.addEventListener("input", (event) => {
        replaceInputNumber(event);
        if(registNumber.value.length === 10) {
            validateNumber(registNumber.value);
        } else {
            const numberCheck = document.getElementById("number-check");
            const numberConfirmError = document.getElementById("number-error-confirm");

            numberCheck.style.display = "none";
            numberConfirmError.style.display = "none";
        }
    });
    registId.addEventListener("input", (event) => {
        replaceInputId(event);
        if(registId.value.length >= 4) {
            validateId(registId.value);
        } else {
            const idCheck = document.getElementById("id-check");
            const idConfirmError = document.getElementById("id-error-confirm");

            idCheck.style.display = "none";
            idConfirmError.style.display = "none";
        }
    });
    registPwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        validatePwd(registPwd.value);
    });
    registRePwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        validateRePwd(registPwd.value, registRePwd.value);
    });
    registEmail.addEventListener("input", (event) => {
        replaceInputEmail(event);
        validateEmail(registEmail.value);
    });
    registPhone.addEventListener("input", (event) => {
        replaceInputNumber(event);
    });
    registButton.addEventListener("click", (event) => {
        validateForm();
    });
} catch(error) {
    console.error("오류 발생: ", error);
}