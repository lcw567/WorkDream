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

    // 스킬 추가 버튼
    document.querySelector('#sk_title1 button').addEventListener('click', function() {
        const input = document.querySelector('.skill_title input');
        const skillValue = input.value.trim();

        if (skillValue) {
            // "나의 스킬" 문구와 영역을 보이게 설정
            document.getElementById('sk_title2').style.display = 'block';

            // 스킬 요소 생성
            const newSkill = document.createElement('div');
            newSkill.className = 'myskill1';
            newSkill.innerHTML = `#${skillValue} <span class="delete-icon">❌</span>`;

            // 삭제 기능 추가
            newSkill.querySelector('.delete-icon').addEventListener('click', function() {
                newSkill.remove();
                // 스킬이 모두 삭제되면 "나의 스킬" 문구와 높이를 초기화
                if (!document.querySelector('#MYsk .myskill1')) {
                    document.querySelector('.skill').style.height = '175px';
                    document.getElementById('sk_title2').style.display = 'none'; // "나의 스킬" 숨김
                }
            });

            // 나의 스킬 영역에 추가
            document.querySelector('#MYsk').appendChild(newSkill);

            // 높이를 230px로 변경
            document.querySelector('.skill').style.height = '230px';

            // 입력창 초기화
            input.value = '';
        }
    });

    document.addEventListener("DOMContentLoaded", function () {
        // 학력 필드 표시 및 비활성화
        function displayEducationFields() {
            const selectedEdu = document.getElementById("selectedu").value;
    
            // 모든 학력 필드 숨기기
            const educationFields = ["elementaryFields", "middleSchoolFields", "highSchoolFields", "collegeFields"];
            educationFields.forEach(function (id) {
                const section = document.getElementById(id);
                if (section) {
                    section.style.display = "none";
                    // 비활성화
                    const inputs = section.querySelectorAll("input, select");
                    inputs.forEach(input => input.disabled = true);
                }
            });
    
            // 선택된 학력 필드 표시
            if (selectedEdu) {
                const activeSection = document.getElementById(selectedEdu + "Fields");
                if (activeSection) {
                    activeSection.style.display = "block";
                    // 활성화
                    const activeInputs = activeSection.querySelectorAll("input, select");
                    activeInputs.forEach(input => input.disabled = false);
                }
            }
        }
    
        // 학력 필드 초기화 및 변경 이벤트 리스너
        document.getElementById("selectedu").addEventListener("change", displayEducationFields);
        displayEducationFields();
    
        // 군 복무 상태 처리
        const militarySelect = document.getElementById("military_status");
        const fieldsMap = {
            unfulfilled: document.getElementById("unfulfilledFields"),
            exempted: document.getElementById("exemptedFields"),
            fulfilled: document.getElementById("fulfilledFields"),
            serving: document.getElementById("servingFields"),
        };
    
        // 초기화
        Object.values(fieldsMap).forEach(field => field.style.display = "none");
    
        // 군 복무 상태 변경 이벤트
        militarySelect.addEventListener("change", function () {
            Object.values(fieldsMap).forEach(field => field.style.display = "none");
            const selectedField = fieldsMap[this.value];
            if (selectedField) {
                selectedField.style.display = "block";
            }
        });

                // 경력 체크박스 처리
                const careerCheckbox = document.getElementById("CareerY");
                const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
                careerDetails.forEach(field => field.style.display = "none");
            
                careerCheckbox.addEventListener("change", function () {
                    if (this.checked) {
                        careerDetails.forEach(field => field.style.display = "flex");
                    } else {
                        careerDetails.forEach(field => field.style.display = "none");
                    }
                });
            });
    

    // 군 복무 상태 변경 시 섹션 표시/숨김
    var militarySelect = document.getElementById('military_status');
    var exemptedDiv = document.querySelector('.EXEMPTED');
    var fulfilledDiv = document.querySelector('.fulfilled');
    var servingDiv = document.querySelector('.serving');
    
    // 페이지 로드 시 모든 섹션 숨기기
    exemptedDiv.style.display = 'none';
    fulfilledDiv.style.display = 'none';
    servingDiv.style.display = 'none';
    
    // 선택 박스의 변경을 감지하는 이벤트 리스너 추가
    militarySelect.addEventListener('change', function() {
        // 모든 섹션을 우선 숨김
        exemptedDiv.style.display = 'none';
        fulfilledDiv.style.display = 'none';
        servingDiv.style.display = 'none';
    
        var selectedValue = this.value;
    
        if (selectedValue === 'unfulfilled' || selectedValue === 'exempted') {
            // 미필 또는 면제 선택 시 EXEMPTED 섹션 표시
            exemptedDiv.style.display = 'flex';
        } else if (selectedValue === 'fulfilled') {
            // 군필 선택 시 fulfilled 섹션 표시
            fulfilledDiv.style.display = 'flex';
        } else if (selectedValue === 'serving') {
            // 복무중 선택 시 serving 섹션 표시
            servingDiv.style.display = 'flex';
        }
        // '대상아님' 또는 다른 선택 시 모든 섹션 숨김
    });

    // 미리 보기 버튼 클릭 시 동작
    const registerButton = document.querySelector('.preview');

    if (registerButton) {
        registerButton.addEventListener('click', function () {
            window.location.href = `${contextPath}/resume/previewresume`;
        });
    }

    // 프로필 이미지 업로드 기능
    const imageContainer = document.querySelector('#basic5');

    if (imageContainer) {
        const img = imageContainer.querySelector('.profile_img');
        const fileInput = imageContainer.querySelector('.profile_upload');

        img.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file && file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    img.src = e.target.result;
                };
                reader.readAsDataURL(file);
            } else {
                img.src = `${pageContext.request.contextPath}/img/file.png`; // 기본 이미지로 복귀
            }
        });
    }

    // 경력 체크박스 처리
    const careerCheckbox = document.getElementById("CareerY");
    const careerLabel = document.querySelector("label.careerYorN"); // "경력이 있을 경우 선택해주세요." 라벨
    const checkboxLabel = careerCheckbox.parentElement; // 체크박스를 감싸는 라벨
    const careerFieldset = document.querySelector("fieldset.career"); // 필드셋
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3"); // 필드셋 내부의 세부 요소들

    // 처음에는 필드셋 내부의 세부 요소들을 숨깁니다.
    careerDetails.forEach(field => field.style.display = "none");
    careerFieldset.style.height = "155px"; // 초기 높이 설정

    // 체크박스 상태에 따라 요소들을 조정합니다.
    careerCheckbox.addEventListener("change", function() {
        if (careerCheckbox.checked) {
            // 체크박스와 라벨을 숨깁니다.
            careerLabel.style.display = "none";
            checkboxLabel.style.display = "none";

            // 필드셋의 높이를 변경하고, 내부 세부 요소들을 표시합니다.
            careerFieldset.style.height = "520px";
            careerDetails.forEach(field => field.style.display = "flex");
        }
    });
});

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 선택한 주소 정보를 표시
            document.getElementById("sample4_postcode").value = data.zonecode; // 우편번호
            document.getElementById("roadAddress").value = data.roadAddress; // 도로명 주소
            document.getElementById("detailAddress").focus(); // 상세주소로 포커스 이동

            // 참고항목 정보 설정
            var guideTextBox = document.getElementById("guide");
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraAddr;
                guideTextBox.innerHTML = "(예상 도로명 주소: " + expRoadAddr + ")";
                guideTextBox.style.display = "block";
            } else {
                guideTextBox.innerHTML = "";
                guideTextBox.style.display = "none";
            }
        }
    }).open();
}

