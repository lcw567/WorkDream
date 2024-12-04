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
    try {
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
        });
    } catch(error) {
        console.log("validateId: ", error);
    }
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
    try {
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
    } catch(error) {
        console.log("validateEmail: ", error);
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
    try {
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
                // 사업자등록번호 조회 (오픈 API 연결)
                $.ajax({
                    url: "numberCheck.api",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ checkNumber: registNumber }),
                    success: function(result) {
                        if(!result) {
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
                    }, error: function(error) {
                        // API 호출 오류
                        console.error(error);
                        numberCheck.innerHTML = errorImg + "오류가 발생했습니다. 다시 시도해주세요.";
                        numberCheck.className = "error";
                        reject(false);
                    }
                });
            }
        });
    } catch(error) {
        console.log("validateNumber: ", error);
    }
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
    const idInputs = document.querySelectorAll("input[name='userId'");
    const nameInputs = document.querySelectorAll("input[name='userName']");
    const emailInputs = document.querySelectorAll("input[type='email']");
    const phoneInputs = document.querySelectorAll("input[name='phone']");
    const numberInputs = document.querySelectorAll("input[name='registrationNumber']");

    const confirmButtons = document.querySelectorAll("#btnConfirm");
    const confirmInputs = document.querySelectorAll("#inputConfirm");
    const confirmChecks = document.querySelectorAll("#confirm-check");
    let confirmNumber;

    const findForms = document.querySelectorAll("#findMember-form");
    const findButtons = document.querySelectorAll("#btnFindMember");

    // 섹션 요소 변경
    function changeFindSection() {
        const idSection = document.getElementById("findMember-section-id");
        const pwdSection = document.getElementById("findMember-section-pwd");
        let tabItems;
        let emailArticle;
        let phoneArticle;
        let numberArtice;

        if(ut === "P") {
            // 섹션 변경 (개인)
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

            // 아티클 변경 (개인)
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
        } else {
            // 섹션 변경 (기업)
            if(fd === "id") {
                idSection.classList.add("On");
                pwdSection.classList.remove("On");

                tabItems = idSection.querySelectorAll("#findMember-article-tab li");
                emailArticle = idSection.querySelector("#findMember-article-email");
                phoneArticle = idSection.querySelector("#findMember-article-phone");
                numberArtice = idSection.querySelector("#findMember-article-number");
            }
            else {
                idSection.classList.remove("On");
                pwdSection.classList.add("On");

                tabItems = pwdSection.querySelectorAll("#findMember-article-tab li");
                emailArticle = pwdSection.querySelector("#findMember-article-email");
                phoneArticle = pwdSection.querySelector("#findMember-article-phone");
                numberArtice = pwdSection.querySelector("#findMember-article-number");
            }

            // 아티클 변경 (기업)
            if(fm === "email") {
                emailArticle.classList.add("On");
                phoneArticle.classList.remove("On");
                numberArtice.classList.remove("On");

                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[0].classList.add("On");
            } else if(fm === "phone") {
                emailArticle.classList.remove("On");
                phoneArticle.classList.add("On");
                numberArtice.classList.remove("On");

                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[1].classList.add("On");
            } else {
                emailArticle.classList.remove("On");
                phoneArticle.classList.remove("On");
                numberArtice.classList.add("On");

                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[2].classList.add("On");
            }
        }
    }

    // 섹션 초기값
    document.addEventListener("DOMContentLoaded", function() {
        changeFindSection();
    });

    // 탭 클릭 시 아티클 변경
    function changeFindMethod(findMethod) {
        // 입력값 초기화
        const inputs = document.querySelectorAll("input[type='text'], input[type='email']");
        inputs.forEach(input => {
            input.value = "";
        });
        confirmButtons.forEach(button => {
            button.innerText = "인증번호 발송";
        })
        confirmInputs.forEach(input => {
            input.disabled = true;
        })

        fm = findMethod;
        changeFindSection();
    }

    // 인증번호 랜덤 생성 (6자리)
    function generateConfirmNumber() {
        const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        let confirmNumber = "";

        for(let i = 0; i < 6; i++) {
            const randomIndex = Math.floor(Math.random() * characters.length);
            confirmNumber += characters[randomIndex];
        }

        return confirmNumber;
    }

    // 인증번호 전송
    function sendCofirmNumber(event, index) {
        let checkName = nameInputs[index];
        const checkInputs = document.querySelectorAll("input[name='email'], input[name='phone'], input[name='registrationNumber']");
        let isCheckValid = false;
        confirmNumber = generateConfirmNumber();

        if(checkInputs && checkInputs[index].value) {
            switch(fd) {
                case "pwd":
                    try {
                        const regex = /^[a-z][a-z0-9_]{3,19}$/;
                        if(idInputs[index].value == "" || !regex.test(idInputs[index].value)) {
                            break;
                        }
                    } catch(error) {
                        console.log("sendCofirmNumber: ", error);
                    }
                default:
                    if(fm === "email") {
                        // 이메일로 찾기
                        const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                        isCheckValid = regex.test(checkInputs[index].value);
                    } else if(fm === "phone") {
                        // 휴대폰 번호로 찾기
                        isCheckValid = (checkInputs[index].value.length >= 10);
                    } else {
                        // 사업자등록번호로 찾기
                        try {
                            isCheckValid = (checkInputs[index].value == 10);
                        } catch(error) {
                            console.log("sendCofirmNumber: ", error);
                        }
                    }
                    break;
            }
        }

        if(checkName.value != "" && isCheckValid) {
            prompt("인증번호가 전송되었습니다. 인증번호 :", confirmNumber);
            event.target.innerText = "재전송";
            confirmInputs[index].removeAttribute("disabled");
            confirmInputs[index].focus();
        } else {
            alert("회원 정보를 정확하게 입력해주세요.");
            confirmInputs.forEach(input => {
                input.disabled = true;
            })
        }
    }

    // 조회 버튼
    function validateFindForm(event, index) {
        // 유효성 검증
        const nameInput = nameInputs[index];
        const inputs = document.querySelectorAll("input[name='email'], input[name='phone'], input[name='registrationNumber']");
        const checkInput = confirmInputs[index];

        if(nameInput.value != "" &&  inputs[index].value != "" && checkInput.value != "") {
            if(checkInput.value === confirmNumber) {
                findForms[index].submit();
            } else {
                alert("인증번호가 틀립니다. 다시 시도해주세요.");
                checkInput.value = "";
                checkInput.focus();
            }
        } else {
            alert("회원 정보를 정확하게 입력해주세요.");
        }
    }

    idInputs.forEach(input => {
        input.addEventListener("input", (event) => {
            replaceInputId(event);
        })
    });
    emailInputs.forEach((input, index) => {
        input.addEventListener("input", (event) => {
            replaceInputEmail(event);
        });
    });
    phoneInputs.forEach(input => {
        input.addEventListener("input", (event) => {
            replaceInputNumber(event);
        })
    });
    numberInputs.forEach(input => {
        input.addEventListener("input", (event) => {
            replaceInputNumber(event);
        })
    });
    confirmInputs.forEach(input => {
        input.addEventListener("input", (event) => {
            const validInput = event.target.value.replace(/[^a-zA-Z0-9]/g, "");
            event.target.value = validInput;
        })
    });
    confirmButtons.forEach((button, index) => {
        button.addEventListener("click", (event) => {
            sendCofirmNumber(event, index);
        })
    });
    findButtons.forEach((button, index) => {
        button.addEventListener("click", (event) => {
            validateFindForm(event, index);
        })
    })
} catch(error) {
    console.log("find-Person: ", error);
}

