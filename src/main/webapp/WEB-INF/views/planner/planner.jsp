<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FullCalendar 테스트</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/main.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/planner.css">

    <!-- FullCalendar JS -->
    <script src="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/main.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/locales-all.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- Custom JS -->
    <script src="<%=request.getContextPath()%>/js/planner.js" defer></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/planner.css">
    
</head>
<body>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <!-- 제목 -->
    <div class="text-center my-4">
        <h1 id="planner-title" class="display-4 text-primary">WorkDream 플래너</h1>
    </div>

    <!-- 캘린더 -->
    <div id="calendar"></div>
    
    <!-- 캘린더 사용설명 칸 -->
    <div id="calendar-description">
        <h2>캘린더 사용 방법</h2>
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
                <span><strong>기간 조정:</strong> 이벤트 기간을 늘리거나 줄일 수 있습니다.</span>
            </li>
            <li>
                <i class="bi bi-eye"></i>
                <span><strong>뷰 전환:</strong> 월별, 주별, 일별 보기로 전환 가능합니다.</span>
            </li>
        </ul>
    </div>

    <!-- 공통 푸터 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
