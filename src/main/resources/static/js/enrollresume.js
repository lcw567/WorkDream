document.addEventListener("DOMContentLoaded", function() {

    // 학력 필드 표시 및 비활성화/활성화 함수
    function displayEducationFields() {
        const selectedEdu = document.getElementById("selectedu").value;
        const educationLvElement = document.querySelector('.education_Lv'); // .education_Lv 요소

        if (educationLvElement) {
            // 초기 높이 설정
            educationLvElement.style.height = '150px';
        }

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
            case "초등학교":
                activeSectionId = "elementaryFields";
                break;
            case "중학교":
                activeSectionId = "middleSchoolFields";
                break;
            case "고등학교":
                activeSectionId = "highSchoolFields";
                break;
            case "대학교/대학원 이상 졸업":
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
                if (educationLvElement) {
                    educationLvElement.style.height = '300px';
                }
            }
        }
    }

    // 학력 필드 초기 상태 설정 및 이벤트 리스너 등록
    const selecteduElement = document.getElementById('selectedu');
    if (selecteduElement) {
        selecteduElement.addEventListener('change', displayEducationFields);
        // 초기 설정
        displayEducationFields();
    }

    // 스킬 배열을 선언
    let skills = [];

    // 스킬 추가 버튼 처리
    const skTitle1Button = document.querySelector('#sk_title1 button');
    if (skTitle1Button) {
        skTitle1Button.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지

            const input = document.querySelector('.skill_title input');
            if (!input) {
                console.error("스킬 입력 필드를 찾을 수 없습니다.");
                return;
            }
            const skillValue = input.value.trim();

            if (skillValue) {
                // "나의 스킬" 문구와 영역을 보이게 설정
                const skTitle2 = document.getElementById('sk_title2');
                if (skTitle2) {
                    skTitle2.style.display = 'block';
                }

                // 스킬 요소 생성
                const newSkill = document.createElement('div');
                newSkill.className = 'myskill1';
                newSkill.innerHTML = `#${skillValue} <span class="delete-icon">❌</span>`;

                // 삭제 기능 추가
                const deleteIcon = newSkill.querySelector('.delete-icon');
                if (deleteIcon) {
                    deleteIcon.addEventListener('click', function() {
                        // 스킬 삭제 시 배열에서도 제거
                        skills = skills.filter(skill => skill !== skillValue);
                        newSkill.remove();

                        // 스킬이 모두 삭제되면 "나의 스킬" 문구와 높이를 초기화
                        const mySk = document.querySelector('#MYsk');
                        if (mySk && !mySk.querySelector('.myskill1')) {
                            const skillContainer = document.querySelector('.skill');
                            if (skillContainer) {
                                skillContainer.style.height = '175px';
                            }
                            if (skTitle2) {
                                skTitle2.style.display = 'none'; // "나의 스킬" 숨김
                            }
                        }
                    });
                }

                // 나의 스킬 영역에 추가
                const mySk = document.querySelector('#MYsk');
                if (mySk) {
                    mySk.appendChild(newSkill);
                } else {
                    console.error("나의 스킬 영역 (#MYsk)을 찾을 수 없습니다.");
                }

                // 높이를 230px로 변경
                const skillContainer = document.querySelector('.skill');
                if (skillContainer) {
                    skillContainer.style.height = '230px';
                }

                // 입력창 초기화
                input.value = '';

                // 스킬을 배열에 저장
                skills.push(skillValue);
            }
        });
    }

    // 폼 제출 시 모든 스킬을 하나의 문자열로 합쳐서 hidden input에 저장
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function(event) {
            // 스킬 배열을 쉼표로 구분된 문자열로 합침
            const skillNameInput = document.querySelector('input[name="skillName"]');
            if (skillNameInput) {
                skillNameInput.value = skills.join(', ');
            } else {
                console.error("skillName hidden input을 찾을 수 없습니다.");
            }

            // AJAX 요청으로 서버에 스킬 저장하기
            const xhr = new XMLHttpRequest();
            const contextPath = ''; // contextPath를 정의하거나, 서버에서 전달
            xhr.open('POST', `${contextPath}/resume/addSkill`, true);
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        console.log('Skills added successfully');
                    } else {
                        console.error('Failed to add skills');
                    }
                }
            };

            // 서버에 보낼 데이터 생성
            const skillData = {
                skillName: skills.join(', ')
            };
            // JSON 형식으로 데이터 전송
            xhr.send(JSON.stringify(skillData));
        });
    }

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

    // 프로필 이미지 업로드 기능
    const imageContainer = document.querySelector('#basic5');
    if (imageContainer) {
        const img = imageContainer.querySelector('.profile_img');
        const fileInput = imageContainer.querySelector('.profile_upload');

        if (img && fileInput) {
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
                    const pageContext = {
                        request: {
                            contextPath: '' // contextPath를 정의하거나, 서버에서 전달
                        }
                    };
                    img.src = `${pageContext.request.contextPath}/img/file.png`; // 기본 이미지로 복귀
                }
            });
        }
    }

    // 다움 주소 검색
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

    // 카테고리 선택 처리
    const categorySelect = document.getElementById('sortation');
    const categoryFields = {
        '자격증/면허증': [document.getElementById('certificateFields'), document.getElementById('certificateDate')],
        '어학시험': [document.getElementById('languageFields')],
        '수상내역/공모전': [document.getElementById('awardDetailsFields')],
    };

    if (categorySelect) {
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
    }

    // 자격증 추가하기
    const addQualificationButton = document.querySelector('.addQualificationButton');
    if (addQualificationButton) {
        addQualificationButton.addEventListener('click', function (event) {
            event.preventDefault();

            const certificateFields = document.getElementById('certificateFields');
            const certificateDateFields = document.getElementById('certificateDate');

            if (!certificateFields || !certificateDateFields) {
                console.error("certificateFields 또는 certificateDate 요소를 찾을 수 없습니다.");
                return;
            }

            const qualificationName = certificateFields.querySelector('input[name="qualificationName[]"]').value.trim();
            const issuingAgency = certificateFields.querySelector('input[name="issuingAgency[]"]').value.trim();
            const passStatusSelect = certificateFields.querySelector('select[name="passStatus[]"]');
            const passStatusText = passStatusSelect ? passStatusSelect.options[passStatusSelect.selectedIndex].textContent.trim() : '';
            const testDate = certificateDateFields.querySelector('input[name="testDate_cer[]"]').value;

            // 빈 값 체크
            if (!qualificationName || !issuingAgency || !passStatusText || !testDate) {
                alert("모든 필드를 입력해주세요.");
                return;
            }

            // 리스트에 추가
            createListItem(
                qualificationName,
                `${passStatusText} | ${testDate.replace(/-/g, ".")}`,
                issuingAgency,
                '.result-list-certificate',
                ['qualificationName[]', 'issuingAgency[]', 'passStatus[]', 'testDate_cer[]']
            );
            console.log("자격증 추가 완료!");

            // 입력 필드 초기화
            certificateFields.querySelector('input[name="qualificationName[]"]').value = '';
            certificateFields.querySelector('input[name="issuingAgency[]"]').value = '';
            if (passStatusSelect) passStatusSelect.value = '';
            certificateDateFields.querySelector('input[name="testDate_cer[]"]').value = '';
        });
    }

    // 어학시험 추가하기
    const addLanguageButton = document.querySelector('.addLanguageButton');
    if (addLanguageButton) {
        addLanguageButton.addEventListener('click', function (event) {
            event.preventDefault();

            const languageFields = document.getElementById('languageFields');
            if (!languageFields) {
                console.error("languageFields 요소를 찾을 수 없습니다.");
                return;
            }

            const languageName = languageFields.querySelector('input[name="languageName[]"]').value.trim();
            const proficiencyLevelSelect = languageFields.querySelector('select[name="proficiencyLevel[]"]');
            const proficiencyLevel = proficiencyLevelSelect ? proficiencyLevelSelect.options[proficiencyLevelSelect.selectedIndex].textContent.trim() : '';
            const languageTypeSelect = languageFields.querySelector('select[name="languageType[]"]');
            const languageType = languageTypeSelect ? languageTypeSelect.options[languageTypeSelect.selectedIndex].textContent.trim() : '';
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
                ['languageName[]', 'proficiencyLevel[]', 'languageType[]', 'issueDate[]']
            );
            console.log("어학시험 추가 완료!");

            // 입력 필드 초기화
            languageFields.querySelector('input[name="languageName[]"]').value = '';
            if (proficiencyLevelSelect) proficiencyLevelSelect.value = '';
            if (languageTypeSelect) languageTypeSelect.value = '';
            languageFields.querySelector('input[name="issueDate[]"]').value = '';
        });
    }

    // 수상내역 추가하기
    const addAwardButton = document.querySelector('.addAwardButton');
    if (addAwardButton) {
        addAwardButton.addEventListener('click', function (event) {
            event.preventDefault();

            const awardFields = document.getElementById('awardDetailsFields');
            if (!awardFields) {
                console.error("awardDetailsFields 요소를 찾을 수 없습니다.");
                return;
            }

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
    }

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
            const resumeForm = document.getElementById('resumeForm');
            if (resumeForm) {
                resumeForm.appendChild(hiddenInput);
            } else {
                console.error("resumeForm 요소를 찾을 수 없습니다.");
            }
        });

        return listItem;
    }

    // 군사 상태 선택 처리
    const militaryStatusSelect = document.getElementById('military_status');
    if (militaryStatusSelect) {
        militaryStatusSelect.addEventListener('change', function () {
            const selectedValue = this.value;
            const parentDiv = this.closest('.pre2'); // 해당 select의 상위 pre2 div 찾기

            if (!parentDiv) return; // parentDiv가 없으면 종료

            // 관련 필드 요소 선택 (id를 사용)
            const unfulfilled = parentDiv.querySelector('#unfulfilledFields');
            const exempted = parentDiv.querySelector('#exemptedFields');
            const fulfilled = parentDiv.querySelector('#fulfilledFields');
            const serving = parentDiv.querySelector('#servingFields');

            // 모든 필드 숨기기
            if (unfulfilled) unfulfilled.style.display = 'none';
            if (exempted) exempted.style.display = 'none';
            if (fulfilled) fulfilled.style.display = 'none';
            if (serving) serving.style.display = 'none';

            // 선택한 값에 따라 해당 필드 표시
            switch(selectedValue) {
                case '미필':
                    if (unfulfilled) unfulfilled.style.display = 'flex';
                    break;
                case '면제':
                    if (exempted) exempted.style.display = 'flex';
                    break;
                case '군필':
                    if (fulfilled) fulfilled.style.display = 'flex';
                    break;
                case '복무중':
                    if (serving) serving.style.display = 'flex';
                    break;
                default:
                    // '대상아님' 또는 기타 선택 시 아무 것도 표시하지 않음
                    break;
            }
        });
    }
