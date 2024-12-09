/* recruitmentManager.jsp */
const statusLinks = document.querySelectorAll(".status-link a");
const btnRegister = document.getElementById("Registration_Button");
let recruitmentList = [];

// 리스트 출력
function displayRecruitmentList(list) {
    // 기존에 있는 HTML을 초기화
    var html = '';
    $('#Registration_containers').empty();

    if (list && list.length > 0) {
        // 리스트 목록 생성
        list.forEach(function(recruitment) {
            html += '<div class="Registration_First_Container">';

            html += '<div id="Registration_sava_bar">';

            html += '<h5>';
            if(recruitment.status == "T") {
                html += "임시저장";
            } else if(recruitment.status == "P") {
                html += "진행중";
            } else if(recruitment.status == "S") {
                html += "대기중";
            } else {
                html += "마감";
            }
            html += '</h5>';

            html += '<div class="dropdown-container">';
            html += '<button class="dropdown-Button">'
                    + '<img src="' + contextPath + '/img/kebab.png">'
                    + '</button>';
            html += '<ul class="dropdown-menu">';
            html += '<li><a href="">공고 수정</a></li>';
            html += '<li><a href="" onClick="deleteRecruitment(' + recruitment.recuritmentNo + ')">공고 삭제</a></li>';
            if(recruitment.status == "P" || recruitment.status == "E") {
                html += '<li><a href="' + contextPath + '/business/applicantsStatus?no=' + recruitment.recuritmentNo +'">지원자 현황</a></li>';
            }
            html += '</ul>';
            html += '</div>';

            html += '</div>';

            html += '<a id="Recruitment_Status_title" href="#">' + (recruitment.title || '제목없는 공고') + '</a>';
            html += '<div id="Recruitment_Status_Calender">'
            + '<img src="' + contextPath + '/img/calendar-blank.png">'
            + '<h6>' + (recruitment.startDate || '공고시작일 미지정') + ' ~ ' + (recruitment.deadline || '공고마감일 미지정') + '</h6>'
            + '</div>';

            html += '</div>';
        });
    } else {
        html += '<h4>해당되는 공고가 없습니다.</h4>';
    }

    // 출력
    $('#Registration_containers').append(html);
};

// 진행중인 공고 목록 불러오기
async function loadProgressList() {
    try {
        const resultList = await $.ajax({
            url: contextPath + '/business/progressRecuritment.biz',
            type: 'GET',
            dataType: 'json'
        });
        displayRecruitmentList(resultList);
    } catch (error) {
        alert('공고 목록을 불러오는 데 실패했습니다. 다시 시도해주세요.');
        console.log(error);
    }
}

// 대기중인 공고 목록 불러오기
async function loadStandByList() {
    try {
        const resultList = await $.ajax({
            url: contextPath + '/business/standByRecuritment.biz',
            type: 'GET',
            dataType: 'json'
        });
        displayRecruitmentList(resultList);
    } catch (error) {
        alert('공고 목록을 불러오는 데 실패했습니다. 다시 시도해주세요.');
        console.log(error);
    }
}

// 임시저장한 공고 목록 불러오기
async function loadTemporaryList() {
    try {
        const resultList = await $.ajax({
            url: contextPath + '/business/temporaryRecuritment.biz',
            type: 'GET',
            dataType: 'json'
        });
        displayRecruitmentList(resultList);
    } catch (error) {
        alert('공고 목록을 불러오는 데 실패했습니다. 다시 시도해주세요.');
        console.log(error);
    }
}

// 마감된 공고 목록 불러오기
async function loadEndList() {
    try {
        const resultList = await $.ajax({
            url: contextPath + '/business/endRecuritment.biz',
            type: 'GET',
            dataType: 'json'
        });
        displayRecruitmentList(resultList);
    } catch (error) {
        alert('공고 목록을 불러오는 데 실패했습니다. 다시 시도해주세요.');
        console.log(error);
    }
}

// 탭 변경 및 목록 새로 불러오기
statusLinks.forEach((link, index) => {
    link.addEventListener("click", (event) => {
        event.preventDefault();

        // 모든 링크의 'active' 클래스 제거
        statusLinks.forEach(link => link.classList.remove("active"));

        // 클릭된 링크에 'active' 클래스 추가
        event.currentTarget.classList.add("active");

        // 탭 인덱스에 따라 목록 변경
        switch(index) {
            case 0:
                loadProgressList();
                break;
            case 1:
                loadStandByList();
                break;
            case 2:
                loadTemporaryList();
                break;
            default:
                loadEndList();
        }
    });
});

// 채용공고 등록 버튼 클릭 시 공고 작성 페이지로 이동
try {
    btnRegister.addEventListener("click", () => {
        location.href = contextPath + "/business/recruitmentRegister";
    });
} catch (error) {  // error를 catch 블록에서 정의
    console.log("recruitmentManager btnRegister.addEventListener : " + error);
}

// 공고 드롭다운 메뉴 펼치기
$(document).on('click', '.dropdown-Button', function(event) {
    event.stopPropagation();  // 이벤트 전파 방지
    var correspondingMenu = $(this).next('.dropdown-menu'); // 각 버튼에 대응하는 메뉴

    // 클릭한 버튼의 메뉴 표시/숨기기
    correspondingMenu.toggle();

    // 다른 모든 메뉴 닫기
    $(".dropdown-menu").not(correspondingMenu).hide();
});

// 드롭다운 메뉴 외부 클릭 시 모든 메뉴 닫기
$(document).click(function(event) {
    // 클릭된 대상이 .dropdown-Button 또는 .dropdown-menu 내부에 있지 않으면 모든 메뉴 닫기
    if (!$(event.target).closest('.dropdown-Button').length && !$(event.target).closest('.dropdown-menu').length) {
        $(".dropdown-menu").hide();
    }
});

// 공고 삭제를 위한 AJAX 함수
function ajaxDeleteRecruitment(no) {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: contextPath + '/business/deleteRecruitment.biz?no=' + no,
            type: 'GET',
            dataType: 'json',
            success: function(result) {
                if (result === 1) {
                    resolve(result);  // 삭제 성공 시 resolve
                } else {
                    reject('삭제 실패: 서버에서 0을 반환했습니다.');  // 실패 시 reject
                }
            },
            error: function(error) {
                reject('AJAX 요청 실패: ' + error);  // 요청 실패 시 reject
            }
        });
    });
}

// 공고 삭제 함수
async function deleteRecruitment(no) {
    var result = confirm("삭제하시겠습니까? 삭제 후에는 복구할 수 없습니다.");
    if(result) {
        try {
            const response = await ajaxDeleteRecruitment(no); // 비동기적으로 AJAX 결과 기다리기
            if(response === 1) {  // 응답이 1이면 삭제 성공
                alert("삭제되었습니다.");
                window.location.href = window.location.href;
            }
        } catch(error) {
            alert(error);  // 실패한 경우, reject에서 전달된 메시지 출력
            console.log(error);
        }
    }
}

// 초기 설정
document.addEventListener("DOMContentLoaded", async function() {
    // 진행중인 공고 목록 불러오기 (ajax 요청)
    await loadProgressList();

    // 탭 초기화 및 진행중 탭 활성화
    statusLinks.forEach(link => link.classList.remove("active"));
    statusLinks[0].classList.add("active");
});