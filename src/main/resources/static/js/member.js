// 타이핑 타이머 변수
let typingTimer;

/* input 입력 제한 */

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


/* form 유효성 검사 */

// 아이디 유효성 검사
function validateId(id) {
    return new Promise((resolve, reject) => {
        const idCheck = document.getElementById("id-check");
        idCheck.className = "NotChecked";
        idCheck.innerHTML = "";

        const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
        const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";
        const regex = /^[a-z][a-z0-9_]{3,19}$/;

        if(id == "") {
            // 아이디 미입력
            idCheck.innerHTML = errorImg + "필수입력항목입니다.";
            idCheck.className = "error";
            reject(false);
        } else if(!regex.test(id)) {
            // 입력양식 미준수
            idCheck.innerHTML = errorImg + "아이디는 4자리 이상, 20자리 이하의 영문 소문자, 숫자 '_'만으로 이루어져야합니다.";
            idCheck.className = "error";
            reject(false);
        } else {
            // 중복확인 > ajax 요청
            $.ajax({
                url: "idCheck.me",
                type: "GET",
                data: {checkId: id},
                success: function(result) {
                    if(result === "NNNNN") {
                        // 중복된 아이디인 경우
                        idCheck.innerHTML = errorImg + "중복된 아이디입니다.";
                        idCheck.className = "error";
                        reject(false);
                    } else {
                        // 통과
                        idCheck.innerHTML = checkImg + "사용가능한 아이디입니다.";
                        idCheck.className = "check";
                        resolve(true);
                    }
                },
                error: function(error) {
                    console.log("아이디 중복체크 ajax 실패 : ", error);
                    idCheck.innerHTML = checkImg + "오류가 발생했습니다. 다시 입력해주세요.";
                    idCheck.className = "check";
                    reject(false);
                }
            });
        }
    })
}

// 비밀번호 유효성 검사
function validatePwd(password) {
    const pwdCheck = document.getElementById("pwd-check");
    pwdCheck.innerHTML = "";
    pwdCheck.className = "NotChecked";

    const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
    const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,16}$/;

    if(password.length == "") {
        // 비밀번호 미입력
        pwdCheck.innerHTML = errorImg  + "필수입력항목입니다.";
        pwdCheck.className = "error";
        return false;
    } else if(password.length < 8) {
        // 비밀번호가 8자 이하인 경우
        pwdCheck.innerHTML = errorImg + "비밀번호는 8자 이상, 16자 이하로 해야합니다.";
        pwdCheck.className = "error";
        return false;
    } else if(!regex.test(password)) {
        // 입력 규칙 위반
        pwdCheck.innerHTML = errorImg + "영문 대문자, 소문자, 숫자, 특수문자가 각각 하나 이상 포함되어야합니다.";
        pwdCheck.className = "error";
        return false;
    } else {
        pwdCheck.innerHTML = checkImg + "사용가능한 비밀번호입니다.";
        pwdCheck.className = "check";
        return true;
    }
}

// 비밀번호 확인 유효성 검사
function validateRePwd(password, rePassword) {
    const rePwdCheck = document.getElementById("rePwd-check");
    rePwdCheck.className = "NotChecked";
    rePwdCheck.innerHTML = "";

    const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
    const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";

    if(rePassword.length == "") {
        // 비밀번호 확인 미입력
        rePwdCheck.innerHTML = errorImg + "필수입력항목입니다.";
        rePwdCheck.className = "error";
        return false;
    } else {
        // 기존 비밀번호 우선 검증
        if(!validatePwd(password)) {
            // 검증 미통과
            const passwordInput = document.querySelector("input[name='userPwd']");
            const pwdCheck = document.getElementById("pwd-check");
            pwdCheck.innerHTML = errorImg  + "유효한 비밀번호가 아닙니다. 다시 입력해주세요.";
            rePwdCheck.className = "error";
            passwordInput.focus();
            return false;
        } else {
            // 검증 통과
            if(password != rePassword) {
                // 비밀번호 불일치
                rePwdCheck.innerHTML = errorImg + "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
                rePwdCheck.className = "error";
                return false;
            } else {
                // 비밀번호 일치 -> 검증 통과
                rePwdCheck.innerHTML = checkImg + "확인완료";
                rePwdCheck.className = "check";
                return true;
            }
        }
    }
}

// 이메일 유효성 검사
function validateEmail(email) {
    const emailCheck = document.getElementById("email-check");
    emailCheck.className = "NotChecked";
    emailCheck.innerHTML = "";

    const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
    const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if(email == "") {
        // 이메일 미입력
        emailCheck.innerHTML = errorImg + "필수입력항목입니다.";
        emailCheck.className = "error";
        return false;
    } else if(!regex.test(email)) {
        // 입력 양식 미준수
        emailCheck.innerHTML = errorImg + "유효한 이메일 주소를 입력해주세요.";
        emailCheck.className = "error";
        return false;
    } else {
        emailCheck.innerHTML = checkImg + "사용가능한 메일 주소입니다.";
        emailCheck.className = "check";
        return true;
    }
}

