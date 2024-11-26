document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 데이터베이스에 데이터가 있는지 검사하여 높이 설정
    const skillList = document.querySelectorAll('#skillList .myskill1');
    const skillContainer = document.querySelector('.skill');
    if (skillList.length > 0) {
        // 데이터가 있을 때 높이를 225px로 설정
        skillContainer.style.height = '225px';
        document.getElementById('sk_title2').style.display = 'block';
    } else {
        // 데이터가 없을 때 높이를 175px로 설정
        skillContainer.style.height = '175px';
        document.getElementById('sk_title2').style.display = 'none';
    }
});

function addSkill() {
    const input = document.querySelector('#skillInput');
    const skillValue = input.value.trim();
    
    if (skillValue) {
        // "나의 스킬" 문구와 영역을 보이게 설정
        const skillSection = document.getElementById('sk_title2');
        skillSection.style.display = 'block';

        // 스킬 요소 생성
        const newSkill = document.createElement('div');
        newSkill.className = 'myskill1';
        newSkill.innerHTML = `#${skillValue} <span class="delete-icon" onclick="removeSkill(this)">❌</span>`;

        // 나의 스킬 영역에 추가
        document.querySelector('#skillList').appendChild(newSkill);

        // 입력창 초기화
        input.value = '';

        // .skill 높이를 225px로 변경
        document.querySelector('.skill').style.height = '225px';
    }
}

function removeSkill(element) {
    // 스킬 삭제
    element.parentElement.remove();

    // 스킬이 모두 삭제되면 "나의 스킬" 문구와 높이를 초기화
    if (!document.querySelector('#skillList .myskill1')) {
        document.getElementById('sk_title2').style.display = 'none';
        // .skill 높이를 175px로 변경
        document.querySelector('.skill').style.height = '175px';
    }
}

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


