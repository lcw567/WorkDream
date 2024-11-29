// 스킬 배열을 선언
let skills = [];

// 페이지 로드 시 기존 데이터 로드 및 UI 업데이트
document.addEventListener('DOMContentLoaded', function() {
    const skillList = document.querySelectorAll('#skillList .myskill1');
    const skillContainer = document.querySelector('.skill');

    // 기존 데이터가 있을 경우 스킬 배열에 추가 및 높이 설정
    skillList.forEach(skillItem => {
        const skillText = skillItem.textContent.replace('❌', '').replace('#', '').trim(); // # 및 공백 제거
        skills.push(skillText);
    });

    if (skills.length > 0) {
        // 데이터가 있을 때 높이를 230px로 설정
        skillContainer.style.height = '230px';
        document.getElementById('sk_title2').style.display = 'block';
    } else {
        // 데이터가 없을 때 높이를 175px로 설정
        skillContainer.style.height = '175px';
        document.getElementById('sk_title2').style.display = 'none';
    }
});

// 스킬 추가 버튼 클릭 이벤트 처리
document.querySelector('#sk_title1 button').addEventListener('click', function() {
    const input = document.querySelector('.skill_title input');
    const skillValue = input.value.trim();

    if (skillValue && !skills.includes(skillValue)) {
        // "나의 스킬" 문구와 영역을 보이게 설정
        document.getElementById('sk_title2').style.display = 'block';

        // 스킬 요소 생성
        const newSkill = document.createElement('div');
        newSkill.className = 'myskill1';
        newSkill.innerHTML = `#${skillValue} <span class="delete-icon" onclick="removeSkill(this)">❌</span>`;

        // 나의 스킬 영역에 추가
        document.querySelector('#skillList').appendChild(newSkill);

        // 높이를 230px로 변경
        document.querySelector('.skill').style.height = '230px';

        // 입력창 초기화
        input.value = '';

        // 스킬을 배열에 저장
        skills.push(skillValue);
    } else if (!skillValue) {
        alert('스킬을 입력해주세요.'); // 빈 값 입력 방지
    } else if (skills.includes(skillValue)) {
        alert('이미 추가된 스킬입니다.'); // 중복 방지
    }
});

// 스킬 삭제 기능
function removeSkill(element) {
    const skillValue = element.parentElement.textContent.replace('❌', '').replace('#', '').trim();

    // 스킬 삭제 시 배열에서도 제거
    skills = skills.filter(skill => skill !== skillValue);
    element.parentElement.remove();

    // 스킬이 모두 삭제되면 "나의 스킬" 문구와 높이를 초기화
    if (!document.querySelector('#MYsk .myskill1')) {
        document.querySelector('.skill').style.height = '175px';
        document.getElementById('sk_title2').style.display = 'none'; // "나의 스킬" 숨김
    }
}

// 폼 제출 시 모든 스킬을 하나의 문자열로 합쳐서 hidden input에 저장
document.querySelector('form').addEventListener('submit', function(event) {
    // 스킬 배열을 쉼표로 구분된 문자열로 합침
    let skillInput = document.querySelector('input[name="skillName"]');

    // hidden input이 존재하지 않는다면 새로 생성
    if (!skillInput) {
        skillInput = document.createElement('input');
        skillInput.type = 'hidden';
        skillInput.name = 'skillName';
        document.querySelector('form').appendChild(skillInput);
    }

    skillInput.value = skills.join(', ');

    // AJAX 요청으로 서버에 스킬 저장하기
    const xhr = new XMLHttpRequest();
    xhr.open('POST', `${contextPath}/resume/addSkill`, true);
    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log('Skills added successfully');
        } else if (xhr.readyState === 4) {
            console.error('Failed to add skills');
        }
    };

    // 서버에 보낼 데이터 생성
    const skillData = {
        skillName: skills.join(', ')
    };
    // JSON 형식으로 데이터 전송
    xhr.send(JSON.stringify(skillData));
});




