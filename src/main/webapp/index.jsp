<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | HOME</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
</head>
<body>
	<%--
		[개발 환경]
		- 톰캣 버젼 9.0.95 + jdk 1.8 사용
		- 프로젝트 경로: C:\WorkDream (※필수X)
		
		- git 버젼 충돌을 최소화 하기위해, 'views' 폴더 안에 각자 따로 폴더를 생성 후 그쪽에서 작업해주세요.
		(ex. views/ajy)
		- 모든 파일명은 영어로 작성, 시작은 소문자입니다. 합성어의 경우엔 두번째 단어의 시작이 대문자입니다.
		(ex. login.jsp, mypage.jsp, postingDetail.jsp 등)
		- 되도록 직관적인 이름으로 지어야 차후 다른 사람이 수정하기 편합니다.
	
		[Header 및 Footer]
		- JSP 파일에 JSTL 사용이 포함되어있어야합니다.
		- 현재 페이지에 있는 <c:import> 태그를 <body> 최상단과 최하단에 복붙해서 넣기 -> 끝!
		- !※※※ <c:import> 태그를 다른 태그로 감싸지 마세요 (오류!!)
		(ex.
				<div id="wrap">
					<c:import> // 금지!
					// 그밖의 다른 코드들
				</div>
		)
		
		[CSS 및 JS]
		- common.css, 제이쿼리 라이브러리는 <head>에 포함시킬 필요X (파일에 포함되어있음)
		- class와 id의 이름은 되도록 겹치지 않도록 할 것 (파일을 합치는 과정에서 복수명이 많으면 오류가 발생할 확률↑ + 수정 시간 증가)
		=> class는 복수 개체 / id는 단일 개체에 주로 사용한다는 점을 염두에 두기
		(css는 id가 우선 적용이란 점도 생각해두기 -> #id-name{}가 .class-name{}보다 우선 적용됨)
		- 파일을 다 따로 만들지 말고 관련 페이지끼리는 묶어주세요 (ex. 마이페이지와 관련된 css 및 js -> mypage.css + mypage.js 파일 하나로 통일)
	 
	 	[css/js/img 리소스 경로 설정!!]
	 	- src/main/resourecs/ 내에서 파일 형식에 따라 분류
	 	- 삽입 경로: ${pageContext.request.contextPath}/폴더명/파일이름.확장자
	 	-> ex) ${pageContext.request.contextPath}/css/common.css
	 	
	 	-!※※※  css/js/img 폴더 경로만 맵핑해둔거라 다른 폴더를 따로 만들면 적용되지 않습니다!!!
	 --%>
	
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	서버 연결 성공.
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>