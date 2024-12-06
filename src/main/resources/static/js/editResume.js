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
            ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]']
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
                } else if (name === 'testDate_cer[]' || name === 'issueDate[]' || name === 'awardDate[]') {
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
            } else if (name === 'issueDate[]') { // 수정된 부분
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
                ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]']
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

document.addEventListener("DOMContentLoaded", function() {
    // 학력 선택 요소
    const selectedu = document.getElementById("selectedu");
    const educationLvElement = document.querySelector('.education_Lv');

    // 학력 필드 섹션들
    const educationFields = {
        "초등학교": document.getElementById("elementaryFields"),
        "중학교": document.getElementById("middleSchoolFields"),
        "고등학교": document.getElementById("highSchoolFields"),
        "대학교/대학원 이상 졸업": document.getElementById("collegeFields")
    };

    // '검정고시' 체크박스와 hidden input들
    const examSections = {
        "exam_el": {
            section: document.querySelector('.exam'),
            checkbox: document.getElementById('middle_exam'),
            hiddenInput: document.getElementById('examPassed_el_hidden')
        },
        "exam_mi": {
            section: document.querySelector('.exam'),
            checkbox: document.getElementById('high_exam'),
            hiddenInput: document.getElementById('examPassed_mi_hidden')
        },
        "exam_hi": {
            section: document.querySelector('.exam'),
            checkbox: document.getElementById('college_exam'),
            hiddenInput: document.getElementById('examPassed_hi_hidden')
        }
    };

    // '검정고시' 체크박스 이벤트 리스너 추가
    Object.values(examSections).forEach(function(exam) {
        if (exam.checkbox && exam.hiddenInput) {
            exam.checkbox.addEventListener('change', function() {
                exam.hiddenInput.value = this.checked ? 'Y' : 'N';
            });
            // 초기 상태 설정
            exam.hiddenInput.value = exam.checkbox.checked ? 'Y' : 'N';
        }
    });

    // 학력 필드 표시 및 비활성화/활성화 함수
    function displayEducationFields() {
        const selectedEduValue = selectedu.value;

        // 모든 학력 필드 섹션 숨기기 및 비활성화
        Object.values(educationFields).forEach(function(section) {
            if (section) {
                section.style.display = "none";
                const inputs = section.querySelectorAll("input, select");
                inputs.forEach(function(input) {
                    input.disabled = true;
                });
            }
        });

        // 모든 '검정고시' 영역 숨기기 및 체크박스 비활성화
        Object.values(examSections).forEach(function(exam) {
            if (exam.section) {
                exam.section.style.display = "none";
            }
            if (exam.checkbox) {
                exam.checkbox.disabled = true;
                //exam.checkbox.checked = false;
            }
            if (exam.hiddenInput) {
                //exam.hiddenInput.value = 'N';
            }
        });

        // 선택된 학력 필드 섹션만 표시하고 활성화
        const activeSection = educationFields[selectedEduValue];
        if (activeSection) {
            activeSection.style.display = "block";
            const activeInputs = activeSection.querySelectorAll("input, select");
            activeInputs.forEach(function(input) {
                input.disabled = false;
            });

            // 높이 조절 (필요에 따라 조정)
            educationLvElement.style.height = '300px';

            // 해당 학력 수준에 따른 '검정고시' 영역 표시 및 활성화
            if (selectedEduValue === "초등학교" && examSections.exam_el.section) {
                examSections.exam_el.section.style.display = "flex";
                examSections.exam_el.checkbox.disabled = false;
                // 체크박스 상태에 따른 hidden input 값 설정
                examSections.exam_el.hiddenInput.value = examSections.exam_el.checkbox.checked ? 'Y' : 'N';
            } else if (selectedEduValue === "중학교" && examSections.exam_mi.section) {
                examSections.exam_mi.section.style.display = "block";
                examSections.exam_mi.checkbox.disabled = false;
                examSections.exam_mi.hiddenInput.value = examSections.exam_mi.checkbox.checked ? 'Y' : 'N';
            } else if (selectedEduValue === "고등학교" && examSections.exam_hi.section) {
                examSections.exam_hi.section.style.display = "block";
                examSections.exam_hi.checkbox.disabled = false;
                examSections.exam_hi.hiddenInput.value = examSections.exam_hi.checkbox.checked ? 'Y' : 'N';
            }
        } else {
            // 선택되지 않았거나 다른 값일 경우 기본 높이 유지
            educationLvElement.style.height = '150px';
        }
    }

    // 페이지 로드 시 초기 상태 설정
    displayEducationFields();

    // 학력 선택 시 displayEducationFields 함수 호출
    selectedu.addEventListener('change', displayEducationFields);
});





 // 군사 상태 선택 처리
 const militaryStatusSelect = document.getElementById('military_status');
 if (militaryStatusSelect) {
     militaryStatusSelect.addEventListener('change', function () {
         const selectedValue = this.value;
         const parentDiv = this.closest('.pre2'); // 해당 select의 상위 pre2 div 찾기

         if (!parentDiv) return; // parentDiv가 없으면 종료

         // 관련 필드 요소 선택 (id를 사용)
         const 미필 = parentDiv.querySelector('#unfulfilledFields');
         const 면제 = parentDiv.querySelector('#exemptedFields');
         const 군필 = parentDiv.querySelector('#fulfilledFields');
         const 복무중 = parentDiv.querySelector('#servingFields');

         // 모든 필드 숨기기
         if (미필) 미필.style.display = 'none';
         if (면제) 면제.style.display = 'none';
         if (군필) 군필.style.display = 'none';
         if (복무중) 복무중.style.display = 'none';

         // 선택한 값에 따라 해당 필드 표시
         switch(selectedValue) {
             case '미필':
                 if (미필) 미필.style.display = 'flex';
                 break;
             case '면제':
                 if (면제) 면제.style.display = 'flex';
                 break;
             case '군필':
                 if (군필) 군필.style.display = 'flex';
                 break;
             case '복무중':
                 if (복무중) 복무중.style.display = 'flex';
                 break;
             default:
                 // '대상아님' 또는 기타 선택 시 아무 것도 표시하지 않음
                 break;
         }
     });
 }
 // 경력 체크박스 처리
 const careerCheckbox = document.getElementById("CareerY");
 if (careerCheckbox) {
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
         } else {
             // 체크 해제 시 원래대로 복원
             careerLabel.style.display = "block";
             checkboxLabel.style.display = "block";
             careerFieldset.style.height = "155px";
             careerDetails.forEach(field => field.style.display = "none");
         }
     });
 }

 function sample4_execDaumPostcode() {
    // Daum.Postcode 라이브러리가 로드되어 있는지 확인
    if (typeof daum === 'undefined' || !daum.Postcode) {
        console.error("Daum.Postcode 라이브러리가 로드되지 않았습니다.");
        return;
    }

    new daum.Postcode({
        oncomplete: function(data) {
            // 선택한 주소 정보를 표시
            const postcode = document.getElementById("sample4_postcode");
            const roadAddress = document.getElementById("roadAddress");
            const detailAddress = document.getElementById("detailAddress");
            const guideTextBox = document.getElementById("guide");

            if (postcode) postcode.value = data.zonecode; // 우편번호
            if (roadAddress) roadAddress.value = data.roadAddress; // 도로명 주소
            if (detailAddress) detailAddress.focus(); // 상세주소로 포커스 이동

            // 참고항목 정보 설정
            if (guideTextBox) {
                if (data.autoRoadAddress) {
                    const extraAddr = data.autoRoadAddress ? data.autoRoadAddress : '';
                    guideTextBox.innerHTML = "(예상 도로명 주소: " + extraAddr + ")";
                    guideTextBox.style.display = "block";
                } else {
                    guideTextBox.innerHTML = "";
                    guideTextBox.style.display = "none";
                }
            }
        }
    }).open();
}

