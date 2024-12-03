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
    <title>WorkDream 채팅</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chat.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="chat-container">
        <div id="msg-container"></div>
        <form id="chat-form">
            <input type="text" id="msg" placeholder="메시지를 입력하세요..." required>
            <input type="text" id="target" placeholder="수신자 ID" required>
            <button type="submit">보내기</button>
        </form>
    </div>
    <script type="text/javascript">
        const currentUserId = '<c:out value="${loginUser.userId}" />';
    </script>
    <script src="${pageContext.request.contextPath}/js/chat.js" defer></script>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
