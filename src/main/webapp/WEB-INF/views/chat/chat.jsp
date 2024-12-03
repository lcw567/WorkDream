<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cs.workdream.member.model.vo.Member" %>
<%
    // 서버 측에서 loginUser 객체를 세션에서 가져옴
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
        // 로그인되지 않은 경우, 로그인 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WorkDream 채팅</title>
    <!-- 외부 CSS 파일 링크 -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chat.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

    <h1>채팅</h1>
    <form id="chat-form">
        메시지: <input type="text" id="msg" required>
        수신자: <input type="text" id="target" required>
        <button type="submit">전송</button>
    </form>
    <div id="msg-container"></div>

    <!-- 현재 사용자의 ID를 서버에서 전달 -->
    <script type="text/javascript">
        const currentUserId = '<c:out value="${loginUser.userId}" />';
        console.log("Current User ID:", currentUserId); // 디버깅 로그
    </script>
    <!-- 외부 JavaScript 파일 링크 -->
    <script src="${pageContext.request.contextPath}/js/chat.js" defer></script>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
