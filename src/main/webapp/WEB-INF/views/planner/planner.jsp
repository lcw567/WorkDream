<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FullCalendar 테스트</title>

    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/main.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/planner.css">

    <!-- FullCalendar JS -->
    <script src="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/main.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/fullcalendar-5.11.5/locales-all.min.js"></script>

    <!-- Custom JS -->
    <script src="<%=request.getContextPath()%>/js/planner.js" defer></script>
</head>
<body>
    <!-- 공통 헤더 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <h1 style="text-align:center;">FullCalendar 테스트</h1>
    <div id="calendar"></div>

    <!-- 공통 푸터 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
