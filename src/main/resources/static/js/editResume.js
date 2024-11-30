// ===========================
// 스킬 관리 관련 함수
// ===========================

// 스킬 배열을 선언
let skills = [];

// 페이지 로드 시 모든 초기화 함수 호출
document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM fully loaded and parsed.");

    // 스킬 관리 초기화
    initializeSkills();

    // 자격증, 어학시험, 수상내역 초기 데이터 로딩
    populateExistingData();

    // 학력 필드 관리 초기화
    initializeEducationFields();

    // 군 복무 상태 관리 초기화
    initializeMilitaryStatus();

    // 경력 필드 관리 초기화
    initializeCareerFields();
});

// ===========================
// 스킬 관리 관련 함수
// ===========================

function initializeSkills() {
    const skillList = document.querySelectorAll('#skillList .myskill1');
    const skillContainer = document.querySelector('.skill');
    const skTitle2 = document.getElementById('sk_title2');

    // 기존 데이터가 있을 경우 스킬 배열에 추가
    skillList.forEach(skillItem => {
        const skillText = skillItem.textContent.replace('❌', '').replace('#', '').trim(); // # 및 공백 제거
        skills.push(skillText);
    });

    updateSkillUI();

    // 스킬 추가 버튼 클릭 이벤트 처리
    const addSkillButton = document.querySelector('#sk_title1 button');
    if (addSkillButton) {
        addSkillButton.addEventListener('click', function() {
            const input = document.querySelector('.skill_title input');
            const skillValue = input.value.trim();

            if (skillValue && !skills.includes(skillValue)) {
                addSkill(skillValue);
                input.value = '';
            } else if (!skillValue) {
                alert('스킬을 입력해주세요.'); // 빈 값 입력 방지
            } else if (skills.includes(skillValue)) {
                alert('이미 추가된 스킬입니다.'); // 중복 방지
            }
        });
    }

    // 폼 제출 시 모든 스킬을 하나의 문자열로 합쳐서 hidden input에 저장
    const resumeForm = document.querySelector('form');
    if (resumeForm) {
        resumeForm.addEventListener('submit', function(event) {
            // 스킬 배열을 쉼표로 구분된 문자열로 합침
            let skillInput = document.querySelector('input[name="skillName"]');

            // hidden input이 존재하지 않는다면 새로 생성
            if (!skillInput) {
                skillInput = document.createElement('input');
                skillInput.type = 'hidden';
                skillInput.name = 'skillName';
                resumeForm.appendChild(skillInput);
            }

            skillInput.value = skills.join(', ');

            // AJAX 요청으로 서버에 스킬 저장하기 (필요 시 주석 해제)
            /*
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
            */
        });
    }
}

// 스킬 추가 함수
function addSkill(skill) {
    // "나의 스킬" 문구와 영역을 보이게 설정
    const skTitle2 = document.getElementById('sk_title2');
    skTitle2.style.display = 'block';

    // 스킬 요소 생성
    const newSkill = document.createElement('div');
    newSkill.className = 'myskill1';
    newSkill.innerHTML = `#${skill} <span class="delete-icon" onclick="removeSkill(this)">❌</span>`;

    // 나의 스킬 영역에 추가
    document.querySelector('#skillList').appendChild(newSkill);

    // 스킬을 배열에 저장
    skills.push(skill);

    // UI 업데이트
    updateSkillUI();
}

// 스킬 삭제 기능
function removeSkill(element) {
    const skillValue = element.parentElement.textContent.replace('❌', '').replace('#', '').trim();

    // 스킬 삭제 시 배열에서도 제거
    skills = skills.filter(skill => skill !== skillValue);
    element.parentElement.remove();

    // UI 업데이트
    updateSkillUI();
}

// 스킬 UI 업데이트 함수
function updateSkillUI() {
    const skillContainer = document.querySelector('.skill');
    const skTitle2 = document.getElementById('sk_title2');

    if (skills.length > 0) {
        // 데이터가 있을 때 높이를 230px로 설정
        skillContainer.style.height = '230px';
        skTitle2.style.display = 'block';
    } else {
        // 데이터가 없을 때 높이를 175px로 설정
        skillContainer.style.height = '175px';
        skTitle2.style.display = 'none';
    }
}

// ===========================
// 자격증, 어학시험, 수상내역 관리
// ===========================

