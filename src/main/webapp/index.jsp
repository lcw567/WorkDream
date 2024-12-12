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
	 
	 	[css/js/img 리소스 경로 설정!!]
	 	- src/main/resourecs/ 내에서 파일 형식에 따라 분류
	 	- 삽입 경로: ${pageContext.request.contextPath}/폴더명/파일이름.확장자
	 	-> ex) ${pageContext.request.contextPath}/css/common.css
	 	
	 	-!※※※  css/js/img 폴더 경로만 맵핑해둔거라 다른 폴더를 따로 만들면 적용되지 않습니다!!!
	 --%>
	
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<!-- 메인 -->
	<main id="index-main">
		<!-- 메인 메뉴 -->
		<section id="index-section-menu">
			<img src="${pageContext.request.contextPath}/img/banner_serviceCenter.png">
		</section>
		
		<!-- 광고 -->
		<div class="index-ad">
			<img src="${pageContext.request.contextPath}/img/lineBanner.PNG">
		</div>
		
		<!-- 추천 공고 목록 -->
		<section id="index-section-list">
			
			<!-- 일반 공고 -->
			<article id="index-article-commonList">
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="index-appContent">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
			</article>
			
		</section>
		
		<!-- 광고 -->
		<div class="index-ad">
			<img src="${pageContext.request.contextPath}/img/lineBanner.PNG">
		</div>
	</main>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>