<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 구직자 즐겨찾기</title>
	
	<!-- 외부 css 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookmark.css">
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
								<button>선택 삭제</button>
							</th>
							<th><b>|</b></th>
							<th colspan="2">
								<button><img src="${pageContext.request.contextPath}/img/btn_folder_add.png"> 그룹 추가</button>
								<button><img src="${pageContext.request.contextPath}/img/btn_folder_sub.png"> 그룹 삭제</button>
								<button><img src="${pageContext.request.contextPath}/img/btn_setting.png"> 그룹 관리</button>
							</th>
							<th>
								<button><img src="${pageContext.request.contextPath}/img/btn_print.png"> 인쇄</button>
								<button><img src="${pageContext.request.contextPath}/img/btn_download.png"> 저장</button>
							</th>
							<th>|</th>
							<th>
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
						<tr>
							<td>
								<label for="checkbox1">
									<input type="checkbox" id="checkbox1" name="applicantNo" />
									<span>&ensp;</span>
								</label>
							</td>
							<td colspan="2">
								<span class="photo"></span>
								<span class="profile">김아무개</span>
							</td>
							<td>
								<button><img src="${pageContext.request.contextPath}/img/btn_folder.png" /> 미분류</button>
							</td>
							<td>지원일 2024.11.05</td>
							<td>
								<button><img src="${pageContext.request.contextPath}/img/btn_preview.png" /> 이력서 열람</button>
							</td>
							<td colspan="2">
								<button><img src="${pageContext.request.contextPath}/img/btn_call.png" /></button>
								<button><img src="${pageContext.request.contextPath}/img/btn_mail.png" /></button>
								<button><img src="${pageContext.request.contextPath}/img/btn_chat.png" /></button>
							</td>
						</tr>
					</tbody>
				</table>
			</article>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>