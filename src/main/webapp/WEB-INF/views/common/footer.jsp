<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Footer</title>
	
	<!-- jQuery -->
    <script 
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script
        src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js"
        integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM="
        crossorigin="anonymous"></script>
	
	<!-- 외부 css 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
	<footer>
		    <div class="footer_header">
        <ul class="footer_title">
            <li class="footer_content"><a href="" class="btn">회사소개</a></li>
            <li class="footer_content"><a href="" class="btn">인재채용</a></li>
            <li class="footer_content"><a href="" class="btn">회원약관</a></li>
            <li class="footer_content"><a href="" class="btn">개인정보처리방침</a></li>
            <li class="footer_content"><a href="" class="btn">이메일무단수정거부</a></li>
            <li class="footer_content"><a href="" class="btn">고객센터</a></li>
        </ul>
        <div class="footer_inner">
            <a href="" class="btn"><img src="${pageContext.request.contextPath}/img/logo_icon.png" alt="" class="logo_icon"></a>
            <div class="content">
                <p class="content">
                    사람인 고객센터 02-2025-4733 (평일 09:00~19:00, 주말·공휴일 휴무)
                    <br>
                    이메일 : help@workdream.co.kr, Fax : 02-6937-0039(대표), 02-6937-0035(세금계산서) 
                </p>
                <p>
                    (주)워크드림, 우 : 08378, 강남구 테헤란로 34길 43, 3층, 대표 : kh정보교육원
                    <br>
                    사업자등록 : 113-86-00917, 직업정보제공사업 : 서울 관악 제 2005-6호, 통신판매업 : 제 2005-02339호
                    <br>
                    Copyright (c) (주)사람인. All rights reserved.
                </p>
            </div>
        </div>
    </div>
	</footer>
</body>
</html>