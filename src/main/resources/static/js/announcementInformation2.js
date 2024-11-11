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

//직무추가 버튼을 눌렀을때 직무 div가 생성되되 최대 5개로 제한
document.addEventListener("DOMContentLoaded", function () {
    // 최대 직무의 개수가 5개로 제한
    const maxDuties = 5;

    // Add Duty button element
    const addDutyButton = document.getElementById("addDutyButton");

    // Function to add a new job duty
    function addJobDuty() {
        const jobDutiesContainer = addDutyButton.parentElement;
        const currentDuties = jobDutiesContainer.querySelectorAll(".Job_duty");

        // Check if the maximum number of duties is reached
        if (currentDuties.length >= maxDuties) {
            alert("직무는 최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        // Create a new job duty div
        const newDuty = document.createElement("div");
        newDuty.classList.add("Job_duty");
        newDuty.innerHTML = `
            <p>사원 / 경력 O년~ O년 / 학력 - 4년제 대학 졸업 / 채용시 협의</p>
            <button><img src="../사진/letter-x_9215129.png" style="width: 25px; height: 25px;"></button>
        `;

        // Add delete functionality to the new button
        newDuty.querySelector("button").addEventListener("click", function () {
            newDuty.remove();
        });

        // Append the new duty div before the Add Duty button
        jobDutiesContainer.insertBefore(newDuty, addDutyButton);
    }

    // Add event listener to the Add Duty button
    addDutyButton.addEventListener("click", addJobDuty);
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


