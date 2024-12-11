<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchPage.css">
			<script src="${pageContext.request.contextPath}/js/searchPage.js" defer></script>
		</head>

		<body>
			<c:import url="/WEB-INF/views/common/header_biz.jsp" />

			<div id="Job_Posting">
				<div id="searchHeader">
					<input type="text" placeholder="검색어를 입력하세요.">
					<button><img src="${pageContext.request.contextPath}/img/btn_search.png"></button>
				</div>


				<hr style="border: 1px solid #4E21A8; margin-bottom: 25px; margin-left: 15px; margin-right: 15px;">

				<div id="searchedKeyword">
					<div class="Initialization">
						<pre>검색어 > </pre>
						<pre>input 입력값  </pre>
						<button>X</button>
					</div>
					<div class="Initialization">
						<pre>선택초기화 </pre>
						<img src="${pageContext.request.contextPath}/img/icons8-왼쪽-회전-업데이트-50.png">
					</div>
				</div>

				<div id="searchFind">
					<img src="${pageContext.request.contextPath}/img/icons8-search-24.png">
					<pre>검색어 "[<!--input 입력값-->]" 에 대한 <!--n-->개의 웹페이지 결과를 찾았습니다.</pre>
				</div>

				<div id="searchSection">
					<button id="contentSearch">내용 검색</button>
					<button id="recruitmentSearch">채용정보</button>
					<button id="corporateSearch">기업정보</button>
				</div>

				<div id="recruitmentInformation">
					<div id="recruitmentCategory">
						<p>채용정보</p>
						<div id="recruitmentDropDown">

							<div class="dropdown">
								<button class="dropbtn" style="width: 150px;">
									<span class="dropbtn_icon">
										<pre>기업형태 전체 ▼</pre>
									</span>
								</button>

								<div class="dropdown-content" style="min-width : 150px;">
									<a href="#">기업형태 전체</a>
									<a href="#">대기업</a>
									<a href="#">외국계</a>
									<a href="#">중견•중소</a>
									<a href="#">공사•공기업</a>
								</div>
							</div>

							<div class="dropdown">
								<button class="dropbtn" style="width: 100px;">
									<span class="dropbtn_icon">
										<pre>관련도순 ▼</pre>
									</span>
								</button>

								<div class="dropdown-content" style="min-width : 100px;">
									<a href="#">관련도순</a>
									<a href="#">정확도순</a>
									<a href="#">등록일순</a>
									<a href="#">수정일순</a>
									<a href="#">마감일순</a>
									<a href="#">지원자순</a>
									<a href="#">사원수순</a>
								</div>
							</div>

							<div class="dropdown">
								<button class="dropbtn" style="width: 80px;">
									<span class="dropbtn_icon">
										<pre>40개씩 ▼</pre>
									</span>
								</button>

								<div class="dropdown-content" style="min-width : 100px;">
									<a href="#">10개씩</a>
									<a href="#">20개씩</a>
									<a href="#">30개씩</a>
									<a href="#">40개씩</a>
									<a href="#">50개씩</a>
									<a href="#">80개씩</a>
									<a href="#">100개씩</a>
								</div>
							</div>
						</div>
					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="recruitmentContentAll">
						<div class="recruitmentContent">
							<div class="recruitmentContentTitle">
								<h1>산업용 마킹기 영업부 정규직 채용</h1>
								<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
								<p>~ 01/10(금)</p>
							</div>

							<div class="recruitmentContentSubTitle">
								<p>경기 군포시 | 신입•경력 | 초대졸 이상 | 정규직</p>
							</div>

						</div>



						<div class="recruitmentContentCompany">
							<h1>(주) 제이원</h1>
							<img src="${pageContext.request.contextPath}/img/btn_star_off.png">
							<button>기업정보</button>
						</div>

						<div class="recruitmentContentSkill">
							<p>영업,기술영업, 기타재조업 | 수정일 24/11/15</p>
						</div>

						<hr>

					</div>

					<div class="pageview">
						<div id="pageCountInterval">
							<button class="pageviewCount">
								<p>1</p>
							</button>
							<button class="pageviewCount">
								<p>2</p>
							</button>
							<button class="pageviewCount">
								<p>3</p>
							</button>
							<button class="pageviewCount">
								<p>4</p>
							</button>
							<button class="pageviewCount">
								<p>5</p>
							</button>
							<button class="pageviewCount">
								<p>6</p>
							</button>
							<button class="pageviewCount">
								<p>7</p>
							</button>
							<button class="pageviewCount">
								<p>8</p>
							</button>
							<button class="pageviewCount">
								<p>9</p>
							</button>
							<button class="pageviewCount">
								<p>10</p>
							</button>

							<button style="border: none; background-color: white; font-size: 16px; margin-left: 10px;">다음 ></button>
						</div>
					</div>
				</div>
			</div>

			<c:import url="/WEB-INF/views/common/footer.jsp" />
		</body>

		</html>