const data = {
    dutyList: [],
    tmpDyty: {
        rank: "",
        position: "",
        employment_type: "정규직",
        career_type: "신입",
        education: "학력무관",
        work_days: "주 5일",
        salary_min: "",
        salary_max: "",
        company_type: "대기업",
        employment_status: "재직무관",
    },
}

document.addEventListener('DOMContentLoaded', function () {

    // 공통 함수: 입력 필드 생성 및 처리
    function createInputHandler(container, placeholderText, wrapperClass) {
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
            };

            inputField.addEventListener('keypress', (event) => {
                if (event.key === 'Enter') {
                    event.preventDefault();
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
        createInputHandler(locationContainer, '지역', 'Work_Location')
    );

    const industryCategoryButton = document.querySelector('.Industry_Category');
    const industryContainer = document.getElementById('industry-container');
    industryCategoryButton.addEventListener(
        'click',
        createInputHandler(industryContainer, '업종', 'Industry_Type')
    );

    const addCompanyButton = document.querySelector('.add-company-btn');
    const companyContainer = document.getElementById('company-container');
    addCompanyButton.addEventListener(
        'click',
        createInputHandler(companyContainer, '기업명', 'Company_Type')
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
                    skillContainer.removeChild(skillSearchContent);
                });

                skillSearchContent.appendChild(icon);
                skillSearchContent.appendChild(h2);
                skillSearchContent.appendChild(deleteButton);

                skillContainer.appendChild(skillSearchContent);

                skillSearchInput.value = '';
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

}

function changeValue(key, value){
    console.log(data.tmpDyty)
    data.tmpDyty[key] = value;
}