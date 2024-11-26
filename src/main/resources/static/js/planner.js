document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko', // 한국어 설정
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true, // 드래그&드롭 가능
        selectable: true, // 날짜 클릭 활성화
        events: [
            { title: '예제 이벤트 1', start: '2024-12-01' },
            { title: '예제 이벤트 2', start: '2024-12-07', end: '2024-12-10' },
            { title: '예제 이벤트 3', start: '2024-12-09T12:30:00' }
        ],
        dateClick: function(info) {
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
        eventClick: function(info) {
            var action = confirm('이 이벤트를 삭제하시겠습니까?');
            if (action) {
                info.event.remove();
                alert('이벤트가 삭제되었습니다!');
            }
        },
        eventDrop: function(info) {
            alert(`이벤트가 이동되었습니다: ${info.event.title}`);
        },
        eventResize: function(info) {
            alert(`이벤트가 수정되었습니다: ${info.event.title}`);
        }
    });

    calendar.render();
});