document.addEventListener('DOMContentLoaded', function () {
    console.log("DOM fully loaded and parsed.");

    const categorySelect = document.getElementById('sortation');
    const categoryFields = {
        certificate: [document.getElementById('certificateFields'), document.getElementById('certificateDate')],
        language: [document.getElementById('languageFields')],
        award_details: [document.getElementById('awardDetailsFields')],
    };

    // 초기 상태: 모든 필드 숨김
    Object.values(categoryFields).forEach(fields => {
        fields.forEach(field => {
            if (field) field.style.display = 'none';
        });
    });

    // 카테고리 선택 시 필드 표시
    categorySelect.addEventListener('change', function () {
        const selectedCategory = this.value;

        // 모든 필드 숨기기
        Object.values(categoryFields).forEach(fields => {
            fields.forEach(field => {
                if (field) field.style.display = 'none';
            });
        });

        // 선택된 카테고리 필드만 표시
        if (categoryFields[selectedCategory]) {
            categoryFields[selectedCategory].forEach(field => {
                if (field) field.style.display = '';
            });
        }
    });

    // 자격증 추가하기
    const addQualificationButton = document.querySelector('.addQualificationButton');
    addQualificationButton.addEventListener('click', function (event) {
        event.preventDefault();

        const certificateFields = document.getElementById('certificateFields');
        const certificateDateFields = document.getElementById('certificateDate');

        const certificateTitle = certificateFields.querySelector('input[name="qualificationName[]"]').value.trim();
        const institutionTitle = certificateFields.querySelector('input[name="issuingAgency[]"]').value.trim();
        const passStatusSelect = certificateFields.querySelector('select[name="passStatus[]"]');
        const passStatusText = passStatusSelect.options[passStatusSelect.selectedIndex].textContent.trim(); // 옵션의 텍스트
        const passDate = certificateDateFields.querySelector('input[name="testDate_cer[]"]').value;

        // 빈 값 체크
        if (!certificateTitle || !institutionTitle || !passStatusText || !passDate) {
            alert("모든 필드를 입력해주세요.");
            return;
        }

        // 리스트에 추가
        createListItem(
            certificateTitle, 
            `${passStatusText} | ${passDate.replace(/-/g, ".")}`, 
            institutionTitle, 
            '.result-list-certificate',
            ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]']
        );
        console.log("자격증 추가 완료!");

        // 입력 필드 초기화
        certificateFields.querySelector('input[name="qualificationName[]"]').value = '';
        certificateFields.querySelector('input[name="issuingAgency[]"]').value = '';
        passStatusSelect.value = '';
        certificateDateFields.querySelector('input[name="testDate_cer[]"]').value = '';
    });

    // 어학시험 추가하기
    const addLanguageButton = document.querySelector('.addLanguageButton');
    addLanguageButton.addEventListener('click', function (event) {
        event.preventDefault();

        const languageFields = document.getElementById('languageFields');

        const languageTitle = languageFields.querySelector('input[name="languageName[]"]').value.trim();
        const languageLevelSelect = languageFields.querySelector('select[name="proficiencyLevel[]"]');
        const languageLevelText = languageLevelSelect.options[languageLevelSelect.selectedIndex].textContent.trim(); // 옵션의 텍스트
        const languageTypeSelect = languageFields.querySelector('select[name="languageType[]"]');
        const languageTypeText = languageTypeSelect.options[languageTypeSelect.selectedIndex].textContent.trim(); // 옵션의 텍스트
        const issueDate = languageFields.querySelector('input[name="issueDate[]"]').value;

        // 빈 값 체크
        if (!languageTitle || !languageLevelText || !languageTypeText || !issueDate) {
            alert("모든 필드를 입력해주세요.");
            return;
        }

        // 리스트에 추가
        createListItem(
            languageTitle, 
            `${languageTypeText}, ${languageLevelText} | ${issueDate.replace(/-/g, ".")}`, 
            '', 
            '.result-list-language',
            ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate_language[]']
        );
        console.log("어학시험 추가 완료!");

        // 입력 필드 초기화
        languageFields.querySelector('input[name="languageName[]"]').value = '';
        languageLevelSelect.value = '';
        languageTypeSelect.value = '';
        languageFields.querySelector('input[name="issueDate[]"]').value = '';
    });

    // 수상내역 추가하기
    const addAwardButton = document.querySelector('.addAwardButton');
    addAwardButton.addEventListener('click', function (event) {
        event.preventDefault();

        const awardFields = document.getElementById('awardDetailsFields');

        const awardName = awardFields.querySelector('input[name="awardName[]"]').value.trim();
        const organizer = awardFields.querySelector('input[name="organizer[]"]').value.trim();
        const awardDate = awardFields.querySelector('input[name="awardDate[]"]').value;

        // 빈 값 체크
        if (!awardName || !organizer || !awardDate) {
            alert("모든 필드를 입력해주세요.");
            return;
        }

        // 리스트에 추가
        createListItem(
            awardName, 
            `${awardDate.replace(/-/g, ".")}`, 
            organizer, 
            '.result-list-awards',
            ['awardName[]', 'organizer[]', 'awardDate[]']
        );
        console.log("수상내역 추가 완료!");

        // 입력 필드 초기화
        awardFields.querySelector('input[name="awardName[]"]').value = '';
        awardFields.querySelector('input[name="organizer[]"]').value = '';
        awardFields.querySelector('input[name="awardDate[]"]').value = '';
    });

    // 리스트 아이템 생성 및 폼에 hidden input 추가 함수
    function createListItem(title, details, institution, listSelector, inputNames) {
        const listContainer = document.querySelector(listSelector);
        if (!listContainer) {
            console.error(`리스트 컨테이너 ${listSelector}를 찾을 수 없습니다.`);
            return;
        }

        const listItem = document.createElement('div');
        listItem.className = 'list-item';

        const itemContent = document.createElement('div');
        itemContent.className = 'item-content';

        const titleDiv = document.createElement('div');
        titleDiv.innerHTML = `<strong>${title}</strong> ${details}`;

        const institutionDiv = document.createElement('div');
        institutionDiv.className = 'institution';
        institutionDiv.textContent = institution ? `발행처: ${institution}` : '';

        itemContent.appendChild(titleDiv);
        if (institution) itemContent.appendChild(institutionDiv);

        const actionsDiv = document.createElement('div');
        actionsDiv.className = 'actions';

        const deleteButton = document.createElement('button');
        deleteButton.className = 'delete';
        deleteButton.textContent = '삭제';
        deleteButton.addEventListener('click', function () {
            // 리스트에서 항목 삭제
            listItem.remove();
            console.log("아이템 삭제 완료!");

            // 폼에서 해당 hidden input 삭제
            inputNames.forEach(name => {
                let valueToRemove;
                if (name === 'qualificationName[]' || name === 'languageName[]' || name === 'awardName[]') {
                    valueToRemove = title;
                } else if (name === 'issuingAgency[]' || name === 'organizer[]') {
                    valueToRemove = institution;
                } else if (name === 'passStatus[]') {
                    valueToRemove = details.split('|')[0].trim();
                } else if (name === 'testDate_cer[]' || name === 'issueDate_language[]' || name === 'awardDate[]') {
                    valueToRemove = details.split('|')[1] ? details.split('|')[1].trim().replace(/\./g, '-') : details.trim().replace(/\./g, '-');
                }
                const inputs = document.querySelectorAll(`input[name="${name}"]`);
                inputs.forEach(input => {
                    if (input.value === valueToRemove) {
                        input.remove();
                    }
                });
            });
        });

        actionsDiv.appendChild(deleteButton);

        listItem.appendChild(itemContent);
        listItem.appendChild(actionsDiv);

        listContainer.appendChild(listItem);

        // 폼에 hidden input 추가
        inputNames.forEach(name => {
            const hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = name;
            // 값을 적절히 설정
            if (name === 'qualificationName[]' || name === 'languageName[]' || name === 'awardName[]') {
                hiddenInput.value = title;
            } else if (name === 'issuingAgency[]' || name === 'organizer[]') {
                hiddenInput.value = institution;
            } else if (name === 'passStatus[]') {
                hiddenInput.value = details.split('|')[0].trim();
            } else if (name === 'testDate_cer[]') {
                hiddenInput.value = details.split('|')[1].trim().replace(/\./g, '-');
            } else if (name === 'proficiencyLevel[]') {
                hiddenInput.value = details.split(',')[1].trim().split('|')[0].trim();
            } else if (name === 'languageType[]') {
                hiddenInput.value = details.split(',')[0].trim();
            } else if (name === 'issueDate_language[]') { // 수정된 부분
                hiddenInput.value = details.split('|')[1].trim().replace(/\./g, '-');
            } else if (name === 'awardDate[]') {
                hiddenInput.value = details.trim().replace(/\./g, '-');
            }
            document.getElementById('resumeForm').appendChild(hiddenInput);
        });

        return listItem;
    }

    // 데이터베이스에서 가져온 데이터가 있으면 추가해주는 로직
    function populateExistingData() {
        const existingCertificates = JSON.parse(document.getElementById('existingCertificates').value || '[]');
        existingCertificates.forEach(certificate => {
            createListItem(
                certificate.qualificationName, 
                `${certificate.passStatus} | ${certificate.testDate_cer.replace(/-/g, ".")}`, 
                certificate.issuingAgency, 
                '.result-list-certificate',
                ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]']
            );
        });

        const existingLanguages = JSON.parse(document.getElementById('existingLanguages').value || '[]');
        existingLanguages.forEach(language => {
            createListItem(
                language.languageName, 
                `${language.languageType}, ${language.proficiencyLevel} | ${language.issueDate.replace(/-/g, ".")}`, 
                '', 
                '.result-list-language',
                ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate_language[]']
            );
        });

        const existingAwards = JSON.parse(document.getElementById('existingAwards').value || '[]');
        existingAwards.forEach(award => {
            createListItem(
                award.awardName, 
                `${award.awardDate.replace(/-/g, ".")}`, 
                award.organizer, 
                '.result-list-awards',
                ['awardName[]', 'organizer[]', 'awardDate[]']
            );
        });
    }

    populateExistingData();
});

