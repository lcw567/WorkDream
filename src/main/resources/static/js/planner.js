document.addEventListener('DOMContentLoaded', function () {
    console.log('currentUserNo:', WORKDREAM.currentUserNo);
    console.log('contextPath:', WORKDREAM.contextPath);

    if (WORKDREAM.currentUserNo === null || typeof WORKDREAM.currentUserNo === 'undefined') {
        alert('사용자 인증이 필요합니다.');
        return;
    }

    // Helper 함수: 날짜 객체에서 'YYYY-MM-DD' 형식 추출
    function formatDate(dateObj) {
        const year = dateObj.getFullYear();
        const month = String(dateObj.getMonth() + 1).padStart(2, '0');
        const day = String(dateObj.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }

    // Helper 함수: 종료 날짜를 하루 더한 'YYYY-MM-DD' 형식으로 반환
    function getNextDate(dateStr) {
        const date = new Date(dateStr);
        date.setDate(date.getDate() + 1);
        return formatDate(date);
    }

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        timeZone: 'local', // 클라이언트 로컬 시간대 사용
        themeSystem: 'bootstrap',
        initialView: 'dayGridMonth',
        locale: 'ko',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: '' // 오른쪽 버튼 제거
        },
        height: 'auto',
        contentHeight: 900,
        expandRows: true,
        editable: true,
        droppable: true,
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,
        allDayDefault: true, // 모든 이벤트를 올데이로 설정
        allDaySlot: false, // 시간 슬롯 숨기기
        views: {
            dayGridMonth: {
                dayMaxEvents: 2
            }
        },
        // 이벤트 추가 시 선택
        select: function (info) {
            // 기본값 초기화
            document.getElementById('eventTitle').value = '';
            document.getElementById('eventDescription').value = '';

            // 선택한 날짜를 기본 시작 날짜로 설정
            var selectedStartDate = info.startStr; // 'YYYY-MM-DD' 형식

            document.getElementById('eventStartDate').value = selectedStartDate;
            document.getElementById('eventEndDate').value = ''; // 기본 종료 날짜 초기화

            const saveButton = document.getElementById('saveEventButton');

            var modal = new bootstrap.Modal(document.getElementById('addEventModal'));
            modal.show();

            // 이벤트 리스너 중복 방지
            saveButton.replaceWith(saveButton.cloneNode(true));
            const newSaveButton = document.getElementById('saveEventButton');

            newSaveButton.onclick = function () {
                const title = document.getElementById('eventTitle').value.trim();
                const description = document.getElementById('eventDescription').value.trim();
                const startDate = document.getElementById('eventStartDate').value;
                const endDate = document.getElementById('eventEndDate').value;

                if (title === '') {
                    alert('이벤트 제목을 입력해주세요.');
                    return;
                }

                // 시작 날짜 형식 검증
                if (!startDate) {
                    alert('시작 날짜를 선택해주세요.');
                    return;
                }

                // 종료 날짜가 있는 경우 시작 날짜와 비교
                if (endDate && endDate < startDate) {
                    alert('종료 날짜는 시작 날짜보다 앞설 수 없습니다.');
                    return;
                }

                // 종료 날짜를 하루 더한 날짜로 설정 (FullCalendar의 Exclusive end 처리)
                const finalEndDate = endDate ? getNextDate(endDate) : null;

                const newEvent = {
                    userNo: WORKDREAM.currentUserNo,
                    title: title,
                    description: description,
                    startDate: `${startDate}T00:00:00`, // 올데이 이벤트로 설정
                    endDate: finalEndDate ? `${finalEndDate}T00:00:00` : null, // 올데이 종료 날짜 설정 (Exclusive)
                    allDay: true,
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
                    modal.hide();
                    alert('새로운 이벤트가 추가되었습니다!');
                })
                .catch(error => {
                    console.error('Error adding event:', error);
                    alert('이벤트 추가에 실패했습니다.');
                });
            };

            calendar.unselect();
        },
        events: function (fetchInfo, successCallback, failureCallback) {
            fetch(`${WORKDREAM.contextPath}/planner/api/events?userNo=${WORKDREAM.currentUserNo}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const events = data.map(event => ({
                        id: event.eventId,
                        title: event.title,
                        start: event.startDate, // 'YYYY-MM-DDT00:00:00' 형식 (Exclusive end)
                        end: event.endDate,     // 'YYYY-MM-DDT00:00:00' 형식 (Exclusive end)
                        description: event.description,
                        allDay: true
                    }));
                    successCallback(events);
                })
                .catch(error => {
                    console.error('Error fetching events:', error);
                    failureCallback(error);
                });
        },
        eventClick: function (info) {
            // 날짜 정보를 제거하고 제목과 내용만 표시
            const eventDetails = `제목: ${info.event.title}\n내용: ${
                info.event.extendedProps.description || '내용 없음'
            }`;
            document.getElementById('deleteEventDetails').textContent = eventDetails;

            var deleteModal = new bootstrap.Modal(document.getElementById('deleteEventModal'));
            deleteModal.show();

            const confirmDeleteButton = document.getElementById('confirmDeleteButton');
            // 이벤트 리스너 중복 방지
            confirmDeleteButton.replaceWith(confirmDeleteButton.cloneNode(true));
            const newConfirmDeleteButton = document.getElementById('confirmDeleteButton');

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
        eventDrop: function (info) {
            const event = info.event;
            const updatedStartDate = formatDate(event.start); // 'YYYY-MM-DD'
            const updatedEndDate = event.end ? formatDate(event.end) : null; // 'YYYY-MM-DD' (Exclusive)

            // 종료 날짜가 설정되어 있는 경우 그대로 사용 (Exclusive)
            const finalEndDate = updatedEndDate ? updatedEndDate : null;

            const updatedEvent = {
                title: event.title,
                description: event.extendedProps.description,
                startDate: `${updatedStartDate}T00:00:00`,
                endDate: finalEndDate ? `${finalEndDate}T00:00:00` : null,
                allDay: true,
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
                    // 날짜 정보를 제거한 간단한 메시지로 변경
                    alert(`이벤트가 이동되었습니다: ${event.title}`);
                } else {
                    throw new Error('이벤트 이동 실패');
                }
            })
            .catch(error => {
                console.error('Error updating event:', error);
                alert('이벤트 이동에 실패했습니다.');
                info.revert();
            });
        },
        eventResize: function (info) {
            const event = info.event;
            const updatedStartDate = formatDate(event.start); // 'YYYY-MM-DD'
            const updatedEndDate = event.end ? formatDate(event.end) : null; // 'YYYY-MM-DD' (Exclusive)

            // 종료 날짜가 설정되어 있는 경우 그대로 사용 (Exclusive)
            const finalEndDate = updatedEndDate ? updatedEndDate : null;

            const updatedEvent = {
                title: event.title,
                description: event.extendedProps.description,
                startDate: `${updatedStartDate}T00:00:00`,
                endDate: finalEndDate ? `${finalEndDate}T00:00:00` : null,
                allDay: true,
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
                    // 날짜 정보를 제거한 간단한 메시지로 변경
                    alert(`이벤트가 수정되었습니다: ${event.title}`);
                } else {
                    throw new Error('이벤트 수정 실패');
                }
            })
            .catch(error => {
                console.error('Error updating event:', error);
                alert('이벤트 수정에 실패했습니다.');
                info.revert();
            });
        }
    });

    calendar.render();

    function customizeButtons() {
        const prevButton = document.querySelector('.fc-prev-button');
        const nextButton = document.querySelector('.fc-next-button');

        if (prevButton) {
            // 이전 버튼에 Bootstrap Icons의 왼쪽 화살표 아이콘 추가
            prevButton.innerHTML = '<i class="bi bi-chevron-left"></i>';
        }

        if (nextButton) {
            // 다음 버튼에 Bootstrap Icons의 오른쪽 화살표 아이콘 추가
            nextButton.innerHTML = '<i class="bi bi-chevron-right"></i>';
        }

        // '오늘' 버튼은 텍스트로 유지하거나 필요에 따라 아이콘으로 변경 가능
        const todayButton = document.querySelector('.fc-today-button');
        if (todayButton) {
            todayButton.innerHTML = '오늘';
        }
    }

    customizeButtons();
    calendar.on('datesSet', function () {
        customizeButtons();
    });
});