// 자격증/어학/수상 선택 처리
// 카테고리 선택 처리
const categorySelect = document.getElementById("sortation");
const categoryFields = {
    certificate: [document.getElementById("certificateFields"), document.getElementById("certificateDate")],
    language: [document.getElementById("languageFields")],
    award_details: [document.getElementById("awardDetailsFields")],
};

// 초기화 - 모든 섹션 숨기기
Object.values(categoryFields).forEach(fields => {
    fields.forEach(field => field.style.display = "none");
});

// 카테고리 선택 시 표시할 섹션 제어
categorySelect.addEventListener("change", function () {
    // 모든 섹션 숨기기
    Object.values(categoryFields).forEach(fields => {
        fields.forEach(field => field.style.display = "none");
    });

    // 선택된 카테고리의 섹션 보이기
    const selectedFields = categoryFields[this.value];
    if (selectedFields) {
        selectedFields.forEach(field => field.style.display = "flex"); // Flexbox로 표시
    }
});


document.addEventListener('DOMContentLoaded', function () {
// 자격증/면허증 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.addQualificationButton').addEventListener('click', function(event) {
    event.preventDefault();

    const certificateTitle = document.querySelector('input[name="qualificationName"]').value.trim();
    const institutionTitle = document.querySelector('input[name="issuingAgency"]').value.trim();
    const passStatusSelect = document.querySelector('select[name="passStatus"]');
    const passStatus = passStatusSelect.options[passStatusSelect.selectedIndex].textContent;
    const passDate = document.querySelector('input[name="issueDate"]').value;

    // 빈 입력 방지
    if (!certificateTitle || !institutionTitle || !passStatusSelect.value || !passDate) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    const listItem = document.createElement('div');
    listItem.className = 'list-item';

    const itemContent = document.createElement('div');
    itemContent.className = 'item-content';

    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = `<strong>${certificateTitle}</strong> (${passStatus}) | ${passDate.replace(/-/g, ".")}`;

    const institutionDiv = document.createElement('div');
    institutionDiv.className = 'institution';
    institutionDiv.textContent = institutionTitle;

    itemContent.appendChild(titleDiv);
    itemContent.appendChild(institutionDiv);

    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'actions';

    const deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.title = '삭제';
    deleteButton.textContent = '✖️';

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="qualificationName"]').value = '';
    document.querySelector('input[name="issuingAgency"]').value = '';
    document.querySelector('select[name="passStatus"]').value = '';
    document.querySelector('input[name="issueDate"]').value = '';
});

