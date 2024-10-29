<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | HOME</title>
</head>
<body>
	<%--
		[파일 및 폴더 생성]
		- - 톰캣 버젼 9.0.95 + jdk 1.8 사용
		- git 버젼 충돌을 최소화 하기위해, 'views' 폴더 안에 각자 따로 폴더를 생성 후 그쪽에서 작업해주세요.
		(ex. views/ajy)
		- 모든 파일명은 영어로 작성, 시작은 소문자입니다. 합성어의 경우엔 두번째 단어의 시작이 대문자입니다.
		(ex. login.jsp, mypage.jsp, postingDetail.jsp 등)
		- 되도록 직관적인 이름으로 지어야 차후 다른 사람이 수정하기 편합니다.
	
		[Header 및 Footer]
		- 파일 따로 만든 후 jsp:include로 페이지 최상단과 최하단에 넣기
		- !※※※ include 태그를 다른 태그로 감싸지 마세요 (CSS 오류 발생)
		(ex.	<div id="wrap">
					<jsp:include>
					// 그밖의 다른 코드들
				</div>
		)
		
		[CSS 및 JS]
		- index.css, 제이쿼리 라이브러리는 <head>에 포함시킬 필요X (header 파일에 포함되어있음)
		- class와 id의 이름은 되도록 겹치지 않도록 할 것 (파일을 합치는 과정에서 복수명이 많으면 오류가 발생할 확률↑ + 수정 시간 증가)
		=> class는 복수 개체 / id는 단일 개체에 주로 사용한다는 점을 염두에 두기
		(css는 id가 우선 적용이란 점도 생각해두기 -> #id-name{} 다음에 .class-name{}이 적용됨)
		- 파일을 다 따로 만들지 말고 관련 페이지끼리는 묶어주세요 (ex. 마이페이지와 관련된 css 및 js -> mypage.css + mypage.js 파일 하나로 통일)
		
		[아맞다!!!]
		- 페이지 간 이동이 있는 곳마다 <a> 태그 달았던가?
		=> 페이지를 만들 예정이 없더라도 일단 넣을 것. a 태그의 존재유무에 따라 차후 css 수정이 달라집니다. (href는 "#"으로 통일)
		- img 사이즈 조정 했던가?
		=> css로 지정해두지 않으면 나중에 아주 재미있는 일이 일어날 수 있으므로 꼭 확인해둡시다
		- <input> 태그에 제대로 name 속성을 지정해놨던가?
		=> 꼭!! 확인하기!!! input은 모두 name 속성을 쓰지 않더라도 필수로 적어둘것!
	 --%>
	 
	<h2>개발환경 버전</h2><hr>
	<span>서버  </span>: 
	<%=application.getServerInfo() %><br>
	<span>서블릿  </span>: 
	<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %><br>
	<span>JSP  </span>: 
	<%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
	
	<c:import url="/views/common/header.jsp" />
	
	<c:import url="/views/common/footer.jsp" />
</body>
</html>