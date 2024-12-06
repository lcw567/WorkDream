// 홈페이지 주소 입력 필드 수정 가능하게 하는 함수
function enableWebsiteInput() {
    const websiteInput = document.getElementById('websiteInput');
    websiteInput.removeAttribute('readonly'); // readonly 속성 제거하여 수정 가능하게 함
    websiteInput.focus(); // 입력 필드에 포커스를 주어 사용자에게 바로 입력을 시작하게 함
    document.getElementById('editButton').style.display = 'none'; // 수정 버튼 숨김
}

// 홈페이지 주소 입력 필드가 블러(커서가 벗어났을 때)될 때 다시 readonly 상태로 되돌리기
function disableWebsiteInput() {
    const websiteInput = document.getElementById('websiteInput');
    websiteInput.setAttribute('readonly', 'true'); // readonly 속성 추가
    document.getElementById('editButton').style.display = 'inline-block'; // 수정 버튼 다시 보이게 함
}

// 홈페이지 주소 입력 필드에서 커서가 벗어났을 때 수정 불가능하게 설정
document.getElementById('websiteInput').addEventListener('blur', disableWebsiteInput);



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