// 삭제된 자격증, 어학시험, 수상내역 ID를 추가하는 함수
function addDeletedId(type, id) {
    const deletedInput = document.getElementById(`deleted${capitalizeFirstLetter(type)}s`);
    if (!deletedInput) {
        console.error(`deleted${capitalizeFirstLetter(type)}s 요소를 찾을 수 없습니다.`);
        return;
    }

    let deletedIds = deletedInput.value;
    if (deletedIds) {
        deletedIds += ',' + id;
    } else {
        deletedIds = id;
    }
    deletedInput.value = deletedIds;
}

// 리스트 아이템 생성 및 폼에 hidden input 추가 함수
function createListItem(title, details, institution, listSelector, inputNames, id = null, type = 'certificate') {
    const listContainer = document.querySelector(listSelector);
    if (!listContainer) {
        console.error(`리스트 컨테이너 ${listSelector}를 찾을 수 없습니다.`);
        return;
    }

    const listItem = document.createElement('div');
    listItem.className = 'list-item';
    if (id) {
        listItem.setAttribute('data-id', id);
    }

    const itemContent = document.createElement('div');
    itemContent.className = 'item-content';

    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = `<strong>${title}</strong> ${details}`;

    if (institution) {
        const institutionDiv = document.createElement('div');
        institutionDiv.className = 'institution';
        institutionDiv.textContent = `발행처: ${institution}`;
        itemContent.appendChild(institutionDiv);
    }

    itemContent.appendChild(titleDiv);

    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'actions';

    const deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.textContent = '삭제';
    
    // Delete function based on type
    const deleteFunctionName = `remove${capitalizeFirstLetter(type)}`;
    deleteButton.setAttribute('onclick', `${deleteFunctionName}(${id || 'null'})`);

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
        if (name.includes('Name')) {
            hiddenInput.value = title;
        } else if (name.includes('Agency') || name.includes('Organizer')) {
            hiddenInput.value = institution;
        } else if (name.includes('Status')) {
            hiddenInput.value = details.split('|')[0].trim();
        } else if (name.includes('Date')) {
            hiddenInput.value = details.split('|')[1] ? details.split('|')[1].trim().replace(/\./g, '-') : details.trim().replace(/\./g, '-');
        } else if (name.includes('Level')) {
            hiddenInput.value = details.split(',')[1].trim().split('|')[0].trim();
        } else if (name.includes('Type')) {
            hiddenInput.value = details.split(',')[0].trim();
        }
        document.getElementById('resumeForm').appendChild(hiddenInput);
    });

    return listItem;
}

// Helper function to capitalize first letter
function capitalizeFirstLetter(string) {
    if (!string) return '';
    return string.charAt(0).toUpperCase() + string.slice(1);
}

// 자격증 삭제 함수
function removeCertificate(certificateId) {
    if (certificateId === null) {
        console.error("유효하지 않은 자격증 ID입니다.");
        return;
    }

    // 삭제된 자격증 ID를 hidden input에 추가
    addDeletedId('qualification', certificateId);

    // UI에서 해당 자격증 항목 제거
    const certificateListItem = document.querySelector(`.list-item[data-id="${certificateId}"]`);
    if (certificateListItem) {
        certificateListItem.remove();
    }

    console.log(`Certificate ID ${certificateId} marked for deletion.`);
}

// 어학시험 삭제 함수
function removeLanguageTest(languageTestId) {
    if (languageTestId === null) {
        console.error("유효하지 않은 어학시험 ID입니다.");
        return;
    }

    // 삭제된 어학시험 ID를 hidden input에 추가
    addDeletedId('languageTest', languageTestId);

    // UI에서 해당 어학시험 항목 제거
    const languageTestListItem = document.querySelector(`.list-item[data-id="${languageTestId}"]`);
    if (languageTestListItem) {
        languageTestListItem.remove();
    }

    console.log(`Language Test ID ${languageTestId} marked for deletion.`);
}

// 수상경력 삭제 함수
function removeAward(awardId) {
    if (awardId === null) {
        console.error("유효하지 않은 수상경력 ID입니다.");
        return;
    }

    // 삭제된 수상경력 ID를 hidden input에 추가
    addDeletedId('award', awardId);

    // UI에서 해당 수상경력 항목 제거
    const awardListItem = document.querySelector(`.list-item[data-id="${awardId}"]`);
    if (awardListItem) {
        awardListItem.remove();
    }

    console.log(`Award ID ${awardId} marked for deletion.`);
}

// 전역 접근성 확보
window.removeCertificate = removeCertificate;
window.removeLanguageTest = removeLanguageTest;
window.removeAward = removeAward;

