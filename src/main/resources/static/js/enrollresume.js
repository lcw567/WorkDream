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

window.onload = function() {
    var selectAwards = document.querySelector('.select_awards');
    var awards2 = document.querySelector('.awards2');
    var awards3 = document.querySelector('.awards3');
    
    // 페이지 로드 시 awards2와 awards3 숨기기
    selectAwards.style.height = '145px';
    awards2.style.display = 'none';
    awards3.style.display = 'none';
};

document.getElementById('sortation').addEventListener('change', function() {
    var selectAwards = document.querySelector('.select_awards');
    var awards2 = document.querySelector('.awards2');
    var awards3 = document.querySelector('.awards3');

    if (this.value !== "") {
        selectAwards.style.height = '300px';
        awards2.style.display = 'flex';
        awards3.style.display = 'flex';
    } else {
        selectAwards.style.height = '145px';
        awards2.style.display = 'none';
        awards3.style.display = 'none';
    }
});
