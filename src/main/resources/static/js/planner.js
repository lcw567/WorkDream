document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        themeSystem: 'bootstrap',
        initialView: 'dayGridMonth',
        locale: 'ko',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        height: 'auto',
        contentHeight: 900,
        expandRows: true,
        editable: true, // 드래그 앤 드롭 활성화
        droppable: true, // 외부에서 드래그 가능한 요소 활성화 (옵션)
        events: [], // 예제 이벤트 제거 (빈 배열)

        // 날짜 클릭 시 이벤트 추가
        dateClick: function (info) {
            var title = prompt('새로운 이벤트 제목을 입력하세요:');
            if (title) {
                calendar.addEvent({
                    title: title,
                    start: info.dateStr,
                    allDay: true
                });
                alert('새로운 이벤트가 추가되었습니다!');
            }
        },

        // 이벤트 클릭 시 삭제
        eventClick: function (info) {
            var action = confirm('이 이벤트를 삭제하시겠습니까?');
            if (action) {
                info.event.remove();
                alert('이벤트가 삭제되었습니다!');
            }
        },

        // 이벤트 드래그 앤 드롭 처리
        eventDrop: function (info) {
            alert(`이벤트가 이동되었습니다:\n${info.event.title}\n새 날짜: ${info.event.start.toISOString()}`);
        },

        // 이벤트 기간 조정 처리
        eventResize: function (info) {
            alert(`이벤트가 수정되었습니다:\n${info.event.title}\n새 기간: ${info.event.start.toISOString()} ~ ${info.event.end.toISOString()}`);
        }
    });

    calendar.render();

    // 버튼 텍스트와 아이콘 설정 함수
    function customizeButtons() {
        const todayButton = document.querySelector('.fc-today-button');
        if (todayButton) {
            todayButton.innerHTML = '오늘';
        }

        const prevButton = document.querySelector('.fc-prev-button');
        if (prevButton) {
            prevButton.innerHTML = '<i class="bi bi-chevron-left"></i>';
        }

        const nextButton = document.querySelector('.fc-next-button');
        if (nextButton) {
            nextButton.innerHTML = '<i class="bi bi-chevron-right"></i>';
        }
    }

    customizeButtons();

    calendar.on('datesSet', function () {
        customizeButtons();
    });
});
