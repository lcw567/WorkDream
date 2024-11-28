<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/portfolioDashboard.css">
<script src="${pageContext.request.contextPath}/js/portfolioDashboard.js" defer></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<h1>포트폴리오관리</h1>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
