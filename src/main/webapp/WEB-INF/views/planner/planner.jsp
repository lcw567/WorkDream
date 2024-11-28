<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream 플래너</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/main.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/main.bootstrap5.min.css"> <!-- Bootstrap 테마 추가 -->

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/planner.css">

    <!-- FullCalendar JS -->
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/main.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/locales-all.min.js"></script>

    <!-- FullCalendar Plugins -->
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/interaction.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/daygrid.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/timegrid.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/fullcalendar-5.11.5/bootstrap.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/planner.js" defer></script>
    
</head>
<body>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <!-- 사용자 번호와 컨텍스트 패스를 JavaScript 변수로 전달 -->
    <script>
        window.WORKDREAM = window.WORKDREAM || {};
        window.WORKDREAM.contextPath = "${pageContext.request.contextPath}";
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                window.WORKDREAM.currentUserNo = ${sessionScope.loginUser.userNo};
            </c:when>
            <c:otherwise>
                window.WORKDREAM.currentUserNo = null; // 사용자 인증이 필요한 경우 적절한 처리 필요
            </c:otherwise>
        </c:choose>
    </script>

    <!-- 제목 -->
    <div class="text-center my-4">
        <h1 id="planner-title" class="display-4 text-primary">WorkDream 플래너</h1>
    </div>

    <!-- 캘린더 -->
    <div id="calendar"></div>
    
    <!-- 캘린더 사용설명 칸 -->
    <div id="calendar-description">
        <h2>플래너 사용 방법</h2>
        <ul>
            <li>
                <i class="bi bi-calendar-plus"></i>
                <span><strong>날짜 클릭:</strong> 클릭하면 새로운 이벤트를 추가할 수 있습니다.</span>
            </li>
            <li>
                <i class="bi bi-pencil-square"></i>
                <span><strong>이벤트 클릭:</strong> 클릭하면 이벤트를 삭제할 수 있습니다.</span>
            </li>
            <li>
                <i class="bi bi-arrows-move"></i>
                <span><strong>드래그&드롭:</strong> 이벤트를 원하는 날짜로 이동할 수 있습니다.</span>
            </li>
            <li>
                <i class="bi bi-arrows-angle-expand"></i>
                <span><strong>기간 조정:</strong> 이벤트 기간을 조절할 수 있습니다.</span>
            </li>
        </ul>
    </div>
    
    <!-- Modal: 이벤트 추가 -->
	<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="addEventModalLabel">새로운 이벤트 추가</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form id="eventForm">
	                    <div class="mb-3">
	                        <label for="eventTitle" class="form-label">이벤트 제목</label>
	                        <input type="text" class="form-control" id="eventTitle" placeholder="제목을 입력하세요" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="eventDescription" class="form-label">이벤트 내용</label>
	                        <textarea class="form-control" id="eventDescription" rows="3" placeholder="내용을 입력하세요"></textarea>
	                    </div>
	                    <div class="mb-3">
	                        <label for="eventStartDate" class="form-label">시작 날짜</label>
	                        <input type="date" class="form-control" id="eventStartDate" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="eventEndDate" class="form-label">종료 날짜</label>
	                        <input type="date" class="form-control" id="eventEndDate">
	                    </div>
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                <button type="button" class="btn btn-primary" id="saveEventButton">저장</button>
	            </div>
	        </div>
	    </div>
	</div>


    
    <!-- Modal: 이벤트 삭제 확인 -->
    <div class="modal fade" id="deleteEventModal" tabindex="-1" aria-labelledby="deleteEventModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteEventModalLabel">이벤트 삭제</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="deleteEventDetails"></p>
                    <p>이 이벤트를 삭제하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteButton">삭제</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 공통 푸터 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
