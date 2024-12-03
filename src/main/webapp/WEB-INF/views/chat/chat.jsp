<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cs.workdream.member.model.vo.Member" %>
<%
    Member loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WorkDream 메신저</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chat.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="app-container">
        <div id="app-title">WorkDream 메신저</div>
        <div id="chat-app">
            <!-- 채팅 목록 -->
            <div id="chat-sidebar">
                <h3>사용자 목록</h3>
                <ul id="chat-list"></ul>
                <button id="add-user-btn">사용자 추가</button>
            </div>


            <!-- 메시지 창 -->
            <div id="chat-container">
                <div id="status-indicator" class="offline">Offline</div>
                <div id="msg-container"></div>
                <form id="chat-form">
                    <input type="text" id="msg" placeholder="메시지를 입력하세요..." required>
                    <button type="submit">보내기</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        const currentUserId = '<c:out value="${loginUser.userId}" />';
    </script>
    <script src="${pageContext.request.contextPath}/js/chat.js" defer></script>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>

