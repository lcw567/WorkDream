<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jobPostingRegistration.css">

</head>

<body>

	<c:import url="/WEB-INF/views/common/header_biz.jsp" />

	<div id="Job_Posting">
		<div id="Job_Posting_Registration">
			<h2>채용 공고 등록</h2>
		</div>

		<hr>

		<div id="Job_Posting_Registration_content">
			<div id="Job_Posting_Registration_Index">
				<div id="Job_Posting_Registration_Index_One">
					<img src="${pageContext.request.contextPath}/img/icons8-1-24.png">
					<p>기업 정보</p>

					<hr>

					<img src="${pageContext.request.contextPath}/img/icons8-2-48.png">
					<p>공고 정보</p>

				</div>
			</div>

			<div class="Contact_Information">
				<div class="Contact_Information_Title">
					<h2>담당자 정보</h2>
					<b>
						<p style="color: #FE0000; font-weight: 900;">*</p>
					</b>
				</div>
				<p>공고에서 공개되지 않으며, 공고 내용을 검토 하면서 필요 시 관리자가 아래 연락처로 연락드릴 수 있습니다.</p>

				<div id="Contact_Information_Name">
					<h3 style="font-weight: 900; font-size: 1.0rem; color: #A09F9F;">이름</h3>
					<input type="text">
				</div>

				<div id="Contact_Information_Department">
					<h3 style="font-weight: 900; font-size: 1.0rem; color: #A09F9F;">부서</h3>
					<input type="text">
				</div>

				<div id="Contact_Information_Email">
					<h3 style="font-weight: 900; font-size: 1.0rem; color: #A09F9F;">이메일</h3>
					<input type="email">
				</div>

				<div class="Contact_Information">
					<div class="Contact_Information_Title" style="margin-bottom: 8px;">
						<h2>기업 정보</h2>
						<b>
							<p style="color: #FE0000; font-weight: 900;">*</p>
						</b>
					</div>
					<div>
						<div id="Contact_Information_Company_Name">
							<h3 style="font-weight: 900; font-size: 1.0rem; color: #A09F9F;">기업명</h3>
							<!-- DB에서 기업명 정보 가져오기 -->

						</div>
					</div>
				</div>

				<div class="Contact_Information">
					<div class="Contact_Information_Title" style="margin-bottom: 10px;">
						<h2>홈페이지 주소</h2>
						<b>
							<p style="color: #FE0000; font-weight: 900;">*</p>
						</b>
					</div>

					<div id="Website_Address">
						<input type="text" placeholder="https://codesync.com">
						<button type="submit">수정</button>
					</div>
				</div>

				<div class="Contact_Information" style="margin-bottom: 80px;">
					<div class="Contact_Information_Title" style="margin-bottom: 8px;">
						<h2>기업 로고</h2>
						<b>
							<p style="color: #FE0000; font-weight: 900;">*</p>
						</b>
					</div>

					<div id="Company_logo">
						<img
							src="${pageContext.request.contextPath}/img/icons8-img-48.png">
					</div>
					<div id="Company_logo_file">
						<input type="text" placeholder=".png"> <input type="file"
							id="real-file" hidden> <label for="real-file"
							class="custom-file-upload">파일첨부</label>
					</div>
					<p style="color: #000000; font-weight: 900;">* 최소 120 x 120px
						이상, 1MB 이하의 정방형 이미지</p>
				</div>

			</div>

		</div>

		<div id="Job_Posting_division_zones"></div>

		<div class="Next_Or_Back">
			<button class="Cancel_Push">취소</button>
			<button class="Next_Push">다음</button>
		</div>

		<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>

</html>