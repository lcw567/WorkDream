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
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>(주)도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business4_logo.png">
					</div>
					<h2>메가스터디교육(주)</h2>
					<h3>메가스터디 입시전략연구소 (대입컨설팅센터) 입시컨설턴트 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business10_logo.png">
					</div>
					<h2>씨제이대한통운(주)</h2>
					<h3>[CJ대한통운] 물류 영업 경력사원 모집</h3>
					<span>
						<button>D-11 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business9_logo.png">
					</div>
					<h2>(주)영공조명</h2>
					<h3>㈜영공조명 조명설계 디자이너 경력 및 신입사원 모집</h3>
					<span>
						<button>D-6 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business5_logo.png">
					</div>
					<h2>쿠팡(주)</h2>
					<h3>[쿠팡] 쿠팡 신사업(쿠팡포스) 영업사원 대규모 채용(서울권)</h3>
					<span>
						<button>D-16 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business6_logo.png">
					</div>
					<h2>코웨이(주)</h2>
					<h3>[코웨이]24년 11월 경력직 수시채용(마케팅/경영/인사/연구소)</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business3_logo.png">
					</div>
					<h2>네이버(주)</h2>
					<h3>네이버 인물검색 운영</h3>
					<span>
						<button>D-3 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business8_logo.png">
					</div>
					<h2>금호건설(주)</h2>
					<h3>[금호건설(주)] 강릉회산동공동주택신축현장 건축기사 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business9_logo.png">
					</div>
					<h2>(주)영공조명</h2>
					<h3>㈜영공조명 조명설계 디자이너 경력 및 신입사원 모집</h3>
					<span>
						<button>D-6 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business5_logo.png">
					</div>
					<h2>쿠팡(주)</h2>
					<h3>[쿠팡] 쿠팡 신사업(쿠팡포스) 영업사원 대규모 채용(서울권)</h3>
					<span>
						<button>D-16 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business7_logo.png">
					</div>
					<h2>에이치디현대이엔티(주)</h2>
					<h3>[HD현대이엔티] 2025년 1/4분기 대졸신입 및 경력사원 모집</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business2_logo.png">
					</div>
					<h2>딜로이트컨설팅(유)</h2>
					<h3>[딜로이트 컨설팅] 24년 하반기 각 부문별 컨설턴트 경력직 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business4_logo.png">
					</div>
					<h2>메가스터디교육(주)</h2>
					<h3>메가스터디 입시전략연구소 (대입컨설팅센터) 입시컨설턴트 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business10_logo.png">
					</div>
					<h2>씨제이대한통운(주)</h2>
					<h3>[CJ대한통운] 물류 영업 경력사원 모집</h3>
					<span>
						<button>D-11 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business1_logo.png">
					</div>
					<h2>도화엔지니어링</h2>
					<h3>도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)</h3>
					<span>
						<button>D-3 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business4_logo.png">
					</div>
					<h2>메가스터디교육(주)</h2>
					<h3>메가스터디 입시전략연구소 (대입컨설팅센터) 입시컨설턴트 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business10_logo.png">
					</div>
					<h2>씨제이대한통운(주)</h2>
					<h3>[CJ대한통운] 물류 영업 경력사원 모집</h3>
					<span>
						<button>D-11 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business9_logo.png">
					</div>
					<h2>(주)영공조명</h2>
					<h3>㈜영공조명 조명설계 디자이너 경력 및 신입사원 모집</h3>
					<span>
						<button>D-6 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business5_logo.png">
					</div>
					<h2>쿠팡(주)</h2>
					<h3>[쿠팡] 쿠팡 신사업(쿠팡포스) 영업사원 대규모 채용(서울권)</h3>
					<span>
						<button>D-16 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business8_logo.png">
					</div>
					<h2>금호건설(주)</h2>
					<h3>[금호건설(주)] 강릉회산동공동주택신축현장 건축기사 채용</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business9_logo.png">
					</div>
					<h2>(주)영공조명</h2>
					<h3>㈜영공조명 조명설계 디자이너 경력 및 신입사원 모집</h3>
					<span>
						<button>D-6 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business5_logo.png">
					</div>
					<h2>쿠팡(주)</h2>
					<h3>[쿠팡] 쿠팡 신사업(쿠팡포스) 영업사원 대규모 채용(서울권)</h3>
					<span>
						<button>D-16 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business7_logo.png">
					</div>
					<h2>에이치디현대이엔티(주)</h2>
					<h3>[HD현대이엔티] 2025년 1/4분기 대졸신입 및 경력사원 모집</h3>
					<span>
						<button>D-10 ☆</button>
					</span>
				</div>
				
				<div class="list-common">
					<div class="logo">
						<img src="${pageContext.request.contextPath}/resources/uploads/logos/business2_logo.png">
					</div>
					<h2>딜로이트컨설팅(유)</h2>
					<h3>[딜로이트 컨설팅] 24년 하반기 각 부문별 컨설턴트 경력직 채용</h3>
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