// 약관 동의 유효성 검사
function validateTerms(requiredTerms) {
    const termsCheck = document.getElementById("terms-check");
    termsCheck.className = "NotChecked";
    termsCheck.innerHTML = "";

    const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
    const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";
    const allChecked = requiredTerms.every(checkbox => checkbox.checked);

    if (!allChecked) {
        // 필수 약관 미동의
        termsCheck.innerHTML = errorImg + "(필수)항목에 모두 체크해주세요. 하나라도 미동의 시 가입할 수 없습니다.";
        termsCheck.className = "error";
        return false;
    } else {
        termsCheck.innerHTML = checkImg + "약관 동의 완료";
        termsCheck.className = "check";
        return true;
    }
}

// 사업자등록번호 유효성 검사
function validateNumber(registNumber) {
    return new Promise((resolve, reject) => {
        const numberCheck = document.getElementById("number-check");
        numberCheck.className = "NotChecked";
        numberCheck.innerHTML = "";

        const checkImg = "<img src='" + contextPath + "/img/icon_check.png'>";
        const errorImg = "<img src='" + contextPath + "/img/icon_error.png'>";

        if(registNumber == "") {
            // 사업자등록번호 미입력
            numberCheck.innerHTML = errorImg + "필수입력항목입니다.";
            numberCheck.className = "error";
            reject(false);
        } else {
            // 사업자등록번호 조회 (오픈 API 1.1.0)
            // 서비스키
            const serviceKey = "gOn%2FFXCdwGgJ1DcdEYhnW%2BZ%2BNfxmcUslrsWA3MYlh4FLh2aUVeHUWn8y%2BUm07ed43SjDtsNA0xNV5ry2lbN0FQ%3D%3D";
            $.ajax({
                url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=" + serviceKey,
                type: "POST",
                data: JSON.stringify({
                    "b_no": [registNumber]
                }),
                dataType: "JSON",
                contentType: "application/json",
                accept: "application/json",
                success: function(result) {
                    if(result.data[0].tax_type === "국세청에 등록되지 않은 사업자등록번호입니다." || result.data[0].tax_type === "") {
                        // 조회 실패
                        numberCheck.innerHTML = errorImg + "등록되지않은 사업자등록번호입니다.";
                        numberCheck.className = "error";
                        reject(false);
                    } else {
                        // 조회 성공
                        numberCheck.innerHTML = checkImg + "확인완료";
                        numberCheck.className = "check";
                        resolve(true);
                    }
                },
                error: function(result) {
                    // API 호출 오류
                    console.log(result.responseText);
                    reject(false);
                }
            });
        }
    });
}


/* login.jsp */
try {
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
    console.log("login-section: ", error);
}


/* registrationPerson.jsp */
try {
    const registForm = document.querySelector("#registDetail-form.Person");
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

        validateTerms(Array.from(registTerms).filter(terms => terms.required));
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

            validateTerms(Array.from(registTerms).filter(terms => terms.required));
        });
    });

    // 전체 유효성 검사 함수
    function validateFormPerson() {
        const isIdValid = validateId(registId.value);
        const isPwdValid = Promise.resolve(validatePwd(registPwd.value));
        const isRePwdValid = Promise.resolve(validateRePwd(registPwd.value, registRePwd.value));
        const isEmailValid = Promise.resolve(validateEmail(registEmail.value));
        const isTermsValid = Promise.resolve(validateTerms(Array.from(registTerms).filter(terms => terms.required)));

        // 조건을 모두 만족하면 폼 제출
        Promise.all([isIdValid, isPwdValid, isRePwdValid, isEmailValid, isTermsValid]).then(results => {
            if(results.every(result => result == true)) {
                registForm.submit();
            } else {
                alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
                window.scrollTo(0, 0);
            }
        }).catch(error => {
            alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
            console.error(error);
            window.scrollTo(0, 0);
        })
    }

    registId.addEventListener("input", (event) => {
        replaceInputId(event);
        if(registId.value.length >= 4) {
            validateId(registId.value);
        } else {
            const idCheck = document.getElementById("id-check");
            idCheck.className = "NotChecked";
        }
    });
    registPwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        if(registPwd.value.length >= 8) {
            validatePwd(registPwd.value);
        } else {
            const pwdCheck = document.getElementById("pwd-check");
            pwdCheck.className = "NotChecked";
        }
    });
    registRePwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        if(registRePwd.value.length >= 8 && registRePwd.value >= registPwd.value) {
            validateRePwd(registPwd.value, registRePwd.value);
        } else {
            const rePwdCheck = document.getElementById("rePwd-check");
            rePwdCheck.className = "NotChecked";
        }
    });
    registEmail.addEventListener("input", (event) => {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => {
            validateEmail(registEmail.value);
        }, 1000);

        replaceInputEmail(event);
    });
    registPhone.addEventListener("input", (event) => {
        replaceInputNumber(event);
    });
    registButton.addEventListener("click", (event) => {
        validateFormPerson();
    });
} catch(error) {
    console.log("registration-Person: ", error);
}