// 학력 필드 표시 및 비활성화/활성화 함수 통합
function displayEducationFields() {
    const selectedEdu = document.getElementById("selectedu").value;
    const educationLvElement = document.querySelector('.education_Lv'); // .education_Lv 요소

    // 초기 높이 설정
    educationLvElement.style.height = '150px';

    // 모든 학력 필드 섹션을 숨기고 비활성화
    const educationFields = ["elementaryFields", "middleSchoolFields", "highSchoolFields", "collegeFields"];
    educationFields.forEach(function(id) {
        const section = document.getElementById(id);
        if (section) {
            section.style.display = "none";
            // 해당 섹션의 모든 입력 필드를 비활성화
            const inputs = section.querySelectorAll("input, select");
            inputs.forEach(function(input) {
                input.disabled = true;
            });
        }
    });

    // 선택된 학력에 해당하는 필드 섹션만 표시하고 활성화
    let activeSectionId = "";
    switch(selectedEdu) {
        case "element":
            activeSectionId = "elementaryFields";
            break;
        case "middle":
            activeSectionId = "middleSchoolFields";
            break;
        case "high":
            activeSectionId = "highSchoolFields";
            break;
        case "college":
            activeSectionId = "collegeFields";
            break;
        default:
            // 선택되지 않았거나 다른 값일 경우 기본 높이 유지
            break;
    }

    if (activeSectionId) {
        const activeSection = document.getElementById(activeSectionId);
        if (activeSection) {
            activeSection.style.display = "block";
            const activeInputs = activeSection.querySelectorAll("input, select");
            activeInputs.forEach(function(input) {
                input.disabled = false;
            });
            // 높이 조절
            educationLvElement.style.height = '300px';
        }
    }
}

