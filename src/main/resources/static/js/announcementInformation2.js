const data = {
    dutyList: [],
    tmpDyty: {
        rank: "",
        position: "",
        employment_type: "정규직",
        career_type: "경력 무관",
        career_year_min: "",
        career_year_max: "",
        academic: "학력무관",
        work_days: "주 5일",
        work_time_min: "",
        work_time_max: "",
        expected_salary_min: "",
        expected_salary_max: "",
        locationList: [],
        industryList: [],
        skillList: [],
        company_type: "대기업",
        companyList: [],
        employment_status: "재직무관",
    },
}

document.addEventListener('DOMContentLoaded', function () {

    // 공통 함수: 입력 필드 생성 및 처리
    function createInputHandler(container, placeholderText, wrapperClass, key) {
        return function () {
            const wrapper = document.createElement('div');
            wrapper.classList.add(wrapperClass);

            const inputField = document.createElement('input');
            inputField.setAttribute('placeholder', placeholderText);
            inputField.style.border = 'none';
            inputField.style.backgroundColor = 'transparent';
            inputField.style.color = 'white';
            inputField.style.fontSize = '14px';

            const deleteButton = document.createElement('button');
            deleteButton.textContent = 'x';
            deleteButton.classList.add('delete-btn');

            deleteButton.addEventListener('click', () => {
                if (wrapper.parentNode) {
                    removeListValue(key, wrapper.childNodes[0].innerText);
                    wrapper.parentNode.removeChild(wrapper);
                }
            });

            const confirmInput = () => {
                const enteredText = inputField.value.trim();
                if (!enteredText) {
                    alert(`${placeholderText}를 입력해주세요.`);
                    inputField.focus();
                    return;
                }

                const isDuplicate = Array.from(container.querySelectorAll(`.${wrapperClass} p`)).some(
                    (p) => p.textContent.trim() === enteredText
                );

                if (isDuplicate) {
                    alert(`${enteredText}는 이미 추가된 ${placeholderText}입니다. 다른 값을 입력해주세요.`);
                    inputField.focus();
                    return;
                }

                wrapper.innerHTML = '';
                const textContent = document.createElement('p');
                textContent.textContent = enteredText;

                wrapper.appendChild(textContent);
                wrapper.appendChild(deleteButton);

                addListValue(key, enteredText);
            };

            inputField.addEventListener('keypress', (event) => {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    console.log(event.target)
                    confirmInput();
                }
            });

            wrapper.appendChild(inputField);
            wrapper.appendChild(deleteButton);
            container.appendChild(wrapper);

            inputField.focus();
        };
    }

    const workLocationAddressButton = document.querySelector('.Work_Location_Address');
    const locationContainer = document.getElementById('location-container');
    workLocationAddressButton.addEventListener(
        'click',
        createInputHandler(locationContainer, '지역', 'Work_Location', "locationList")
    );

    const industryCategoryButton = document.querySelector('.Industry_Category');
    const industryContainer = document.getElementById('industry-container');
    industryCategoryButton.addEventListener(
        'click',
        createInputHandler(industryContainer, '업종', 'Industry_Type', "industryList")
    );

    const addCompanyButton = document.querySelector('.add-company-btn');
    const companyContainer = document.getElementById('company-container');
    addCompanyButton.addEventListener(
        'click',
        createInputHandler(companyContainer, '기업명', 'Company_Type', "companyList")
    );

    const skillSearchInput = document.getElementById('Skill_Search_Keyward');
    const skillContainer = document.getElementById('skill-container');

    skillSearchInput.addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            const keyword = skillSearchInput.value.trim();

            if (keyword !== '') {
                const isDuplicate = Array.from(skillContainer.querySelectorAll('h2')).some(
                    (element) => element.textContent.trim() === keyword
                );

                if (isDuplicate) {
                    alert('중복된 키워드입니다.');
                    skillSearchInput.value = '';
                    return;
                }

                const skillSearchContent = document.createElement('div');
                skillSearchContent.classList.add('Skill_Search_Contant');

                const icon = document.createElement('img');
                icon.src = contextPath + '/img/icons8-done-24.png';

                const h2 = document.createElement('h2');
                h2.textContent = keyword;

                const deleteButton = document.createElement('button');
                deleteButton.textContent = '×';
                deleteButton.addEventListener('click', function () {
                    removeListValue("skillList", keyword);
                    skillContainer.removeChild(skillSearchContent);
                });

                skillSearchContent.appendChild(icon);
                skillSearchContent.appendChild(h2);
                skillSearchContent.appendChild(deleteButton);

                skillContainer.appendChild(skillSearchContent);

                skillSearchInput.value = '';

                addListValue("skillList", keyword);
            }
        }
    });

// 모든 input[type=radio]를 선택
    const radioList = document.querySelectorAll("#Job_Position_content input[type=radio]");
// 각 라디오 버튼에 onchange 이벤트 등록
    for(let r of radioList) {
        r.onchange = function(ev){
            const radioButton = ev.target;

            // 라디오 버튼의 name 속성을 기반으로 tmpDyty의 key에 값 업데이트
            data.tmpDyty[radioButton.name] = radioButton.value;
            console.log(data)
        }
    }

});

