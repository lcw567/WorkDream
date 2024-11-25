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
