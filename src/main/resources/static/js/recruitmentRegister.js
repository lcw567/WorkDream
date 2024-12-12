/* 공통 */

// jobPosting 업데이트
function updateJobPosting(updatedData) {
    Object.assign(jobPosting, updatedData);

    console.log(jobPosting);
}

// jobPosting sesssion 업데이트
async function ajaxUpdateJobPosting() {
    try {
        const response = await $.ajax({
            url: contextPath + "/business/updateJobPosting.biz",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(jobPosting)
        });

        return response;
    } catch (error) {
        throw new Error("서버와의 통신에 실패했습니다.");
    }
}

// 다음 단계로 이동
async function nextStep(step) {
    let URL;

    // 입력된 정보로 객체 업데이트
    switch(step) {
        case 1:
            updateJobPosting({
                logo: document.querySelector("input[name='logo']").value,
                site: document.querySelector("input[name='site']").value,
                managerName: document.querySelector("input[name='managerName']").value,
                managerDept: document.querySelector("input[name='managerDept']").value,
                managerEmail: document.querySelector("input[name='managerEmail']").value
            });
            URL = contextPath + "/recruitmentRegister?step=2";
            break;
        case 2:
            URL = contextPath;
            break;
        default:
            break;
    }

    // 세션 업데이트 (ajax 호출)
    try {
        const result = await ajaxUpdateJobPosting();
        
        // 서버가 1을 반환하면 페이지 이동
        if (result === 1) {
            location.href = URL;
        } else {
            alert("오류가 발생했습니다. 다시 시도해주세요.");
        }
    } catch (error) {
        // 오류 메시지 출력
        alert("오류가 발생했습니다. 다시 시도해주세요.");
        console(error);
    }
}

// 이전 단계로 이동
function previousStep(step) {
    let URL;

    switch(step) {
        case 1:
            const backConfirm = confirm("취소 시 지금까지 작성한 내용이 사라집니다.\n취소하겠습니까?");
            URL = contextPath + "/business/recruitmentManager";
            break;
        case 2:
            
    }
}


/* recruitmentRegister1.jsp */

// 홈페이지 주소 수정 버튼
function enableWebsiteInput() {
    const websiteInput = document.querySelector("input[name='site'");

    // 수정 버튼 숨김
    document.getElementById('editButton').style.display = 'none';

    // readonly 속성 제거
    websiteInput.readOnly = false;
    websiteInput.focus();
}

// 파일을 선택했을 때 호출되는 함수
function updateFileName() {
    const fileInput = document.getElementById("real-file");
    const fileNameInput = document.getElementById("logoFileName");

    // 선택된 파일의 이름을 text input에 설정
    const fileName = fileInput.files[0] ? fileInput.files[0].name : ''; // 파일이 없으면 빈 문자열
    fileNameInput.value = fileName;
}

// 파일을 선택했을 때 호출되는 함수
function updateFileName() {
    const fileInput = document.getElementById("real-file");
    const fileNameInput = document.getElementById("logoFileName");
    const logoPreview = document.getElementById("logoPreview");
    const companyLogo = document.getElementById("Company_logo");

    const file = fileInput.files[0];

    // 선택된 파일이 존재하고 이미지 파일일 때
    if (file && file.type.startsWith("image/")) {
        // 파일 이름을 텍스트 입력 필드에 표시
        fileNameInput.value = file.name;

        // FileReader를 사용하여 이미지를 읽어옴
        const reader = new FileReader();
        reader.onload = function(e) {
            // 이미지 URL을 div에 삽입하여 표시
            logoPreview.src = e.target.result;  // 읽은 이미지 URL
            logoPreview.style.display = "block";  // 이미지 표시
        };

        // 이미지 파일을 읽기
        reader.readAsDataURL(file);
    } else {
        // 만약 이미지 파일이 아닌 경우
        fileNameInput.value = "";
        logoPreview.style.display = "none";  // 이미지 숨기기
    }
}

