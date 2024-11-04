<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/enrollresume.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
        <div id="inner">
            <div class="resume_title">
                <h1>이력서 제목</h1> <input type="text" placeholder="이력서의 제목을 입력해주세요.">
            </div>
            <div class="Info">
                <fieldset class="basic_info">
                    <legend class="b_Info">기본정보</legend>
                    <div id="basic1">
                        <fieldset class="name">
                            <legend class="username">이름*</legend>
                            <input type="text" name="username">
                        </fieldset>
                        <fieldset class="gender">
                            <select name="usergender" id="selectgender">
                                <option value="male">남</option>
                                <option value="female">여</option>
                            </select>
                        </fieldset>
                        <fieldset class="birthday">
                            <legend class="userbirth">생년월일*</legend>
                            <input type="date">
                        </fieldset>
                    </div>
                    <div id="basic2">  
                        <fieldset class="email">
                            <legend class="useremail">이메일*</legend>
                            <input type="email" name="useremail">
                        </fieldset>
                        <button class="email_check">인증</button>
                    </div>
                    <div id="basic3">  
                        <fieldset class="phone">
                            <legend class="userphone">전화번호*</legend>
                            <input type="text" name="userphone">
                        </fieldset>
                        <button class="phone_check">인증</button>
                    </div>
                    <div id="basic4">
                        <fieldset class="address">
                            <legend class="useraddress">주소*</legend>
                            <input type="text" name="useraddress" placeholder="주소를 입력해주세요.">
                        </fieldset>
                        <fieldset class="dtaddress">
                            <legend class="userdtaddress">상세주소*</legend>
                            <input type="text" name="userdtaddress" placeholder="상세주소를 입력해주세요.">
                        </fieldset>
                    </div>
                </fieldset>
            </div>
        </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>