/* findMemberResult.jsp 전용 */
try {
     // 초기값 설정
    function settingFindSection() {
        const idArticle = document.getElementById("findResult-article-id");
        const pwdArticle = document.getElementById("findResult-article-pwd");
        let tabItems;

        if(ut === "P") {
            // 섹션 변경 (개인)
            if(fd === "id") {
                idArticle.classList.add("On");
                pwdArticle.classList.remove("On");
                tabItems = idArticle.querySelectorAll("#findResult-article-tab li");
            }
            else {
                idArticle.classList.remove("On");
                pwdArticle.classList.add("On");
                tabItems = pwdArticle.querySelectorAll("#findResult-article-tab li");
            }

            // 아티클 변경 (개인)
            if(fm === "email") {
                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[0].classList.add("On");
            } else {
                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[1].classList.add("On");
            }
        } else {
            // 섹션 변경 (기업)
            if(fd === "id") {
                idArticle.classList.add("On");
                pwdArticle.classList.remove("On");
                tabItems = idArticle.querySelectorAll("#findResult-article-tab li");
            }
            else {
                idArticle.classList.remove("On");
                pwdArticle.classList.add("On");
                tabItems = pwdArticle.querySelectorAll("#findResult-article-tab li");
            }

            // 아티클 변경 (기업)
            if(fm === "email") {
                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[0].classList.add("On");
            } else if(fm === "phone") {
                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[1].classList.add("On");
            } else {
                tabItems.forEach(item => item.classList.remove("On"));
                tabItems[2].classList.add("On");
            }
        }

        // input 크기 조절
        const inputs = document.querySelectorAll("#findResult-main input");
        inputs.forEach(input => {
            const length = input.value.length;
            input.style.width = (length + 1) + 'rem';
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
        try{
            settingFindSection();
        } catch(error) {
            console.log("settingFindSection: ", error);
        }
    });
} catch(error) {
    console.log("find-Result: ", error);
}
