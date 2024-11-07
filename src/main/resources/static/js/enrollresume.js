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