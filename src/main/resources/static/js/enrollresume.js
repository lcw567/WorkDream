function displayEducationFields() {
    const selectedEducation = document.getElementById("selectedu").value;
    const educationLvElement = document.querySelector('.education_Lv'); // .education_Lv 요소를 가져옵니다.

    // 모든 필드를 숨깁니다.
    document.getElementById("elementaryFields").style.display = "none";
    document.getElementById("middleSchoolFields").style.display = "none";
    document.getElementById("highSchoolFields").style.display = "none";
    document.getElementById("collegeFields").style.display = "none";

    // .education_Lv의 height를 초기값인 150px로 설정합니다.
    educationLvElement.style.height = '150px';

    if (selectedEducation === "element") {
        document.getElementById("elementaryFields").style.display = "block";
        educationLvElement.style.height = '300px'; // height를 300px로 변경합니다.
    } else if (selectedEducation === "middle") {
        document.getElementById("middleSchoolFields").style.display = "block";
        educationLvElement.style.height = '300px';
    } else if (selectedEducation === "high") {
        document.getElementById("highSchoolFields").style.display = "block";
        educationLvElement.style.height = '300px';
    } else if (selectedEducation === "college") {
        document.getElementById("collegeFields").style.display = "block";
        educationLvElement.style.height = '300px';
    }
}


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

window.addEventListener('load', function() {
    var selectAwards = document.querySelector('.select_awards');
    var awards2 = document.querySelector('.awards2');
    var awards3 = document.querySelector('.awards3');
    var Language = document.querySelector('.Language');
    var Contest = document.querySelector('.Contest');

    // 페이지 로드 시 모든 섹션 숨기기
    awards2.style.display = 'none';
    awards3.style.display = 'none';
    Language.style.display = 'none';
    Contest.style.display = 'none';
});

document.getElementById('sortation').addEventListener('change', function() {
    var awards2 = document.querySelector('.awards2');
    var awards3 = document.querySelector('.awards3');
    var Language = document.querySelector('.Language');
    var Contest = document.querySelector('.Contest');

    // 선택된 옵션에 따라 관련된 섹션만 표시
    if (this.value === 'certificate') {
        awards2.style.display = 'flex';
        awards3.style.display = 'flex';
        Language.style.display = 'none';
        Contest.style.display = 'none';
    } else if (this.value === 'language') {
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'block';
        Contest.style.display = 'none';
    } else if (this.value === 'award_details') {
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'none';
        Contest.style.display = 'block';
    } else {
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'none';
        Contest.style.display = 'none';
    }
});

// 어학시험 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.language2 button').addEventListener('click', function(event) {
    event.preventDefault();

    const languageTitle = document.querySelector('input[name="language_title"]').value.trim();
    
    // 옵션의 텍스트를 가져옵니다.
    const languageLevelSelect = document.querySelector('select[name="certificate_level"]');
    const languageLevel = languageLevelSelect.options[languageLevelSelect.selectedIndex].textContent;

    const languageCategorySelect = document.querySelector('select[name="lang_category"]');
    const languageCategory = languageCategorySelect.options[languageCategorySelect.selectedIndex].textContent;

    const getDate = document.querySelector('input[name="get_date"]').value;

    // 빈 입력 방지
    if (!languageTitle || !languageLevel || !languageCategory || !getDate) {
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

    // 마우스 오버 시 색상 변경
    deleteButton.addEventListener('mouseover', function() {
        deleteButton.style.color = 'red';
    });
    deleteButton.addEventListener('mouseout', function() {
        deleteButton.style.color = 'black';
    });

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="language_title"]').value = '';
    document.querySelector('select[name="certificate_level"]').value = '';
    document.querySelector('select[name="lang_category"]').value = '';
    document.querySelector('input[name="get_date"]').value = '';
});

// 자격증/면허증 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.awards3 button').addEventListener('click', function(event) {
    event.preventDefault();

    const certificateTitle = document.querySelector('input[name="certificate_title"]').value.trim();
    const institutionTitle = document.querySelector('input[name="institution_title"]').value.trim();
    
    // 선택된 옵션의 텍스트를 가져옵니다.
    var select = document.querySelector('select[name="pass_status"]');
    var passStatus = select.options[select.selectedIndex].textContent;  // 수정된 부분
    
    const passDate = document.querySelector('input[name="pass_date"]').value;

    // 빈 입력 방지
    if (!certificateTitle || !institutionTitle || !passStatus || !passDate) {
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

    // 마우스 오버 시 색상 변경
    deleteButton.addEventListener('mouseover', function() {
        deleteButton.style.color = 'red';
    });
    deleteButton.addEventListener('mouseout', function() {
        deleteButton.style.color = 'black';
    });

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="certificate_title"]').value = '';
    document.querySelector('input[name="institution_title"]').value = '';
    document.querySelector('select[name="pass_status"]').value = '';
    document.querySelector('input[name="pass_date"]').value = '';
});

// 수상내역/공모전 추가하기 버튼에 대한 이벤트 리스너
document.querySelector('.contest2 button').addEventListener('click', function(event) {
    event.preventDefault();

    const contestTitle = document.querySelector('input[name="contest_title"]').value.trim();
    const contestPlace = document.querySelector('input[name="contest_place"]').value.trim();
    const acquireDate = document.querySelector('input[name="acquire_date"]').value;

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

    // 마우스 오버 시 색상 변경
    deleteButton.addEventListener('mouseover', function() {
        deleteButton.style.color = 'red';
    });
    deleteButton.addEventListener('mouseout', function() {
        deleteButton.style.color = 'black';
    });

    // 삭제 기능 추가
    deleteButton.addEventListener('click', function() {
        listItem.remove();
    });

    actionsDiv.appendChild(deleteButton);

    listItem.appendChild(itemContent);
    listItem.appendChild(actionsDiv);

    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="contest_title"]').value = '';
    document.querySelector('input[name="contest_place"]').value = '';
    document.querySelector('input[name="acquire_date"]').value = '';
});






window.addEventListener('load', function() {
    var militarySelect = document.getElementById('military_status');
    console.log('militarySelect:', militarySelect);
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
    
});

document.addEventListener('DOMContentLoaded', function () {
    // 요소 선택
    const registerButton = document.querySelector('.preview');

if (registerButton) {
    registerButton.addEventListener('click', function () {
        window.location.href = `${contextPath}/resume/previewresume`;
    });
}


});
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }

            // 팝업 자동 닫기
            window.setTimeout(function() {
                window.close();
            }, 100); // 100 밀리초 후 팝업 닫기
        }
    }).open();
}

// JavaScript 코드
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

document.addEventListener("DOMContentLoaded", function() {
    const careerCheckbox = document.getElementById("CareerY");
    const careerLabel = document.querySelector("label.careerYorN"); // "경력이 있을 경우 선택해주세요." 라벨
    const checkboxLabel = careerCheckbox.parentElement; // 체크박스를 감싸는 라벨
    const careerFieldset = document.querySelector("fieldset.career"); // 필드셋
    const careerDetails = document.querySelectorAll(".career1, .career2, .career3, .career_Lv"); // 필드셋 내부의 세부 요소들

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




