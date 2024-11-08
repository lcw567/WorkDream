document.addEventListener("DOMContentLoaded", function () {
    // 제목 입력 필드를 가져옵니다
    const announcementTitle = document.getElementById("Announcement_Title");

    // 글자 수 제한을 설정합니다
    const maxLength = 25;

    // 제목 입력 시 글자 수를 체크하는 이벤트 리스너를 추가합니다
    announcementTitle.addEventListener("input", function () {
        // 입력된 글자 수를 계산합니다
        const currentLength = announcementTitle.value.length;

        // 25자 이상일 경우 글자를 자르거나 경고 메시지를 표시합니다
        if (currentLength > maxLength) {
            announcementTitle.value = announcementTitle.value.substring(0, maxLength);  // 초과한 글자를 잘라냄
            alert("제목은 25자 이내로 입력해주세요.");  // 경고 메시지
        }

        // 입력된 글자 수를 화면에 표시할 수도 있습니다 (옵션)
        // 예: "현재 글자 수: X/25"
        const charCountElement = document.getElementById("charCount");
        if (!charCountElement) {
            const charCountDiv = document.createElement("div");
            charCountDiv.id = "charCount";
            charCountDiv.innerHTML = `현재 글자 수: ${currentLength}/${maxLength}`;
            document.getElementById("Announcement_Title").insertAdjacentElement('afterend', charCountDiv);
        } else {
            charCountElement.innerHTML = `현재 글자 수: ${currentLength}/${maxLength}`;
        }
    });
});


//직무의 X버튼을 눌렀을때 div가 삭제
document.addEventListener("DOMContentLoaded", function () {
    // 모든 삭제 버튼을 가져옵니다
    const deleteButtons = document.querySelectorAll(".Job_duty button");

    // 각 버튼에 클릭 이벤트를 추가합니다
    deleteButtons.forEach(function (button) {
        button.addEventListener("click", function (event) {
            // 버튼의 부모 요소인 .Job_duty div를 가져옵니다
            const jobDutyDiv = event.target.closest(".Job_duty");

            // 해당 .Job_duty div를 삭제합니다
            if (jobDutyDiv) {
                jobDutyDiv.remove();
            }
        });
    });
});

//직무추가 버튼을 눌렀을때 직무 div가 생성되되 최대 5개로 제한
document.addEventListener("DOMContentLoaded", function () {
    // 최대 직무 개수 설정
    const maxDuties = 5;

    // "직무 추가" 버튼 가져오기
    const addDutyButton = document.querySelector(".Add_Duty");

    // 새 직무를 추가하는 함수
    function addJobDuty() {
        // 직무 목록이 있는 컨테이너 가져오기
        const jobDutiesContainer = addDutyButton.parentElement;

        // 현재 직무 개수 확인
        const currentDuties = jobDutiesContainer.querySelectorAll(".Job_duty");

        // 최대 개수에 도달했는지 확인
        if (currentDuties.length >= maxDuties) {
            alert("직무는 최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        // 새로운 직무 div 생성
        const newDuty = document.createElement("div");
        newDuty.classList.add("Job_duty");
        newDuty.innerHTML = `
            <p>사원 / 경력 O년~ O년 / 학력 - 4년제 대학 졸업 / 채용시 협의</p>
            <button><img src="${pageContext.request.contextPath}/img/letter-x_9215129.png" style="width: 25px; height: 25px;"></button>
        `;

        // 새로 생성된 버튼에 삭제 기능 추가
        newDuty.querySelector("button").addEventListener("click", function () {
            newDuty.remove();
        });

        // "직무 추가" 버튼 앞에 새로운 직무 div 추가
        jobDutiesContainer.insertBefore(newDuty, addDutyButton);
    }

    // "직무 추가" 버튼에 이벤트 리스너 추가
    addDutyButton.addEventListener("click", addJobDuty);
});


document.addEventListener("DOMContentLoaded", function () {
    // Get the "Add Duty" button element
    const addDutyButton = document.querySelector(".Add_Duty");

    // Add a click event listener to redirect to the specified URL
    addDutyButton.addEventListener("click", function () {
        window.location.href = "http://localhost:3333/WorkDream/business/positionAndCareer";
    });
});


//파일첨부 버튼을 눌러서 가져온 파일이름을 input에 넣기
document.addEventListener("DOMContentLoaded", function () {
    // 파일 선택 input과 파일 이름을 표시할 input을 가져옵니다
    const fileInput = document.getElementById("Announcement-file");
    const fileNameInput = document.querySelector("#Announcement_Introduction_file input[type='text']");

    // 파일이 선택될 때 실행되는 이벤트 리스너
    fileInput.addEventListener("change", function () {
        // 선택된 파일이 있는지 확인
        const file = fileInput.files[0];
        if (file) {
            // 파일 이름을 텍스트 input에 표시
            fileNameInput.value = file.name;
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // 파일 선택 input과 파일 이름을 표시할 input 요소 가져오기
    const fileInput = document.getElementById("Announcement-file");
    const fileNameInput = document.querySelector("#Announcement_Introduction_file input[type='text']");
    const previewContainer = document.getElementById("Announcement_Introduction_img");

    // 파일 선택 시 파일 이름과 이미지 미리보기 설정
    fileInput.addEventListener("change", function () {
        const file = fileInput.files[0];
        
        if (file) {
            // 파일 이름을 텍스트 input에 표시
            fileNameInput.value = file.name;

            // 이미지 미리보기 설정
            const reader = new FileReader();
            reader.onload = function (e) {
                // 이미지 요소 생성 및 src 속성 설정
                const image = document.createElement("img");
                image.src = e.target.result;
                image.alt = "선택한 이미지 미리보기";

                // 이미지가 div를 가득 채우도록 설정
                image.style.width = "100%";
                image.style.height = "100%";
                image.style.objectFit = "cover"; // 이미지 비율을 유지하며 가득 채움

                // 기존 미리보기 이미지 제거
                previewContainer.innerHTML = '';
                
                // 새 이미지 추가
                previewContainer.appendChild(image);
            };

            // 파일을 읽어 데이터 URL로 변환
            reader.readAsDataURL(file);
        }
    });
});

