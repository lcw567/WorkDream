/* bookmark.jsp */

// 체크박스 전체 선택&해제
const allCheck = document.getElementById("allCheck");
const checkboxes = document.querySelectorAll(".list-table td input[type='checkBox']");

allCheck.addEventListener('change', function() {
    checkboxes.forEach(checkbox => {
        checkbox.checked = allCheck.checked;
    })
});

checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
        if (Array.from(checkboxes).every(chk => chk.checked)) {
            allCheck.checked = true;
            allCheck.indeterminate = false;
        } else if (Array.from(checkboxes).every(chk => !chk.checked)) {
            allCheck.checked = false;
            allCheck.indeterminate = false;
        } else {
            allCheck.checked = false;
            allCheck.indeterminate = true;
        }
    });
});