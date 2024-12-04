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
        }
        else if (Array.from(checkboxes).every(chk => !chk.checked)) {
            allCheck.checked = false;
            allCheck.indeterminate = false;
        }
        else {
            allCheck.checked = false;
            allCheck.indeterminate = true;
        }
    });
});

// 그룹 추가, 이동, 삭제
const popupSection = document.getElementById("bookmark-popup");
const popupList = popupSection.querySelectorAll("div");

// 팝업 닫기 (공용)
function colseGroup() {
    popupSection.classList.remove("show");
    popupList.forEach(item => {
        item.classList.remove('show');
    });
}

// 그룹 추가
function addGroup() {
    const popup = popupSection.querySelector("#bookmark-popup-group");
    const btnClose = popup.querySelector(".btnClose");

    popupSection.classList.add("show");
    popup.classList.add("show");

    btnClose.addEventListener("click", function() {
        colseGroup();
    });

    popupSection.addEventListener("click", function(event) {
        if(event.target == popupSection) {
            colseGroup();
        }
    });
}

// 그룹 삭제
function subGroup() {
    const checkedCount = Array.from(checkboxes).filter(checkbox => checkbox.checked).length;

    if(checkedCount > 0 && confirm(checkedCount + "개의 목록을 해당 그룹에서 삭제하시겠습니까?")) {
         alert("삭제되었습니다.");
    }
    else {
        alert("삭제할 항목을 선택해주세요.");
    }
}