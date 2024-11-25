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

// 모든 라디오 버튼의 변경 이벤트 감지
document.querySelectorAll('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        const groupName = event.target.name; // 라디오 버튼 그룹 이름
        const selectedValue = event.target.value; // 선택된 값
        console.log(`그룹 "${groupName}"에서 선택된 값: ${selectedValue}`);
    });
});



// 공통 함수: 입력 필드 생성 및 처리
function createInputHandler(container, placeholderText, wrapperClass) {
    return function () {
        const wrapper = document.createElement('div');
        wrapper.classList.add(wrapperClass); // 클래스 스타일 적용

        const inputField = document.createElement('input');
        inputField.setAttribute('placeholder', placeholderText);
        inputField.style.border = 'none';
        inputField.style.backgroundColor = 'transparent';
        inputField.style.color = 'white';
        inputField.style.fontSize = '14px';

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'x';
        deleteButton.classList.add('delete-btn');

        // 삭제 버튼 동작
        deleteButton.addEventListener('click', () => {
            if (wrapper.parentNode) {
                wrapper.parentNode.removeChild(wrapper);
            }
        });

        // Enter 키로 입력 확정
        const confirmInput = () => {
            const enteredText = inputField.value.trim();

            // 입력값이 없을 경우
            if (!enteredText) {
                alert(`${placeholderText}를 입력해주세요.`);
                inputField.focus();
                return;
            }

            // 중복 검사: container 내 p 태그의 텍스트와 비교
            const isDuplicate = Array.from(container.querySelectorAll(`.${wrapperClass} p`)).some(
                (p) => p.textContent.trim() === enteredText
            );

            if (isDuplicate) {
                alert(`"${enteredText}"는 이미 추가된 ${placeholderText}입니다. 다른 값을 입력해주세요.`);
                inputField.focus();
                return;
            }

            // wrapper 내용을 텍스트와 삭제 버튼으로 업데이트
            wrapper.innerHTML = ''; // 기존 내용 제거
            const textContent = document.createElement('p');
            textContent.textContent = enteredText;

            // 기존 삭제 버튼 유지
            wrapper.appendChild(textContent);
            wrapper.appendChild(deleteButton);
        };

        // Enter 키 입력 이벤트 처리
        inputField.addEventListener('keypress', (event) => {
            if (event.key === 'Enter') {
                event.preventDefault(); // 기본 Enter 동작 방지
                confirmInput();
            }
        });

        wrapper.appendChild(inputField);
        wrapper.appendChild(deleteButton);
        container.appendChild(wrapper);

        inputField.focus(); // 자동 포커스
    };
}

// 지역 추가 버튼과 컨테이너 핸들러
const workLocationAddressButton = document.querySelector('.Work_Location_Address');
const locationContainer = document.getElementById('location-container');
workLocationAddressButton.addEventListener(
    'click',
    createInputHandler(locationContainer, '지역', 'Work_Location')
);

// 업종 추가 버튼과 컨테이너 핸들러
const industryCategoryButton = document.querySelector('.Industry_Category');
const industryContainer = document.getElementById('industry-container');
industryCategoryButton.addEventListener(
    'click',
    createInputHandler(industryContainer, '업종', 'Industry_Type')
);

// 기업 추가 버튼과 컨테이너 핸들러
const addCompanyButton = document.querySelector('.add-company-btn');
const companyContainer = document.getElementById('company-container');
addCompanyButton.addEventListener(
    'click',
    createInputHandler(companyContainer, '기업명', 'Company_Type')
);

// input 요소와 skill-container 요소 가져오기
const skillSearchInput = document.getElementById('Skill_Search_Keyward');
const skillContainer = document.getElementById('skill-container');

// input에 키워드가 입력되고 Enter 키를 눌렀을 때 동작
skillSearchInput.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // Enter 키의 기본 동작을 막음 (폼 제출 방지)

        const keyword = skillSearchInput.value.trim(); // 입력된 키워드

        // 입력값이 비어있지 않으면
        if (keyword !== '') {
            // 중복 검사: 이미 동일한 키워드가 존재하는지 확인
            const isDuplicate = Array.from(skillContainer.querySelectorAll('h2')).some(
                (element) => element.textContent.trim() === keyword
            );

            if (isDuplicate) {
                alert('중복된 키워드입니다.');
                skillSearchInput.value = ''; // 입력 필드 비우기
                return;
            }

            // 새로운 div 요소를 생성
            const skillSearchContent = document.createElement('div');
            skillSearchContent.classList.add('Skill_Search_Contant');

            // 새로 생성된 div에 이미지와 h2 태그 추가
            const icon = document.createElement('img');
            icon.src = contextPath + '/img/icons8-done-24.png';

            const h2 = document.createElement('h2');
            h2.textContent = keyword; // h2에 입력된 키워드 추가

            // 삭제 버튼 추가
            const deleteButton = document.createElement('button');
            deleteButton.textContent = '×'; // '×' 버튼
            deleteButton.addEventListener('click', function () {
                skillContainer.removeChild(skillSearchContent); // 해당 항목 삭제
            });

            // 요소들 추가
            skillSearchContent.appendChild(icon);
            skillSearchContent.appendChild(h2);
            skillSearchContent.appendChild(deleteButton);

            // skill-container에 새로운 항목 추가
            skillContainer.appendChild(skillSearchContent);

            // 입력 필드를 비운다
            skillSearchInput.value = '';
        }
    }
});


document.querySelectorAll('label.unstyled-label').forEach((label) => {
    label.style.setProperty('--pseudo-before', 'none'); // --pseudo-before를 설정
    label.classList.add('unstyled-label'); // 필요한 경우 클래스 추가
});

document.getElementById('Confirm').addEventListener('click', () => {
    // 데이터를 수집
    const jobData = {
        rank: document.getElementById('Rank')?.value || '',
        position: document.getElementById('Position')?.value || '',
        employmentType: document.querySelector('input[name="Employment_Type"]:checked')?.value || '정규직',
        careerType: document.querySelector('input[name="Career_Type"]:checked')?.value || '신입',
        careerMin: document.querySelector('.Career_Year_Min')?.value || '0',
        careerMax: document.querySelector('.Career_Year_Max')?.value || '0',
        education: document.querySelector('input[name="Academic"]:checked')?.value || '학력무관',
        workDays: document.querySelector('input[name="Work_Days"]:checked')?.value || '근무요일',
        workTimeMin: document.querySelector('.Wark_Time_Min')?.value || '',
        workTimeMax: document.querySelector('.Wark_Time_Min')?.value || '',
        salaryMin: document.querySelector('.Expected_Salary_Min')?.value || '0',
        salaryMax: document.querySelector('.Expected_Salary_Max')?.value || '0',
        workLocation: Array.from(document.querySelectorAll('#location-container .Work_Location'))
            .map(location => location.textContent.trim()) || [],
        industry: Array.from(document.querySelectorAll('#industry-container .Industry_Type'))
            .map(ind => ind.textContent.trim()) || [],
        companyType: document.querySelector('input[name="Company_Type"]:checked')?.value || '',
        employmentStatus: document.querySelector('input[name="Employment_Status"]:checked')?.value || '재직무관'
    };

    // 로컬 스토리지에 데이터 저장
    localStorage.setItem('jobData', JSON.stringify(jobData));

    // 이전 페이지로 이동
    window.location.href = 'http://localhost:3333/WorkDream/business/announcementInformation2';
});