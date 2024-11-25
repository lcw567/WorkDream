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


document.addEventListener("DOMContentLoaded", function () {
    // 직무 추가 버튼을 가져옵니다
    const addDutyButton = document.getElementById("addDutyButton");

    // 버튼 클릭 시 페이지 이동 이벤트 추가
    addDutyButton.addEventListener("click", function () {
        // 이동할 페이지 URL을 지정합니다.
        window.location.href = contextPath + "/business/positionAndCareer";  // 원하는 URL로 변경
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

document.addEventListener("DOMContentLoaded", function () {
    const maxDuties = 5; // 최대 직무 개수
    const addDutyButton = document.getElementById("addDutyButton");
    const jobDutiesContainer = addDutyButton.parentElement;

    // 로컬 스토리지에서 기존 데이터를 로드
    const storedDuties = JSON.parse(localStorage.getItem("jobDuties")) || [];

    // 초기 데이터 로드
    storedDuties.forEach((duty) => {
        addDutyElement(duty);
    });

    // 직무 추가 버튼 클릭 이벤트
    addDutyButton.addEventListener("click", function () {
        const currentDuties = jobDutiesContainer.querySelectorAll(".Job_duty");

        // 최대 개수 확인
        if (currentDuties.length >= maxDuties) {
            alert("직무는 최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        // URL 이동 (직무 입력 페이지로 이동)
        window.location.href = "http://localhost:3333/WorkDream/business/positionAndCareer";
    });

    // 직무를 추가하는 함수
    function addDutyElement(dutyText) {
        const currentDuties = jobDutiesContainer.querySelectorAll(".Job_duty");

        // 최대 개수 확인
        if (currentDuties.length >= maxDuties) {
            alert("직무는 최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        // 새로운 직무 요소 생성
        const newDuty = document.createElement("div");
        newDuty.classList.add("Job_duty");
        newDuty.innerHTML = `
            <p>${dutyText}</p>
            <button>
                <img src="../사진/letter-x_9215129.png" style="width: 25px; height: 25px;">
            </button>
        `;

        // 삭제 버튼 동작 추가
        newDuty.querySelector("button").addEventListener("click", function () {
            newDuty.remove();
            saveDutiesToLocalStorage(); // 삭제 후 로컬 스토리지 업데이트
        });

        // 직무 요소를 버튼 앞에 추가
        jobDutiesContainer.insertBefore(newDuty, addDutyButton);
        saveDutiesToLocalStorage(); // 추가 후 로컬 스토리지 업데이트
    }

    // URL로부터 데이터 로드 및 직무 추가
    function loadDutyFromURL() {
        const params = new URLSearchParams(window.location.search);
        const duty = params.get("duty"); // URL에서 'duty' 파라미터 가져오기
        if (duty) {
            addDutyElement(duty);
            saveDutiesToLocalStorage(); // 추가 후 로컬 스토리지 업데이트
        }
    }

    // 로컬 스토리지에서 데이터를 저장하는 함수
    function saveDutiesToLocalStorage() {
        const duties = Array.from(jobDutiesContainer.querySelectorAll(".Job_duty p"))
            .map((duty) => duty.textContent.trim());
        localStorage.setItem("jobDuties", JSON.stringify(duties));
    }

    // 페이지 로드 시 URL에서 데이터 로드
    loadDutyFromURL();
});

// 데이터 한 줄씩 추가로 표시
document.addEventListener("DOMContentLoaded", () => {
    const jobDataDisplayContainer = document.getElementById("jobDataDisplay");

    // 로컬 스토리지에서 데이터를 가져옴
    const jobData = JSON.parse(localStorage.getItem("jobDuties")) || [];

    // 데이터를 표시할 HTML 요소 초기화
    if (jobData.length === 0) {
        jobDataDisplayContainer.innerText = "직무 데이터가 없습니다.";
    } else {
        // 데이터가 있을 경우 각 데이터마다 `<p>` 생성
        jobData.forEach((data) => {
            const paragraph = document.createElement("p");
            paragraph.textContent = data;
            jobDataDisplayContainer.appendChild(paragraph);
        });
    }

    // 로컬 스토리지에서 데이터 삭제 (선택적)
    localStorage.removeItem("jobDuties");
});


document.addEventListener("DOMContentLoaded", () => {
    const fileInput = document.getElementById("Announcement-file");
    const fileNameInput = document.getElementById("Announcement_Introduction_fileName");
    const imagePreviewDiv = document.getElementById("Announcement_Introduction_img");
    const defaultImage = imagePreviewDiv.querySelector("img"); // 기존 이미지를 참조

    fileInput.addEventListener("change", () => {
        const file = fileInput.files[0];
        
        if (file) {
            // 파일 이름을 input에 표시
            fileNameInput.value = file.name;

            // 이미지 미리보기 생성
            const reader = new FileReader();
            reader.onload = function (e) {
                // 기존 기본 이미지를 숨기거나 제거
                defaultImage.classList.add("hidden");

                // 새 이미지 요소 생성 및 추가
                const img = document.createElement("img");
                img.src = e.target.result;
                img.classList.add("uploaded-image");
                img.alt = "미리보기 이미지";

                // 기존 이미지 제거 후 새 이미지 추가
                imagePreviewDiv.innerHTML = ""; // 기존 내용을 비우기
                imagePreviewDiv.appendChild(img);
            };
            reader.readAsDataURL(file); // 파일을 읽어 데이터 URL로 변환
        }
    });
});

document.addEventListener('DOMContentLoaded', () => {
    // 1. 로컬 스토리지에서 데이터 가져오기
    const jobData = JSON.parse(localStorage.getItem('jobData'));

    // 2. 데이터를 표시할 HTML 요소 가져오기
    const displayElement = document.getElementById('jobDataDisplay');

    // 3. 데이터가 있을 경우 화면에 표시
    if (jobData) {
        const workLocation = jobData.workLocation.length > 0 
            ? `근무지 - ${jobData.workLocation.join(', ')}`
            : '근무지 - 없음';

        const industry = jobData.industry.length > 0 
            ? `업종 - ${jobData.industry.join(', ')}`
            : '업종 - 없음';

        const formattedData = `
            ${jobData.rank} / ${jobData.position} / ${jobData.employmentType} / 
            경력 ${jobData.careerMin}년 ~ ${jobData.careerMax}년 / 학력 - ${jobData.education} / 
            근무요일 - ${jobData.workDays} / 근무시간 - ${jobData.workTimeMin} ~ ${jobData.workTimeMax} / 
            예상연봉 - ${jobData.salaryMin} ~ ${jobData.salaryMax}만원 / 
            ${workLocation} / ${industry} / 기업 유형 - ${jobData.companyType} / 
            재직 여부 - ${jobData.employmentStatus}
        `.trim();

        // 데이터를 한 줄로 표시
        displayElement.innerText = formattedData.replace(/\s+/g, ' ');
    } else {
        displayElement.innerText = '직무 데이터가 없습니다.';
    }

    // 4. 로컬 스토리지에서 데이터 삭제 (선택적)
    localStorage.removeItem('jobData');
});