// ===========================
// 자격증 추가 버튼 클릭 이벤트 처리
// ===========================

document.addEventListener('DOMContentLoaded', function() {
    // 자격증 추가 버튼 클릭 이벤트 처리
    const addQualificationButton = document.querySelector('.addQualificationButton');
    if (addQualificationButton) {
        addQualificationButton.addEventListener('click', function(event) {
            event.preventDefault();

            const certificateFields = document.getElementById('certificateFields');
            const certificateDateFields = document.getElementById('certificateDate');

            const qualificationName = certificateFields.querySelector('input[name="qualificationName[]"]').value.trim();
            const issuingAgency = certificateFields.querySelector('input[name="issuingAgency[]"]').value.trim();
            const passStatus = certificateFields.querySelector('select[name="passStatus[]"]').value.trim();
            const testDate = certificateDateFields.querySelector('input[name="testDate_cer[]"]').value;

            // 빈 값 체크
            if (!qualificationName || !issuingAgency || !passStatus || !testDate) {
                alert("모든 필드를 입력해주세요.");
                return;
            }

            // 리스트에 추가 (새로 추가되는 자격증은 ID가 없으므로 null 전달)
            createListItem(
                qualificationName, 
                `${passStatus} | ${testDate.replace(/-/g, ".")}`, 
                issuingAgency, 
                '.result-list-certificate',
                ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]'],
                null, // 새로운 자격증은 ID가 없으므로 null
                'certificate'
            );
            console.log("자격증 추가 완료!");

            // 입력 필드 초기화
            certificateFields.querySelector('input[name="qualificationName[]"]').value = '';
            certificateFields.querySelector('input[name="issuingAgency[]"]').value = '';
            certificateFields.querySelector('select[name="passStatus[]"]').selectedIndex = 0;
            certificateDateFields.querySelector('input[name="testDate_cer[]"]').value = '';
        });
    }

    // 어학시험 추가하기 버튼 이벤트 처리
    const addLanguageButton = document.querySelector('.addLanguageButton');
    if (addLanguageButton) {
        addLanguageButton.addEventListener('click', function(event) {
            event.preventDefault();

            const languageFields = document.getElementById('languageFields');

            const languageName = languageFields.querySelector('input[name="languageName[]"]').value.trim();
            const proficiencyLevel = languageFields.querySelector('select[name="proficiencyLevel[]"]').value.trim();
            const languageType = languageFields.querySelector('select[name="languageType[]"]').value.trim();
            const issueDate = languageFields.querySelector('input[name="issueDate[]"]').value;

            // 빈 값 체크
            if (!languageName || !proficiencyLevel || !languageType || !issueDate) {
                alert("모든 필드를 입력해주세요.");
                return;
            }

            // 리스트에 추가
            createListItem(
                languageName,
                `${languageType}, ${proficiencyLevel} | ${issueDate.replace(/-/g, ".")}`,
                '',
                '.result-list-language',
                ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]'],
                null, // 새로운 어학시험은 ID가 없으므로 null
                'languageTest'
            );

            console.log("어학시험 추가 완료!");

            // 입력 필드 초기화
            languageFields.querySelector('input[name="languageName[]"]').value = '';
            languageFields.querySelector('select[name="proficiencyLevel[]"]').selectedIndex = 0;
            languageFields.querySelector('select[name="languageType[]"]').selectedIndex = 0;
            languageFields.querySelector('input[name="issueDate[]"]').value = '';
        });
    }

    // 수상내역 추가하기 버튼 이벤트 처리
    const addAwardButton = document.querySelector('.addAwardButton');
    if (addAwardButton) {
        addAwardButton.addEventListener('click', function(event) {
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
                ['awardName[]', 'organizer[]', 'awardDate[]'],
                null, // 새로운 수상내역은 ID가 없으므로 null
                'award'
            );

            console.log("수상내역 추가 완료!");

            // 입력 필드 초기화
            awardFields.querySelector('input[name="awardName[]"]').value = '';
            awardFields.querySelector('input[name="organizer[]"]').value = '';
            awardFields.querySelector('input[name="awardDate[]"]').value = '';
        });
    }
});

// ===========================
// 데이터베이스에서 가져온 데이터 로드 함수
// ===========================