document.addEventListener("DOMContentLoaded", function () {
    const selectPortButton = document.querySelector(".select_port");
    const modal = document.getElementById("modal");
    const closeButtons = document.querySelectorAll(".close");
    const portfolioListDiv = document.getElementById("portfolio-list");
    const selectedPortDiv = document.querySelector(".selected_port");
    const resumeNoInput = document.getElementById("resumeNo");
    const resumeNo = resumeNoInput ? resumeNoInput.value : null;

    // 디버깅용 로그: contextPath 및 resumeNo 확인
    console.log('Context Path:', contextPath);
    console.log('Resume No:', resumeNo);

    // 페이지 로드 시 이미 등록된 포트폴리오 표시
    function loadSelectedPortfolios() {
        if (!resumeNo) {
            console.error('resumeNo가 정의되지 않았습니다.');
            return;
        }

        fetch(`${contextPath}/resume/getPortfoliosByResumeNo?resumeNo=${resumeNo}`, {
            method: 'GET',
            credentials: 'same-origin' // 쿠키 포함
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("네트워크 응답에 문제가 있습니다.");
                }
                return response.json();
            })
            .then(portfolios => {
                selectedPortDiv.innerHTML = ""; // 기존 내용을 초기화

                if (portfolios.length === 0) {
                    selectedPortDiv.innerHTML = "<p>등록된 포트폴리오가 없습니다.</p>";
                } else {
                    portfolios.forEach(portfolio => {
                        const selectedItem = document.createElement("span");
                        selectedItem.id = `selected-${portfolio.portfolioId}`;
                        selectedItem.textContent = portfolio.title;
                        selectedItem.classList.add("selected-portfolio");
                        selectedPortDiv.appendChild(selectedItem);
                    });
                }
            })
            .catch(error => {
                console.error("포트폴리오 데이터를 가져오는 중 오류 발생:", error);
                alert("포트폴리오 데이터를 불러오는 중 문제가 발생했습니다.");
            });
    }

    // 페이지 로드 시 포트폴리오 목록 가져오기
    loadSelectedPortfolios();

    // "불러오기" 버튼 클릭 시 포트폴리오 목록 모달 표시
    selectPortButton.addEventListener("click", function () {
        if (!resumeNo) {
            console.error('resumeNo가 정의되지 않았습니다.');
            alert("이력서 번호가 정의되지 않았습니다.");
            return;
        }

        fetch(`${contextPath}/resume/getPortfoliosByResumeNo?resumeNo=${resumeNo}`, {
            method: 'GET',
            credentials: 'same-origin' // 쿠키 포함
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("네트워크 응답에 문제가 있습니다.");
                }
                return response.json();
            })
            .then(portfolios => {
                portfolioListDiv.innerHTML = ""; // 기존 내용을 초기화

                if (portfolios.length === 0) {
                    portfolioListDiv.innerHTML = "<p>등록된 포트폴리오가 없습니다.</p>";
                } else {
                    portfolios.forEach(portfolio => {
                        const portfolioItem = document.createElement("div");
                        portfolioItem.classList.add("portfolio-item");

                        // 체크박스와 레이블 생성
                        const checkbox = document.createElement("input");
                        checkbox.type = "checkbox";
                        checkbox.name = "selectedPortfolios";
                        checkbox.value = portfolio.portfolioId;
                        checkbox.id = `portfolio-${portfolio.portfolioId}`;

                        // 이미 선택된 포트폴리오인지 확인
                        const isSelected = document.getElementById(`selected-${portfolio.portfolioId}`) !== null;
                        if (isSelected) {
                            checkbox.checked = true;
                        }

                        const label = document.createElement("label");
                        label.htmlFor = `portfolio-${portfolio.portfolioId}`;
                        label.textContent = portfolio.title;

                        portfolioItem.appendChild(checkbox);
                        portfolioItem.appendChild(label);

                        // 체크박스 상태 변경 시 처리
                        checkbox.addEventListener('change', function () {
                            if (this.checked) {
                                // 선택된 포트폴리오 제목을 'selected_port' div에 추가
                                const selectedItem = document.createElement("span");
                                selectedItem.id = `selected-${portfolio.portfolioId}`;
                                selectedItem.textContent = portfolio.title;
                                selectedItem.classList.add("selected-portfolio");
                                selectedPortDiv.appendChild(selectedItem);
                            } else {
                                // 선택 해제 시 'selected_port' div에서 해당 제목 제거
                                const selectedItem = document.getElementById(`selected-${portfolio.portfolioId}`);
                                if (selectedItem) {
                                    selectedPortDiv.removeChild(selectedItem);
                                }
                            }
                        });

                        portfolioListDiv.appendChild(portfolioItem);
                    });
                }

                // 모달 표시
                modal.style.display = "flex";
            })
            .catch(error => {
                console.error("포트폴리오 데이터를 가져오는 중 오류 발생:", error);
                alert("포트폴리오 데이터를 불러오는 중 문제가 발생했습니다.");
            });
    });

    // 닫기 버튼 이벤트
    closeButtons.forEach(closeBtn => {
        closeBtn.addEventListener("click", function () {
            modal.style.display = "none";
        });
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    // 선택된 포트폴리오 제목을 클릭하면 체크박스 해제 및 제목 제거
    selectedPortDiv.addEventListener('click', function (event) {
        if (event.target.classList.contains('selected-portfolio')) {
            const portfolioId = event.target.id.replace('selected-', '');
            const checkbox = document.getElementById(`portfolio-${portfolioId}`);
            if (checkbox) {
                checkbox.checked = false;
            }
            event.target.remove();
        }
    });

    // 폼 제출 시 선택된 포트폴리오 ID를 hidden input으로 추가
    const form = document.querySelector("form");
    form.addEventListener("submit", function (event) {
        // 기존 hidden inputs 제거
        const existingInputs = document.querySelectorAll("input[name='resumePortfolios[]']");
        existingInputs.forEach(input => input.remove());

        // 선택된 포트폴리오 ID 가져오기
        const selectedCheckboxes = document.querySelectorAll("input[name='selectedPortfolios']:checked");
        const selectedIds = Array.from(selectedCheckboxes).map(cb => parseInt(cb.value));

        // hidden inputs 생성
        selectedIds.forEach(id => {
            const hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = "resumePortfolios[]";
            hiddenInput.value = id;
            form.appendChild(hiddenInput);
        });
    });
});