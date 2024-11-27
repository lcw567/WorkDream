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
        editable: true,
        droppable: true,
        events: [],

        // 날짜 클릭 시 이벤트 추가
        dateClick: function (info) {
            document.getElementById('eventTitle').value = '';
            document.getElementById('eventDescription').value = '';
            const saveButton = document.getElementById('saveEventButton');

            // 모달 표시
            var modal = new bootstrap.Modal(document.getElementById('addEventModal'));
            modal.show();

            // 이벤트 저장 버튼 클릭 시
            saveButton.onclick = function () {
                const title = document.getElementById('eventTitle').value;
                const description = document.getElementById('eventDescription').value;

                if (title) {
                    calendar.addEvent({
                        title: title,
                        start: info.dateStr,
                        description: description,
                        allDay: true
                    });
                    modal.hide(); // 모달 닫기
                    alert('새로운 이벤트가 추가되었습니다!');
                } else {
                    alert('이벤트 제목을 입력해주세요.');
                }
            };
        },

        // 이벤트 클릭 시 상세보기 및 삭제 모달 표시
        eventClick: function (info) {
            const eventDetails = `제목: ${info.event.title}\n내용: ${
                info.event.extendedProps.description || '내용 없음'
            }`;
            document.getElementById('deleteEventDetails').textContent = eventDetails;

            // 삭제 확인 모달 표시
            var deleteModal = new bootstrap.Modal(document.getElementById('deleteEventModal'));
            deleteModal.show();

            // 삭제 확인 버튼 클릭 시 이벤트 삭제
            document.getElementById('confirmDeleteButton').onclick = function () {
                info.event.remove();
                deleteModal.hide();
                alert('이벤트가 삭제되었습니다.');
            };
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
