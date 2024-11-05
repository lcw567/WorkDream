<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 지원자 목록</title>
	
	<!-- 외부 css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicants.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header_biz.jsp" />

	<!-- 메인 -->
	<main id="applicantsList-main">
		<!-- 지원자 대시보드 -->
		<section id="applicantsList-section-board">
			<article class="postionInfo">
				<h2>자바 웹개발자</h2>
				<div>
					<h4>서류전형 심사</h4>
					<p>2024.10.31 ~ 2024.11.11</p>
					<h5>D - 12</h5>
				</div>
			</article>
			
			<article class="positionStats">
				<div>
					<h6>총 지원수</h6>
					<h1>40</h1>
				</div>
				
				<div>
					<h6>평가 완료</h6>
					<h1>18</h1>
				</div>
				
				<div>
					<h6>최종 합격</h6>
					<h1>0</h1>
				</div>
			</article>
		</section>
		
		<!-- 지원자 목록 -->
		<section id="applicantsList-section-list">
			<!-- 탭, 상단 버튼 -->
			<aside>
				<!-- 탭 -->
				<ul class="list-tab">
					<li class="On"><a href="">전체</a></li>
					<li><a href="">서류전형</a></li>
					<li><a href="">1차면접</a></li>
					<li><a>최종합격</a></li>
				</ul>
				
				<!-- 상단 버튼 -->
				<div class="list-button">
					<!-- 주요 버튼 -->
					<ol class="leftSide">
						<li>
							<select>
								<option value="20" selected>20개</option>
								<option value="50">50개</option>
								<option value="100">100개</option>
							</select>
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_move.png" />&nbsp;전형 이동</button>
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_checked.png" />&nbsp;합격 여부 선택</button>
						</li>
					</ol>
					
					<!-- 기타 -->
					<ol class="rightSide">
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_print.png" />&nbsp;인쇄</button>
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_download.png" />&nbsp;저장</button>&emsp;
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_reset.png" />&nbsp;초기화 |</button>
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_download.png" />&nbsp;검색 |</button>
						</li>
						<li>
							<button><img src="${pageContext.request.contextPath}/img/btn_filter.png" />&nbsp;조건</button>
						</li>
					</ol>
				</div>
			</aside>
			
			<!-- 목록 테이블 -->
			<article>
				<table class="list-table">
					<!-- 상단 -->
					<thead>
						<tr>
							<th>
								<label for="allCheck">
									<input type="checkbox" id="allCheck" />
									<span>&ensp;</span>
								</label>
							</th>
							<th>전형단계</th>
							<th colspan="2">이름 / 나이</th>
							<th>경력</th>
							<th>최종학력</th>
							<th>희망연봉</th>
							<th>지원일</th>
							<th>평가</th>
							<th>합격 여부</th>
						</tr>
					</thead>
					
					<!-- 목록 -->
					<tbody>
						<%--
							[DB 연결 후 수정 사항]
							- 지원자 수만큼 반복(tr)
							- input 속성 일괄 수정 (id, name, value 등)
						--%>
						<tr>
							<td class="btnList">
								<label for="checkbox1">
									<input type="checkbox" id="checkbox1" name="applicantNo" />
									<span>&ensp;</span>
								</label>
								<button><img src="${pageContext.request.contextPath}/img/btn_star_off.png" /></button>
							</td>
							<td>서류전형</td>
							<td class="photo">
								<span></span>
							</td>
							<td class="profile">
								<h1>홍길동</h1>
								<p>30세, 남성</p>
							</td>
							<td>3년</td>
							<td>대학교(4년제) 졸업</td>
							<td>nnn만원</td>
							<td>2024.10.02</td>
							<td>9.3 / 10</td>
							<td class="pass">
								<select>
									<option selected>미분류</option>
									<option>불합격</option>
									<option>합격</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="btnList">
								<label for="checkbox1">
									<input type="checkbox" id="checkbox1" name="applicantNo" />
									<span>&ensp;</span>
								</label>
								<button><img src="${pageContext.request.contextPath}/img/btn_star_on.png" /></button>
							</td>
							<td>서류전형</td>
							<td class="photo">
								<span><img src="${pageContext.request.contextPath}/img/test.jpg" /></span>
							</td>
							<td class="profile">
								<h1>안유진</h1>
								<p>nn세, 여성</p>
							</td>
							<td>3년</td>
							<td>대학교(4년제) 졸업</td>
							<td>nnn만원</td>
							<td>2024.10.02</td>
							<td>9.3 / 10</td>
							<td class="pass">
								<select>
									<option selected>미분류</option>
									<option>불합격</option>
									<option>합격</option>
								</select>
							</td>
						</tr>
					</tbody>
					
					<!-- 페이징바 -->
					<tfoot>
						<tr>
							<th colspan="10">1</th>
						</tr>
					</tfoot>
				</table>
			</article>
		</section>
	</main>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>