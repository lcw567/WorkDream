<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 구직자 즐겨찾기</title>
	
	<!-- 외부 css / js 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/businessBookmark.css">
	<script src="${pageContext.request.contextPath}/js/businessBookmark.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header_biz.jsp" />

	<!-- 메인 -->
	<main id="bookmark-main">
		<!-- 즐겨찾기 목록 -->
		<section>
			<!-- 그룹 탭 -->
			<ul id="bookmark-section-tab">
				<li class="On">전체 (48)</li>
				<li>보류 (25)</li>
				<li>스카웃 예정 (3)</li>
				<li>그룹3 (10)</li>
			</ul>
			
			<!-- 주의 문구 -->
			<aside id="bookmark-aside-caution">
				<img src="${pageContext.request.contextPath}/img/icon_caution.png" />
				<p>개인정보보호법에 따라 입사 지원자의 정보는 채용 이외의 용도로는 사용할 수 없습니다.</p>
				<a href="">가이드라인 보러가기 &gt;</a>
			</aside>
			
			<!-- 목록 -->
			<article id="bookmark-article-list">
				<table class="list-table">
					<!-- 기능 버튼 -->
					<thead>
						<tr>
							<th>
								<label for="allCheck">
									<input type="checkbox" id="allCheck" />
									<span></span>
								</label>
							</th>
							<th colspan="4">
								<button>선택 삭제</button>
								<b>&emsp;&#124;&emsp;</b>
								<button onClick="addGroup()"><img src="${pageContext.request.contextPath}/img/btn_folder_add.png"> 그룹 추가</button>
								<button onClick="subGroup()"><img src="${pageContext.request.contextPath}/img/btn_folder_sub.png"> 그룹 삭제</button>
								<button><img src="${pageContext.request.contextPath}/img/btn_setting.png"> 그룹 관리</button>
								<b>&emsp;&#124;&emsp;</b>
								<button><img src="${pageContext.request.contextPath}/img/btn_print(black).png"> 인쇄</button>
								<button><img src="${pageContext.request.contextPath}/img/btn_save(black).png"> 저장</button>
							</th>
							<th colspan="2">
								<select>
									<option value="20">20개</option>
									<option value="30">30개</option>
									<option value="50">50개</option>
								</select>
								
								<select>
									<option>추가순</option>
									<option>이름순</option>
									<option>오래된순</option>
								</select>
							</th>
						</tr>
					</thead>
					
					<!-- 구직자 목록 -->
					<tbody>
						<c:forEach var="bookmark" items="${bookmarkList}">
							<tr>
								<td>
									<label for="${bookmark.resumeNo}">
										<input type="checkbox" id="${bookmark.resumeNo}" name="resumeNo" />
										<span>&ensp;</span>
									</label>
								</td>
								<td>
									<span class="photo">
										<c:if test="${not empty bookmark.picture}">
										    <img src="${bookmark.picture}">
										</c:if>
									</span>
								</td>
								<td>
									<span class="profile">${bookmark.name}</span>
								</td>
								<td>
									<c:choose>
										<%-- 그룹 미분류 --%>
									    <c:when test="${bookmark.folder == '미분류'}">
									        <button class="no-group" onClick="addGroup()"><img src="${pageContext.request.contextPath}/img/btn_folder_none.png" /> 미분류</button>
									    </c:when>
									    
									    <%-- 그룹 분류 있음 --%>
									    <c:otherwise>
									        <button><img src="${pageContext.request.contextPath}/img/btn_folder_none.png" /> ${bookmark.folder}</button>
									    </c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<%-- 지원 이력 있음 --%>
										<c:when test='${bookmark.applicantHistory == "Y"}'>
											지원일 ${bookmark.applicantDate}
										</c:when>
										
										<%-- 지원 이력 없음 --%>
										<c:otherwise>
											지원 이력 없음
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<button><img src="${pageContext.request.contextPath}/img/btn_preview.png" /> 이력서 열람</button>
								</td>
								<td colspan="2">
									<button disabled><img src="${pageContext.request.contextPath}/img/btn_call.png" /></button>
									<button><img src="${pageContext.request.contextPath}/img/btn_mail.png" /></button>
									<button><img src="${pageContext.request.contextPath}/img/btn_chat.png" /></button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</section>
	</main>
	
	<%-- 팝업 영역 --%>
	<section id="bookmark-popup">
		<!-- 그룹 지정 -->
		<div id="bookmark-popup-group">
			테스트
			<button class="btnClose">X</button>
		</div>
	</section>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>