function displayEducationFields() {
    const selectedEducation = document.getElementById("selectedu").value;

    document.getElementById("elementaryFields").style.display = "none";
    document.getElementById("middleSchoolFields").style.display = "none";
    document.getElementById("highSchoolFields").style.display = "none";
    document.getElementById("collegeFields").style.display = "none";

    if (selectedEducation === "element") {
        document.getElementById("elementaryFields").style.display = "block";
    } else if (selectedEducation === "middle") {
        document.getElementById("middleSchoolFields").style.display = "block";
    } else if (selectedEducation === "high") {
        document.getElementById("highSchoolFields").style.display = "block";
    } else if (selectedEducation === "college") {
        document.getElementById("collegeFields").style.display = "block";
    }
}


document.querySelector('#sk_title1 button').addEventListener('click', function() {
    const input = document.querySelector('.skill_title input');
    const skillValue = input.value.trim();

    if (skillValue) {
        // 해시태그 요소 생성
        const newSkill = document.createElement('div');
        newSkill.className = 'myskill1';
        newSkill.innerHTML = `#${skillValue} <span class="delete-icon">❌</span>`;

        // 삭제 기능 추가
        newSkill.querySelector('.delete-icon').addEventListener('click', function() {
            newSkill.remove();
        });

        // 나의 스킬 영역에 추가
        document.querySelector('#MYsk').appendChild(newSkill);

        // 입력창 초기화
        input.value = '';
    }
});