// 페이지 로드 시 초기 상태 설정 및 이벤트 리스너 등록
document.addEventListener("DOMContentLoaded", function() {
    // 학력 필드 초기 상태 설정
    displayEducationFields();

    // 학력 선택 시 displayEducationFields 함수 호출
    document.getElementById('selectedu').addEventListener('change', displayEducationFields);

});

// 군 복무 상태 처리
document.addEventListener("DOMContentLoaded", function () {
    // 초기 상태 설정 - DB에서 불러온 값에 따라 필드 표시
    const selectedValue = militarySelect.value; // 현재 선택된 값 가져오기
    Object.values(fieldsMap).forEach(field => field.style.display = "none"); // 모든 필드 숨기기

    const initialField = fieldsMap[selectedValue];
    if (initialField) {
        initialField.style.display = "flex"; // 선택된 값에 맞는 필드 표시
    }
});

const militarySelect = document.getElementById("military_status");
const fieldsMap = {
    unfulfilled: document.querySelector(".unfulfilled"),
    exempted: document.querySelector(".EXEMPTED"),
    fulfilled: document.querySelector(".fulfilled"),
    serving: document.querySelector(".serving"),
};

// 초기화 - 모든 필드를 숨김
Object.values(fieldsMap).forEach(field => field.style.display = "none");

// 군 복무 상태 변경 이벤트
militarySelect.addEventListener("change", function () {
    // 모든 필드를 숨김
    Object.values(fieldsMap).forEach(field => field.style.display = "none");

    // 선택된 값에 따라 필드 표시
    const selectedField = fieldsMap[this.value];
    if (selectedField) {
        selectedField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const careerCheckbox = document.getElementById("CareerY");
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
    const careerFieldset = document.querySelector("fieldset.career");
    const careerLabel = document.querySelector("label.careerYorN");
    const checkboxLabel = careerCheckbox ? careerCheckbox.parentElement : null;

    // 페이지 로드 시 기존 데이터가 있는지 여부에 따라 필드 초기화
    if (careerFieldset.classList.contains("career-full")) {
        // 데이터가 있을 때
        careerDetails.forEach(field => field.style.display = "flex");
        careerFieldset.style.height = "520px";
        if (careerLabel) careerLabel.style.display = "none";
        if (checkboxLabel) checkboxLabel.style.display = "none";
    } else {
        // 데이터가 없을 때 초기화
        careerDetails.forEach(field => field.style.display = "none");
        careerFieldset.style.height = "155px";
    }

    // 체크박스 상태에 따라 경력 필드 표시/숨김
    if (careerCheckbox) {
        careerCheckbox.addEventListener("change", function () {
            if (this.checked) {
                careerDetails.forEach(field => field.style.display = "flex");
                careerFieldset.style.height = "520px";
                if (careerLabel) careerLabel.style.display = "none";
                if (checkboxLabel) checkboxLabel.style.display = "none";
            } else {
                careerDetails.forEach(field => field.style.display = "none");
                careerFieldset.style.height = "155px";
                if (careerLabel) careerLabel.style.display = "block";
                if (checkboxLabel) checkboxLabel.style.display = "block";
            }
        });
    }
});




