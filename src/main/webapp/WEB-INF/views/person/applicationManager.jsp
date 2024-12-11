<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이력서 관리</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- css / js -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicationManager.css">
	<script>var activeNo = 5;</script>
	<script src="${pageContext.request.contextPath}/js/resumeDashboard.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    
        <div class="manage_main">
            <div class="main_header">
                <div class="supporter">
                    <div class="supporter_inner">
                        <h2>100</h2>
                        <h2>지원완료</h2>
                    </div>
                </div>
                <div class="open">
                    <div class="open_inner">
                        <h2>98</h2>
                        <h2>열람</h2>
                    </div>
                </div>
                <div class="not_open">
                    <div class="not_open_inner">
                        <h2>0</h2>
                        <h2>미열람</h2>
                    </div>
                </div>
                <div class="cancle">
                    <div class="cancle_inner">
                        <h2>93</h2>
                        <h2>지원취소</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="list_main">
            <div class="list_title">
                <h1>지원 목록</h1>
            </div>
            <div class="list">
                <div class="list_header">
                    <div class="list_inner1">No</div>
                    <div class="list_inner2">지원일</div>
                    <div class="list_inner3">지원내역</div>
                    <div class="list_inner4">지원방법</div>
                    <div class="list_inner5">이력서열람</div>
                    <div class="list_inner6">상태</div>
                </div>
                <div class="list_content1">
                    <div class="content1">
                        <div class="content1_inner1">5</div>
                        <div class="content1_inner2">2024.06.28(~12/12)</div>
                        <div class="content1_inner3">인크루트(주) 서비스운영본부 ->웹기획</div>
                        <div class="content1_inner4">이메일</div>
                        <div class="content1_inner5">미열람</div>
                        <div class="content1_inner6">심사중</div>
                    </div>
                </div>
                <div class="list_content2">
                    <div class="content2">
                        <div class="content2_inner1">4</div>
                        <div class="content2_inner2">2024.06.28(~12/12)</div>
                        <div class="content2_inner3">인크루트(주) 서비스운영본부 ->웹기획</div>
                        <div class="content2_inner4">이메일</div>
                        <div class="content2_inner5">미열람</div>
                        <div class="content2_inner6">심사중</div>
                    </div>
                </div>
                <div class="list_content3">
                    <div class="content3">
                        <div class="content3_inner1">3</div>
                        <div class="content3_inner2">2024.06.28(~12/12)</div>
                        <div class="content3_inner3">인크루트(주) 서비스운영본부 ->웹기획</div>
                        <div class="content3_inner4">이메일</div>
                        <div class="content3_inner5">미열람</div>
                        <div class="content3_inner6">심사중</div>
                    </div>
                </div>
                <div class="list_content4">
                    <div class="content4">
                        <div class="content4_inner1">2</div>
                        <div class="content4_inner2">2024.06.28(~12/12)</div>
                        <div class="content4_inner3">인크루트(주) 서비스운영본부 ->웹기획</div>
                        <div class="content4_inner4">이메일</div>
                        <div class="content4_inner5">미열람</div>
                        <div class="content4_inner6">심사중</div>
                    </div>
                </div>
                <div class="list_content5">
                    <div class="content5">
                        <div class="content5_inner1">1</div>
                        <div class="content5_inner2">2024.06.28(~12/12)</div>
                        <div class="content5_inner3">인크루트(주) 서비스운영본부 ->웹기획</div>
                        <div class="content5_inner4">이메일</div>
                        <div class="content5_inner5">미열람</div>
                        <div class="content5_inner6">심사중</div>
                    </div>
                </div>
            </div>
        </div>
        
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>