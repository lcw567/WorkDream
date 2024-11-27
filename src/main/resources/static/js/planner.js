document.addEventListener('DOMContentLoaded', function () {
    // 변수 값 확인 (디버깅 용도)
    console.log('currentUserNo:', WORKDREAM.currentUserNo);
    console.log('contextPath:', WORKDREAM.contextPath);

    if (WORKDREAM.currentUserNo === null || typeof WORKDREAM.currentUserNo === 'undefined') {
        alert('사용자 인증이 필요합니다.');
        return;
    }

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
        events: function(fetchInfo, successCallback, failureCallback) {
            fetch(`${WORKDREAM.contextPath}/planner/api/events?userNo=${WORKDREAM.currentUserNo}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    successCallback(data.map(event => ({
                        id: event.eventId,
                        title: event.title,
                        start: event.startDate,
                        end: event.endDate,
                        description: event.description,
                        allDay: true
                    })));
                })
                .catch(error => {
                    console.error('Error fetching events:', error);
                    failureCallback(error);
                });
        },

        // 날짜 클릭 시 이벤트 추가
        dateClick: function (info) {
            document.getElementById('eventTitle').value = '';
            document.getElementById('eventDescription').value = '';
            const saveButton = document.getElementById('saveEventButton');

            // 모달 표시
            var modal = new bootstrap.Modal(document.getElementById('addEventModal'));
            modal.show();

            // 기존 이벤트 핸들러 제거 (중복 방지)
            saveButton.replaceWith(saveButton.cloneNode(true));
            const newSaveButton = document.getElementById('saveEventButton');

            // 이벤트 저장 버튼 클릭 시
            newSaveButton.onclick = function () {
                const title = document.getElementById('eventTitle').value.trim();
                const description = document.getElementById('eventDescription').value.trim();

                if (title === '') {
                    alert('이벤트 제목을 입력해주세요.');
                    return;
                }

                const newEvent = {
                    userNo: WORKDREAM.currentUserNo,
                    title: title,
                    description: description,
                    startDate: info.dateStr,
                    status: 'Y'
                };

                fetch(`${WORKDREAM.contextPath}/planner/api/events`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(newEvent)
                })
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(text => { throw new Error(text) });
                    }
                    return response.json();
                })
                .then(data => {
                    calendar.addEvent({
                        id: data.eventId,
                        title: data.title,
                        start: data.startDate,
                        end: data.endDate,
                        description: data.description,
                        allDay: true
                    });
                    modal.hide(); // 모달 닫기
                    alert('새로운 이벤트가 추가되었습니다!');
                })
                .catch(error => {
                    console.error('Error adding event:', error);
                    alert('이벤트 추가에 실패했습니다.');
                });
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

            // 기존 이벤트 핸들러 제거 (중복 방지)
            const confirmDeleteButton = document.getElementById('confirmDeleteButton');
            confirmDeleteButton.replaceWith(confirmDeleteButton.cloneNode(true));
            const newConfirmDeleteButton = document.getElementById('confirmDeleteButton');

            // 삭제 확인 버튼 클릭 시 이벤트 삭제
            newConfirmDeleteButton.onclick = function () {
                const eventId = info.event.id;

                fetch(`${WORKDREAM.contextPath}/planner/api/events/${eventId}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if (response.ok) {
                        info.event.remove();
                        deleteModal.hide();
                        alert('이벤트가 삭제되었습니다.');
                    } else {
                        throw new Error('이벤트 삭제 실패');
                    }
                })
                .catch(error => {
                    console.error('Error deleting event:', error);
                    alert('이벤트 삭제에 실패했습니다.');
                });
            };
        },

        // 이벤트 드래그 앤 드롭 처리
        eventDrop: function (info) {
            const event = info.event;
            const updatedEvent = {
                title: event.title,
                description: event.extendedProps.description,
                startDate: event.start.toISOString().split('T')[0], // 날짜만 추출
                endDate: event.end ? event.end.toISOString().split('T')[0] : null,
                status: 'Y'
            };

            fetch(`${WORKDREAM.contextPath}/planner/api/events/${event.id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(updatedEvent)
            })
            .then(response => {
                if (response.ok) {
                    alert(`이벤트가 이동되었습니다:\n${event.title}\n새 날짜: ${event.start.toISOString().split('T')[0]}`);
                } else {
                    throw new Error('이벤트 이동 실패');
                }
            })
            .catch(error => {
                console.error('Error updating event:', error);
                alert('이벤트 이동에 실패했습니다.');
                info.revert(); // 변경 사항 되돌리기
            });
        },

        // 이벤트 기간 조정 처리
        eventResize: function (info) {
            const event = info.event;
            const updatedEvent = {
                title: event.title,
                description: event.extendedProps.description,
                startDate: event.start.toISOString().split('T')[0], // 날짜만 추출
                endDate: event.end ? event.end.toISOString().split('T')[0] : null,
                status: 'Y'
            };

            fetch(`${WORKDREAM.contextPath}/planner/api/events/${event.id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(updatedEvent)
            })
            .then(response => {
                if (response.ok) {
                    alert(`이벤트가 수정되었습니다:\n${event.title}\n새 기간: ${event.start.toISOString().split('T')[0]} ~ ${event.end ? event.end.toISOString().split('T')[0] : '없음'}`);
                } else {
                    throw new Error('이벤트 수정 실패');
                }
            })
            .catch(error => {
                console.error('Error updating event:', error);
                alert('이벤트 수정에 실패했습니다.');
                info.revert(); // 변경 사항 되돌리기
            });
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
