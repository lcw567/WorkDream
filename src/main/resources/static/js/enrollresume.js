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
    selectAwards.style.height = '500px';
    awards2.style.display = 'none';
    awards3.style.display = 'none';
    Language.style.display = 'none';
    Contest.style.display = 'none';
});

document.getElementById('sortation').addEventListener('change', function() {
    var selectAwards = document.querySelector('.select_awards');
    var awards2 = document.querySelector('.awards2');
    var awards3 = document.querySelector('.awards3');
    var Language = document.querySelector('.Language');
    var Contest = document.querySelector('.Contest');

    if (this.value === 'certificate') {
        // '자격증/면허증' 선택 시 관련 영역 표시
        selectAwards.style.height = '315px';
        awards2.style.display = 'flex';
        awards3.style.display = 'flex';
        Language.style.display = 'none';
        Contest.style.display = 'none';
    } else if (this.value === 'language') {
        // '어학시험' 선택 시 관련 영역 표시
        selectAwards.style.height = '315px';
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'block';
        Contest.style.display = 'none';
    } else if (this.value === 'award_details') {
        // '수상내역/공모전' 선택 시 관련 영역 표시
        selectAwards.style.height = '290px';
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'none';
        Contest.style.display = 'block';
    } else {
        // 다른 선택 시 모두 숨기기
        selectAwards.style.height = '500px';
        awards2.style.display = 'none';
        awards3.style.display = 'none';
        Language.style.display = 'none';
        Contest.style.display = 'none';
    }
});

document.querySelector('.awards3 button').addEventListener('click', function() {
    // 입력 필드에서 값 가져오기
    var certificateTitle = document.querySelector('input[name="certificate_title"]').value.trim();
    var institutionTitle = document.querySelector('input[name="institution_title"]').value.trim();
    var passStatus = document.getElementById('pass_menu').value;
    var passDate = document.querySelector('input[name="pass_date"]').value;

    // 빈 입력 방지
    if (!certificateTitle || !institutionTitle || !passStatus || !passDate) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    // 새로운 항목을 생성
    var listItem = document.createElement('div');
    listItem.classList.add('list-item');
    listItem.innerHTML = `
        <div>
            <strong>${certificateTitle}</strong> (${passStatus}) | ${passDate.replace(/-/g, ".")}
            <div>${institutionTitle}</div>
        </div>
        <div class="actions">
            <button class="edit">✏️</button>
            <button class="delete">🗑️</button>
        </div>
    `;

    // 리스트에 항목 추가
    document.querySelector('.result-list').appendChild(listItem);

    // 입력 필드 초기화
    document.querySelector('input[name="certificate_title"]').value = '';
    document.querySelector('input[name="institution_title"]').value = '';
    document.getElementById('pass_menu').value = '';
    document.querySelector('input[name="pass_date"]').value = '';

    // select_awards 높이 조정
    var selectAwards = document.querySelector('.select_awards');
    selectAwards.style.height = selectAwards.scrollHeight + "px";

    // 삭제 버튼 이벤트 핸들러 추가
    listItem.querySelector('.delete').addEventListener('click', function() {
        listItem.remove();
        selectAwards.style.height = selectAwards.scrollHeight + "px"; // 높이 재조정
    });

    // 수정 버튼 이벤트 핸들러 추가
    listItem.querySelector('.edit').addEventListener('click', function() {
        // 기존 값 가져오기
        var currentTitle = listItem.querySelector('strong').textContent;
        var currentInstitution = listItem.querySelector('div:nth-of-type(2)').textContent;
        var currentPassStatus = passStatus;
        var currentPassDate = passDate;

        // 입력 필드에 기존 값 설정
        document.querySelector('input[name="certificate_title"]').value = currentTitle;
        document.querySelector('input[name="institution_title"]').value = currentInstitution;
        document.getElementById('pass_menu').value = currentPassStatus;
        document.querySelector('input[name="pass_date"]').value = currentPassDate;

        // 기존 항목 삭제
        listItem.remove();

        // select_awards 높이 조정
        selectAwards.style.height = selectAwards.scrollHeight + "px";
    });
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