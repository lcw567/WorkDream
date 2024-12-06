document.addEventListener("DOMContentLoaded", function() {

    // 기존의 모든 JavaScript 코드들을 여기 안으로 이동
    // 예: displayEducationFields, 스킬 추가 기능, 자격증 추가 기능 등

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
                activeSection.style.display = 'block';
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

}); // DOMContentLoaded 끝

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

document.getElementById('resumeY').addEventListener('change', function() {
    var hiddenField = document.querySelector('input[name="resumeStatusHidden"]');
    if (this.checked) {
        hiddenField.value = 'Y';
    } else {
        hiddenField.value = 'N';
    }
});


document.addEventListener("DOMContentLoaded", function () {
    const selectPortButton = document.querySelector(".select_port");
    const modal = document.getElementById("modal");
    const closeButtons = document.querySelectorAll(".close");
    const portfolioListDiv = document.getElementById("portfolio-list");
    const selectedPortDiv = document.querySelector(".selected_port");
    
    // 디버깅용 로그: contextPath 확인
    console.log('Context Path:', contextPath);
    
    selectPortButton.addEventListener("click", function () {
        // 이력서 ID를 가져옵니다. (현재 페이지에서 이력서 ID를 관리하고 있다고 가정)
        // 필요 시 이력서 ID를 fetch URL에 포함하거나, 서버에서 세션 등을 통해 관리할 수 있습니다.
    
        fetch(`${contextPath}/resume/getPortfolios`, {
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
    
                        const label = document.createElement("label");
                        label.htmlFor = `portfolio-${portfolio.portfolioId}`;
                        label.textContent = portfolio.title;
    
                        portfolioItem.appendChild(checkbox);
                        portfolioItem.appendChild(label);
    
                        // 체크박스 상태 변경 시 처리
                        checkbox.addEventListener('change', function() {
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
    selectedPortDiv.addEventListener('click', function(event) {
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