// 파일 첨부 처리
function changeFile(fileInput) {
    const fileNameInput = document.getElementById("Announcement_Introduction_fileName");
    const imagePreviewDiv = document.getElementById("Announcement_Introduction_img");
    const defaultImage = imagePreviewDiv.querySelector("img");

    const file = fileInput.files[0];
    if (file) {
        fileNameInput.value = file.name;
        const reader = new FileReader();
        reader.onload = function (e) {
            defaultImage.classList.add("hidden");

            const img = document.createElement("img");
            img.src = e.target.result;
            img.classList.add("uploaded-image");
            img.alt = "미리보기 이미지";

            imagePreviewDiv.innerHTML = "";
            imagePreviewDiv.appendChild(img);
        };
        reader.readAsDataURL(file);
    }
}

// 제목 글자수 제한
function checkTextLength(ev) {
    const announcementTitle = ev.target;
    const maxLength = 25;
    const currentLength = announcementTitle.value.length;

    if (currentLength > maxLength) {
        announcementTitle.value = announcementTitle.value.substring(0, maxLength);
        alert("제목은 25자 이내로 입력해주세요.");
    }

    const charCountElement = document.getElementById("charCount");
    charCountElement.innerHTML = `현재 글자 수: ${currentLength}/${maxLength}`;
}

// 모든 라디오 버튼의 변경 이벤트 처리
document.querySelectorAll('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 값: ${event.target.value}`);
    });
});

document.querySelectorAll('input[name="Career_Type"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 경력: ${event.target.value}`);
    });
});

document.querySelectorAll('input[name="workdream"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 경력: ${event.target.value}`);
    });
});

document.querySelectorAll('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        const groupName = event.target.name;
        const selectedValue = event.target.value;
        console.log(`그룹 "${groupName}"에서 선택된 값: ${selectedValue}`);
    });
});


function openModal(){
    const modal = document.querySelector('.modal');
    modal.style.display = 'block';
}

function closeModal(){
    const modal = document.querySelector('.modal');
    modal.style.display = 'none';

    //값을 가져와서 그려주기 data.dutyList에 추가
    data.dutyList.push(data.tmpDyty)
    data.tmpDyty = {
        rank: "",
        position: "",
        employment_type: "정규직",
        career_type: "경력 무관",
        career_year_min: "",
        career_year_max: "",
        academic: "학력무관",
        work_days: "주 5일",
        work_time_min: "",
        work_time_max: "",
        expected_salary_min: "",
        expected_salary_max: "",
        locationList: [],
        industryList: [],
        skillList: [],
        company_type: "대기업",
        companyList: [],
        employment_status: "재직무관",
    },

    drawDutyList();
}

function drawDutyList(){
    //data .dutyList를 이용해서 화면에 그려주기
    console.log( data.dutyList)
function drawDutyList() {
    const additionDuty = document.querySelector('.Job_duty_p');
    additionDuty.innerHTML = ''; // 기존 내용을 초기화

    const maxDutyCount = 5; // 최대 직무 개수 제한

    data.dutyList.slice(0, maxDutyCount).forEach((duty, index) => {
        // Duty 내용을 포맷팅
        const formattedText = [
            `직급: ${duty.rank || "사원"}`,
            `직책: ${duty.position || "N/A"}`,
            `고용 형태: ${duty.employment_type || "정규직"}`,
            `경력: ${duty.career_type || "경력 무관"} (${duty.career_year_min || "0"}년~${duty.career_year_max || "0"}년)`,
            `학력: ${duty.academic || "학력무관"}`,
            `근무일: ${duty.work_days || "N/A"}`,
            `근무 시간: ${duty.work_time_min || "N/A"}~${duty.work_time_max || "N/A"}`,
            `급여: ${duty.expected_salary_min || "N/A"}~${duty.expected_salary_max || "N/A"}`,
            `근무 지역: ${duty.locationList.join(', ') || "N/A"}`,
            `업종: ${duty.industryList.join(', ') || "N/A"}`,
            `기술: ${duty.skillList.join(', ') || "N/A"}`,
            `회사 형태: ${duty.company_type || "대기업"}`,
            `회사명: ${duty.companyList.join(', ') || "N/A"}`,
            `재직 상태: ${duty.employment_status || "재직무관"}`,
        ].join(' / ');

        const dutyItem = document.createElement('p');
        dutyItem.classList.add('duty-item');
        dutyItem.textContent = formattedText;

        // x 버튼 추가
        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'x';
        deleteButton.classList.add('delete-btn');

        // 삭제 기능
        deleteButton.addEventListener('click', () => {
            data.dutyList.splice(index, 1); // 데이터 삭제
            drawDutyList(); // 화면 갱신
        });

        // 내용이 길 경우 생략 처리
        if (formattedText.length > 100) {
            dutyItem.textContent = `${formattedText.substring(0, 100)}...`;
        }

        dutyItem.appendChild(deleteButton);
        additionDuty.appendChild(dutyItem);
    });

    // 직무 개수 초과 시 경고 메시지 표시
    if (data.dutyList.length > maxDutyCount) {
        const warning = document.createElement('p');
        warning.textContent = "최대 5개의 직무만 추가할 수 있습니다.";
        warning.style.color = "red";
        additionDuty.appendChild(warning);
    }
}
    
}

function addListValue(key,value){
    data.tmpDyty[key].push(value);
}

function removeListValue(key, value){
    data.tmpDyty[key] = data.tmpDyty[key].filter(v => v !== value);
}

function changeValue(key, value){
    console.log(data.tmpDyty)
    data.tmpDyty[key] = value;
}