// 어학시험 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.addLanguageButton').addEventListener('click', function(event) {
    event.preventDefault();

    const languageTitle = document.querySelector('input[name="languageName"]').value.trim();
    const languageLevelSelect = document.querySelector('select[name="proficiencyLevel"]');
    const languageLevel = languageLevelSelect.options[languageLevelSelect.selectedIndex].textContent;
    const languageCategorySelect = document.querySelector('select[name="languageType"]');
    const languageCategory = languageCategorySelect.options[languageCategorySelect.selectedIndex].textContent;
    const getDate = document.querySelector('input[name="issueDate"]').value;

    // 빈 입력 방지
    if (!languageTitle || !languageLevelSelect.value || !languageCategorySelect.value || !getDate) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    const listItem = document.createElement('div');
    listItem.className = 'list-item';

    const itemContent = document.createElement('div');
    itemContent.className = 'item-content';

    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = `<strong>${languageTitle}</strong> (${languageCategory}, ${languageLevel}급) | ${getDate.replace(/-/g, ".")}`;

    itemContent.appendChild(titleDiv);

    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'actions';

    const deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.title = '삭제';
    deleteButton.textContent = '✖️';

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="languageName"]').value = '';
    document.querySelector('select[name="proficiencyLevel"]').value = '';
    document.querySelector('select[name="languageType"]').value = '';
    document.querySelector('input[name="issueDate"]').value = '';
});

// 수상내역/공모전 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.addAwardButton').addEventListener('click', function(event) {
    event.preventDefault();

    const contestTitle = document.querySelector('input[name="awardName"]').value.trim();
    const contestPlace = document.querySelector('input[name="organizer"]').value.trim();
    const acquireDate = document.querySelector('input[name="awardDate"]').value;

    // 빈 입력 방지
    if (!contestTitle || !contestPlace || !acquireDate) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    const listItem = document.createElement('div');
    listItem.className = 'list-item';

    const itemContent = document.createElement('div');
    itemContent.className = 'item-content';

    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = `<strong>${contestTitle}</strong> | ${acquireDate.replace(/-/g, ".")}`;

    const placeDiv = document.createElement('div');
    placeDiv.className = 'institution';
    placeDiv.textContent = contestPlace;

    itemContent.appendChild(titleDiv);
    itemContent.appendChild(placeDiv);

    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'actions';

    const deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.title = '삭제';
    deleteButton.textContent = '✖️';

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="awardName"]').value = '';
    document.querySelector('input[name="organizer"]').value = '';
    document.querySelector('input[name="awardDate"]').value = '';
});
});

