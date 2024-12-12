/* 공통 */

// jobPosting 업데이트
function updateJobPosting(updatedData) {
    Object.assign(jobPosting, updatedData);

    console.log(jobPosting);
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

// 다음 단계 이동
function nextStep(step) {
    // 입력된 정보로 객체 업데이트
    switch(step) {
        case 1:
            updateJobPosting({
                logo: document.querySelector("input[name='logo']").value,
                site: document.querySelector("input[name='site']").value,
                managerName: document.querySelector("input[name='managerName']").value,
                managerDept: document.querySelector("input[name='managerDept']").value,
                managerEmail: document.querySelector("input[name='managerEmail']").value
            })
            break;
        case 2:
            break;
        default:
            break;
    }

    // 세션 업데이트 (ajax 호출)
    $.ajax({
        url: contextPath + "/business/updateJobPosting.biz",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(jobPosting),
        success: function(response) {
            if (response === 1) {
                // 서버가 1을 반환하면 페이지 이동
                location.href = contextPath + "/registerNextStep.biz?step=" + (step + 1);
            } else if (response === 0) {
                // 서버가 0을 반환하면 오류 메시지 출력
                alert("오류가 발생했습니다.");
            }
        },
        error: function(error) {
            // Ajax 호출 실패 시 오류 메시지 출력
            alert("서버와의 통신에 실패했습니다.\n", error);
        }
    });
}