/* registrationBusiness.jsp */
try {
    const registForm = document.querySelector("#registDetail-form.Business");
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

        validateTerms(Array.from(registTerms).filter(terms => terms.required));
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

            validateTerms(Array.from(registTerms).filter(terms => terms.required));
        });
    });

    // 전체 유효성 검사 함수
    function validateForm() {
        const isNumberValid = validateNumber(registNumber.value);
        const isIdValid = validateId(registId.value);
        const isPwdValid = Promise.resolve(validatePwd(registPwd.value));
        const isRePwdValid = Promise.resolve(validateRePwd(registPwd.value, registRePwd.value));
        const isEmailValid = Promise.resolve(validateEmail(registEmail.value));
        const isTermsValid = Promise.resolve(validateTerms(Array.from(registTerms).filter(terms => terms.required)));

        // 조건을 모두 만족하면 폼 제출
        Promise.all([isNumberValid, isIdValid, isPwdValid, isRePwdValid, isEmailValid, isTermsValid]).then(results => {
            if(results.every(result => result == true)) {
                registForm.submit();
            } else {
                alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
                window.scrollTo(0, 0);
            }
        }).catch(error => {
            alert("정확히 입력해주세요. 필수 항목은 반드시 작성해야합니다.");
            console.error(error);
            window.scrollTo(0, 0);
        })
    }

    registNumber.addEventListener("input", (event) => {
        replaceInputNumber(event);
        if(registNumber.value.length == 10) {
            validateNumber(registNumber.value);
        } else {
            const numberCheck = document.getElementById("number-check");
            numberCheck.className = "NotChecked";
        }
    })
    registId.addEventListener("input", (event) => {
        replaceInputId(event);
        if(registId.value.length >= 4) {
            validateId(registId.value);
        } else {
            const idCheck = document.getElementById("id-check");
            idCheck.className = "NotChecked";
        }
    });
    registPwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        if(registPwd.value.length >= 8) {
            validatePwd(registPwd.value);
        } else {
            const pwdCheck = document.getElementById("pwd-check");
            pwdCheck.className = "NotChecked";
        }
    });
    registRePwd.addEventListener("input", (event) => {
        replaceInputPwd(event);
        if(registRePwd.value.length >= 8 && registRePwd.value >= registPwd.value) {
            validateRePwd(registPwd.value, registRePwd.value);
        } else {
            const rePwdCheck = document.getElementById("rePwd-check");
            rePwdCheck.className = "NotChecked";
        }
    });
    registEmail.addEventListener("input", (event) => {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => {
            validateEmail(registEmail.value);
        }, 1000);

        replaceInputEmail(event);
    });
    registPhone.addEventListener("input", (event) => {
        replaceInputNumber(event);
    });
    registButton.addEventListener("click", (event) => {
        validateForm();
    });
} catch(error) {
    console.log("registration-Business: ", error);
}


/* findMember 전용 */
try {
    // 섹션 변경
    function changeFindSection() {
        const idSection = document.getElementById("findMember-section-id");
        const pwdSection = document.getElementById("findMember-section-pwd");
        let tabItems;
        let emailArticle;
        let phoneArticle;

        if(fd === "id") {
            idSection.classList.add("On");
            pwdSection.classList.remove("On");

            tabItems = idSection.querySelectorAll("#findMember-article-tab li");
            emailArticle = idSection.querySelector("#findMember-article-email");
            phoneArticle = idSection.querySelector("#findMember-article-phone");
        }
        else {
            idSection.classList.remove("On");
            pwdSection.classList.add("On");

            tabItems = pwdSection.querySelectorAll("#findMember-article-tab li");
            emailArticle = pwdSection.querySelector("#findMember-article-email");
            phoneArticle = pwdSection.querySelector("#findMember-article-phone");
        }

        // 아티클 변경
        if(fm === "email") {
            emailArticle.classList.add("On");
            phoneArticle.classList.remove("On");

            tabItems.forEach(item => item.classList.remove("On"));
            tabItems[0].classList.add("On");
        } else {
            emailArticle.classList.remove("On");
            phoneArticle.classList.add("On");

            tabItems.forEach(item => item.classList.remove("On"));
            tabItems[1].classList.add("On");
        }
    }

    // 섹션 초기값
    document.addEventListener("DOMContentLoaded", function() {
        changeFindSection();
    });

    // 링크 클릭 시 섹션 변경
    function changeFindData(findData) {
        fd = findData;
        changeFindSection();
    }

    // 탭 클릭 시 아티클 변경
    function changeFindMethod(findMethod) {
        fm = findMethod;
        changeFindSection();
    }
} catch(error) {
    console.log("find-Person: ", error);
}