function populateExistingData() {
    // 자격증 데이터 로드
    const existingCertificatesInput = document.getElementById('existingCertificates');
    if (existingCertificatesInput) {
        try {
            const existingCertificates = JSON.parse(existingCertificatesInput.value || '[]');
            existingCertificates.forEach(certificate => {
                createListItem(
                    certificate.qualificationName, 
                    `${certificate.passStatus} | ${certificate.testDate_cer.replace(/-/g, ".")}`, 
                    certificate.issuingAgency, 
                    '.result-list-certificate',
                    ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]'],
                    certificate.certificateId, // 기존 자격증의 ID 전달
                    'certificate'
                );
            });
        } catch (e) {
            console.error("자격증 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 어학시험 데이터 로드
    const existingLanguagesInput = document.getElementById('existingLanguages');
    if (existingLanguagesInput) {
        try {
            const existingLanguages = JSON.parse(existingLanguagesInput.value || '[]');
            existingLanguages.forEach(language => {
                createListItem(
                    language.languageName, 
                    `${language.languageType}, ${language.proficiencyLevel} | ${language.issueDate.replace(/-/g, ".")}`, 
                    '', 
                    '.result-list-language',
                    ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]'],
                    language.languageTestId, // 어학시험의 ID 전달 (필요 시)
                    'languageTest'
                );
            });
        } catch (e) {
            console.error("어학시험 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 수상내역 데이터 로드
    const existingAwardsInput = document.getElementById('existingAwards');
    if (existingAwardsInput) {
        try {
            const existingAwards = JSON.parse(existingAwardsInput.value || '[]');
            existingAwards.forEach(award => {
                createListItem(
                    award.awardName, 
                    `${award.awardDate.replace(/-/g, ".")}`, 
                    award.organizer, 
                    '.result-list-awards',
                    ['awardName[]', 'organizer[]', 'awardDate[]'],
                    award.awardId, // 수상내역의 ID 전달 (필요 시)
                    'award'
                );
            });
        } catch (e) {
            console.error("수상내역 데이터를 파싱하는 중 오류 발생:", e);
        }
    }
}

// ===========================
// 학력 필드 표시 및 비활성화/활성화 함수 통합
// ===========================

function initializeEducationFields() {
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
    if (categorySelect) {
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
    }
}

// ===========================
// 군 복무 상태 처리 함수
// ===========================

function initializeMilitaryStatus() {
    const militarySelect = document.getElementById("military_status");
    const fieldsMap = {
        unfulfilled: document.querySelector(".unfulfilled"),
        exempted: document.querySelector(".EXEMPTED"),
        fulfilled: document.querySelector(".fulfilled"),
        serving: document.querySelector(".serving"),
    };

    if (!militarySelect) {
        console.error("military_status 요소를 찾을 수 없습니다.");
        return;
    }

    // 초기화 - 모든 필드를 숨김
    Object.values(fieldsMap).forEach(field => {
        if (field) field.style.display = "none";
    });

    // 초기 상태 설정 - 현재 선택된 값에 따라 필드 표시
    const selectedValue = militarySelect.value;
    const initialField = fieldsMap[selectedValue];
    if (initialField) {
        initialField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
    }

    // 군 복무 상태 변경 이벤트
    militarySelect.addEventListener("change", function () {
        // 모든 필드를 숨김
        Object.values(fieldsMap).forEach(field => {
            if (field) field.style.display = "none";
        });

        // 선택된 값에 따라 필드 표시
        const selectedField = fieldsMap[this.value];
        if (selectedField) {
            selectedField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
        }
    });
}

// ===========================
// 경력 필드 관리 함수
// ===========================

function initializeCareerFields() {
    const careerCheckbox = document.getElementById("CareerY");
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
    const careerFieldset = document.querySelector("fieldset.career");
    const careerLabel = document.querySelector("label.careerYorN");
    const checkboxLabel = careerCheckbox ? careerCheckbox.parentElement : null;

    if (!careerFieldset) {
        console.error("fieldset.career 요소를 찾을 수 없습니다.");
        return;
    }

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
}

// ===========================
// 데이터베이스에서 가져온 데이터 로드 함수
// ===========================

// 이 함수는 이미 DOMContentLoaded 이벤트에서 호출되고 있으므로, 여기서는 별도로 호출할 필요가 없습니다.
// 그러나 만약 다른 시점에서 데이터를 다시 로드해야 한다면 이 함수를 호출할 수 있습니다.
function populateExistingData() {
    // 자격증 데이터 로드
    const existingCertificatesInput = document.getElementById('existingCertificates');
    if (existingCertificatesInput) {
        try {
            const existingCertificates = JSON.parse(existingCertificatesInput.value || '[]');
            existingCertificates.forEach(certificate => {
                createListItem(
                    certificate.qualificationName, 
                    `${certificate.passStatus} | ${certificate.testDate_cer.replace(/-/g, ".")}`, 
                    certificate.issuingAgency, 
                    '.result-list-certificate',
                    ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]'],
                    certificate.certificateId, // 기존 자격증의 ID 전달
                    'certificate'
                );
            });
        } catch (e) {
            console.error("자격증 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 어학시험 데이터 로드
    const existingLanguagesInput = document.getElementById('existingLanguages');
    if (existingLanguagesInput) {
        try {
            const existingLanguages = JSON.parse(existingLanguagesInput.value || '[]');
            existingLanguages.forEach(language => {
                createListItem(
                    language.languageName, 
                    `${language.languageType}, ${language.proficiencyLevel} | ${language.issueDate.replace(/-/g, ".")}`, 
                    '', 
                    '.result-list-language',
                    ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]'],
                    language.languageTestId, // 어학시험의 ID 전달 (필요 시)
                    'languageTest'
                );
            });
        } catch (e) {
            console.error("어학시험 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 수상내역 데이터 로드
    const existingAwardsInput = document.getElementById('existingAwards');
    if (existingAwardsInput) {
        try {
            const existingAwards = JSON.parse(existingAwardsInput.value || '[]');
            existingAwards.forEach(award => {
                createListItem(
                    award.awardName, 
                    `${award.awardDate.replace(/-/g, ".")}`, 
                    award.organizer, 
                    '.result-list-awards',
                    ['awardName[]', 'organizer[]', 'awardDate[]'],
                    award.awardId, // 수상내역의 ID 전달 (필요 시)
                    'award'
                );
            });
        } catch (e) {
            console.error("수상내역 데이터를 파싱하는 중 오류 발생:", e);
        }
    }
}

// ===========================
// 학력 필드 표시 및 비활성화/활성화 함수 통합
// ===========================

function initializeEducationFields() {
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
    if (categorySelect) {
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
    }
}

// ===========================
// 군 복무 상태 처리 함수
// ===========================

function initializeMilitaryStatus() {
    const militarySelect = document.getElementById("military_status");
    const fieldsMap = {
        unfulfilled: document.querySelector(".unfulfilled"),
        exempted: document.querySelector(".EXEMPTED"),
        fulfilled: document.querySelector(".fulfilled"),
        serving: document.querySelector(".serving"),
    };

    if (!militarySelect) {
        console.error("military_status 요소를 찾을 수 없습니다.");
        return;
    }

    // 초기화 - 모든 필드를 숨김
    Object.values(fieldsMap).forEach(field => {
        if (field) field.style.display = "none";
    });

    // 초기 상태 설정 - 현재 선택된 값에 따라 필드 표시
    const selectedValue = militarySelect.value;
    const initialField = fieldsMap[selectedValue];
    if (initialField) {
        initialField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
    }

    // 군 복무 상태 변경 이벤트
    militarySelect.addEventListener("change", function () {
        // 모든 필드를 숨김
        Object.values(fieldsMap).forEach(field => {
            if (field) field.style.display = "none";
        });

        // 선택된 값에 따라 필드 표시
        const selectedField = fieldsMap[this.value];
        if (selectedField) {
            selectedField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
        }
    });
}

// ===========================
// 경력 필드 관리 함수
// ===========================

function initializeCareerFields() {
    const careerCheckbox = document.getElementById("CareerY");
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
    const careerFieldset = document.querySelector("fieldset.career");
    const careerLabel = document.querySelector("label.careerYorN");
    const checkboxLabel = careerCheckbox ? careerCheckbox.parentElement : null;

    if (!careerFieldset) {
        console.error("fieldset.career 요소를 찾을 수 없습니다.");
        return;
    }

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
}

// ===========================
// 데이터베이스에서 가져온 데이터 로드 함수
// ===========================

// 이 함수는 이미 DOMContentLoaded 이벤트에서 호출되고 있으므로, 여기서는 별도로 호출할 필요가 없습니다.
// 그러나 만약 다른 시점에서 데이터를 다시 로드해야 한다면 이 함수를 호출할 수 있습니다.
function populateExistingData() {
    // 자격증 데이터 로드
    const existingCertificatesInput = document.getElementById('existingCertificates');
    if (existingCertificatesInput) {
        try {
            const existingCertificates = JSON.parse(existingCertificatesInput.value || '[]');
            existingCertificates.forEach(certificate => {
                createListItem(
                    certificate.qualificationName, 
                    `${certificate.passStatus} | ${certificate.testDate_cer.replace(/-/g, ".")}`, 
                    certificate.issuingAgency, 
                    '.result-list-certificate',
                    ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]'],
                    certificate.certificateId, // 기존 자격증의 ID 전달
                    'certificate'
                );
            });
        } catch (e) {
            console.error("자격증 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 어학시험 데이터 로드
    const existingLanguagesInput = document.getElementById('existingLanguages');
    if (existingLanguagesInput) {
        try {
            const existingLanguages = JSON.parse(existingLanguagesInput.value || '[]');
            existingLanguages.forEach(language => {
                createListItem(
                    language.languageName, 
                    `${language.languageType}, ${language.proficiencyLevel} | ${language.issueDate.replace(/-/g, ".")}`, 
                    '', 
                    '.result-list-language',
                    ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]'],
                    language.languageTestId, // 어학시험의 ID 전달 (필요 시)
                    'languageTest'
                );
            });
        } catch (e) {
            console.error("어학시험 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 수상내역 데이터 로드
    const existingAwardsInput = document.getElementById('existingAwards');
    if (existingAwardsInput) {
        try {
            const existingAwards = JSON.parse(existingAwardsInput.value || '[]');
            existingAwards.forEach(award => {
                createListItem(
                    award.awardName, 
                    `${award.awardDate.replace(/-/g, ".")}`, 
                    award.organizer, 
                    '.result-list-awards',
                    ['awardName[]', 'organizer[]', 'awardDate[]'],
                    award.awardId, // 수상내역의 ID 전달 (필요 시)
                    'award'
                );
            });
        } catch (e) {
            console.error("수상내역 데이터를 파싱하는 중 오류 발생:", e);
        }
    }
}

// ===========================
// 학력 필드 표시 및 비활성화/활성화 함수 통합
// ===========================

function initializeEducationFields() {
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
    if (categorySelect) {
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
    }
}

// ===========================
// 군 복무 상태 처리 함수
// ===========================

function initializeMilitaryStatus() {
    const militarySelect = document.getElementById("military_status");
    const fieldsMap = {
        unfulfilled: document.querySelector(".unfulfilled"),
        exempted: document.querySelector(".EXEMPTED"),
        fulfilled: document.querySelector(".fulfilled"),
        serving: document.querySelector(".serving"),
    };

    if (!militarySelect) {
        console.error("military_status 요소를 찾을 수 없습니다.");
        return;
    }

    // 초기화 - 모든 필드를 숨김
    Object.values(fieldsMap).forEach(field => {
        if (field) field.style.display = "none";
    });

    // 초기 상태 설정 - 현재 선택된 값에 따라 필드 표시
    const selectedValue = militarySelect.value;
    const initialField = fieldsMap[selectedValue];
    if (initialField) {
        initialField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
    }

    // 군 복무 상태 변경 이벤트
    militarySelect.addEventListener("change", function () {
        // 모든 필드를 숨김
        Object.values(fieldsMap).forEach(field => {
            if (field) field.style.display = "none";
        });

        // 선택된 값에 따라 필드 표시
        const selectedField = fieldsMap[this.value];
        if (selectedField) {
            selectedField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
        }
    });
}

// ===========================
// 경력 필드 관리 함수
// ===========================

function initializeCareerFields() {
    const careerCheckbox = document.getElementById("CareerY");
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
    const careerFieldset = document.querySelector("fieldset.career");
    const careerLabel = document.querySelector("label.careerYorN");
    const checkboxLabel = careerCheckbox ? careerCheckbox.parentElement : null;

    if (!careerFieldset) {
        console.error("fieldset.career 요소를 찾을 수 없습니다.");
        return;
    }

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
}

// ===========================
// 데이터베이스에서 가져온 데이터 로드 함수
// ===========================

// 이 함수는 이미 DOMContentLoaded 이벤트에서 호출되고 있으므로, 여기서는 별도로 호출할 필요가 없습니다.
// 그러나 만약 다른 시점에서 데이터를 다시 로드해야 한다면 이 함수를 호출할 수 있습니다.
function populateExistingData() {
    // 자격증 데이터 로드
    const existingCertificatesInput = document.getElementById('existingCertificates');
    if (existingCertificatesInput) {
        try {
            const existingCertificates = JSON.parse(existingCertificatesInput.value || '[]');
            existingCertificates.forEach(certificate => {
                createListItem(
                    certificate.qualificationName, 
                    `${certificate.passStatus} | ${certificate.testDate_cer.replace(/-/g, ".")}`, 
                    certificate.issuingAgency, 
                    '.result-list-certificate',
                    ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]'],
                    certificate.certificateId, // 기존 자격증의 ID 전달
                    'certificate'
                );
            });
        } catch (e) {
            console.error("자격증 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 어학시험 데이터 로드
    const existingLanguagesInput = document.getElementById('existingLanguages');
    if (existingLanguagesInput) {
        try {
            const existingLanguages = JSON.parse(existingLanguagesInput.value || '[]');
            existingLanguages.forEach(language => {
                createListItem(
                    language.languageName, 
                    `${language.languageType}, ${language.proficiencyLevel} | ${language.issueDate.replace(/-/g, ".")}`, 
                    '', 
                    '.result-list-language',
                    ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]'],
                    language.languageTestId, // 어학시험의 ID 전달 (필요 시)
                    'languageTest'
                );
            });
        } catch (e) {
            console.error("어학시험 데이터를 파싱하는 중 오류 발생:", e);
        }
    }

    // 수상내역 데이터 로드
    const existingAwardsInput = document.getElementById('existingAwards');
    if (existingAwardsInput) {
        try {
            const existingAwards = JSON.parse(existingAwardsInput.value || '[]');
            existingAwards.forEach(award => {
                createListItem(
                    award.awardName, 
                    `${award.awardDate.replace(/-/g, ".")}`, 
                    award.organizer, 
                    '.result-list-awards',
                    ['awardName[]', 'organizer[]', 'awardDate[]'],
                    award.awardId, // 수상내역의 ID 전달 (필요 시)
                    'award'
                );
            });
        } catch (e) {
            console.error("수상내역 데이터를 파싱하는 중 오류 발생:", e);
        }
    }
}

// ===========================
// 학력 필드 표시 및 비활성화/활성화 함수 통합
// ===========================

function initializeEducationFields() {
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
    if (categorySelect) {
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
    }
}

// ===========================
// 군 복무 상태 처리 함수
// ===========================

function initializeMilitaryStatus() {
    const militarySelect = document.getElementById("military_status");
    const fieldsMap = {
        unfulfilled: document.querySelector(".unfulfilled"),
        exempted: document.querySelector(".EXEMPTED"),
        fulfilled: document.querySelector(".fulfilled"),
        serving: document.querySelector(".serving"),
    };

    if (!militarySelect) {
        console.error("military_status 요소를 찾을 수 없습니다.");
        return;
    }

    // 초기화 - 모든 필드를 숨김
    Object.values(fieldsMap).forEach(field => {
        if (field) field.style.display = "none";
    });

    // 초기 상태 설정 - 현재 선택된 값에 따라 필드 표시
    const selectedValue = militarySelect.value;
    const initialField = fieldsMap[selectedValue];
    if (initialField) {
        initialField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
    }

    // 군 복무 상태 변경 이벤트
    militarySelect.addEventListener("change", function () {
        // 모든 필드를 숨김
        Object.values(fieldsMap).forEach(field => {
            if (field) field.style.display = "none";
        });

        // 선택된 값에 따라 필드 표시
        const selectedField = fieldsMap[this.value];
        if (selectedField) {
            selectedField.style.display = "flex"; // 필요한 경우 display 스타일은 CSS에서 관리 가능
        }
    });
}

// ===========================
// 경력 필드 관리 함수
// ===========================

function initializeCareerFields() {
    const careerCheckbox = document.getElementById("CareerY");
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3");
    const careerFieldset = document.querySelector("fieldset.career");
    const careerLabel = document.querySelector("label.careerYorN");
    const checkboxLabel = careerCheckbox ? careerCheckbox.parentElement : null;

    if (!careerFieldset) {
        console.error("fieldset.career 요소를 찾을 수 없습니다.");
        return;
    }

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
}

// ===========================
// Helper function to capitalize first letter
// ===========================

function capitalizeFirstLetter(string) {
    if (!string) return '';
    return string.charAt(0).toUpperCase() + string.slice(1);
}

// ===========================
// 삭제된 항목 ID를 추가하는 함수
// ===========================

function addDeletedId(type, id) {
    const deletedInput = document.getElementById(`deleted${capitalizeFirstLetter(type)}s`);
    if (!deletedInput) {
        console.error(`deleted${capitalizeFirstLetter(type)}s 요소를 찾을 수 없습니다.`);
        return;
    }

    let deletedIds = deletedInput.value;
    if (deletedIds) {
        deletedIds += ',' + id;
    } else {
        deletedIds = id;
    }
    deletedInput.value = deletedIds;
}

// ===========================
// 리스트 아이템 생성 및 폼에 hidden input 추가 함수
// ===========================

function createListItem(title, details, institution, listSelector, inputNames, id = null, type = 'certificate') {
    const listContainer = document.querySelector(listSelector);
    if (!listContainer) {
        console.error(`리스트 컨테이너 ${listSelector}를 찾을 수 없습니다.`);
        return;
    }

    const listItem = document.createElement('div');
    listItem.className = 'list-item';
    if (id) {
        listItem.setAttribute('data-id', id);
    }

    const itemContent = document.createElement('div');
    itemContent.className = 'item-content';

    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = `<strong>${title}</strong> ${details}`;

    if (institution) {
        const institutionDiv = document.createElement('div');
        institutionDiv.className = 'institution';
        institutionDiv.textContent = `발행처: ${institution}`;
        itemContent.appendChild(institutionDiv);
    }

    itemContent.appendChild(titleDiv);

    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'actions';

    const deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.textContent = '삭제';
    
    // Delete function based on type
    const deleteFunctionName = `remove${capitalizeFirstLetter(type)}`;
    deleteButton.setAttribute('onclick', `${deleteFunctionName}(${id || 'null'})`);

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
        if (name.includes('Name')) {
            hiddenInput.value = title;
        } else if (name.includes('Agency') || name.includes('Organizer')) {
            hiddenInput.value = institution;
        } else if (name.includes('Status')) {
            hiddenInput.value = details.split('|')[0].trim();
        } else if (name.includes('Date')) {
            hiddenInput.value = details.split('|')[1] ? details.split('|')[1].trim().replace(/\./g, '-') : details.trim().replace(/\./g, '-');
        } else if (name.includes('Level')) {
            hiddenInput.value = details.split(',')[1].trim().split('|')[0].trim();
        } else if (name.includes('Type')) {
            hiddenInput.value = details.split(',')[0].trim();
        }
        document.getElementById('resumeForm').appendChild(hiddenInput);
    });

    return listItem;
}

// ===========================
// 자격증, 어학시험, 수상경력 삭제 함수
// ===========================

// 자격증 삭제 함수
function removeCertificate(certificateId) {
    if (certificateId === null) {
        console.error("유효하지 않은 자격증 ID입니다.");
        return;
    }

    // 삭제된 자격증 ID를 hidden input에 추가
    addDeletedId('qualification', certificateId);

    // UI에서 해당 자격증 항목 제거
    const certificateListItem = document.querySelector(`.list-item[data-id="${certificateId}"]`);
    if (certificateListItem) {
        certificateListItem.remove();
    }

    console.log(`Certificate ID ${certificateId} marked for deletion.`);
}

// 어학시험 삭제 함수
function removeLanguageTest(languageTestId) {
    if (languageTestId === null) {
        console.error("유효하지 않은 어학시험 ID입니다.");
        return;
    }

    // 삭제된 어학시험 ID를 hidden input에 추가
    addDeletedId('languageTest', languageTestId);

    // UI에서 해당 어학시험 항목 제거
    const languageTestListItem = document.querySelector(`.list-item[data-id="${languageTestId}"]`);
    if (languageTestListItem) {
        languageTestListItem.remove();
    }

    console.log(`Language Test ID ${languageTestId} marked for deletion.`);
}

// 수상경력 삭제 함수
function removeAward(awardId) {
    if (awardId === null) {
        console.error("유효하지 않은 수상경력 ID입니다.");
        return;
    }

    // 삭제된 수상경력 ID를 hidden input에 추가
    addDeletedId('award', awardId);

    // UI에서 해당 수상경력 항목 제거
    const awardListItem = document.querySelector(`.list-item[data-id="${awardId}"]`);
    if (awardListItem) {
        awardListItem.remove();
    }

    console.log(`Award ID ${awardId} marked for deletion.`);
}

// 전역 접근성 확보
window.removeCertificate = removeCertificate;
window.removeLanguageTest = removeLanguageTest;
window.removeAward = removeAward;

