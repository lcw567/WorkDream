<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityPost.css">
    <script src="${pageContext.request.contextPath}/js/communityPost.js" defer></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="post-container">
    <!-- 카테고리 선택 -->
    <div class="category-select">
        <label for="category"><h4>카테고리</h4></label>
        <select id="category">
            <option value="신입">신입</option>
            <option value="채용공고">채용공고</option>
            <option value="취준">취준</option>
            <option value="자소서">자소서</option>
            <option value="자격증">자격증</option>
            <option value="Q&A">Q&A</option>
            <option value="커리어">커리어</option>
            <option value="이직">이직</option>
            <option value="잡담">잡담</option>
            <option value="면접">면접</option>
        </select>
    </div>

    <!-- 제목 입력 -->
    <div class="title-input">
        <input type="text" placeholder="제목을 입력해주세요">
    </div>

    <!-- 내용 입력 -->
    <div class="content-input">
        <textarea placeholder="내용을 입력해주세요"></textarea>
        <p class="content-guidelines">
            - 저작권 침해, 음란, 상습적 유해물, 기타 허락받지 않은 게시물은 경고 없이 삭제됩니다.
        </p>
    </div>

    <!-- 이미지 첨부 -->
    <div class="image-upload">
    <label>
        <input type="file" accept="image/*" style="display: none;" id="imageInput">
	        📷 이미지 첨부
	    </label>
	</div>
	
	<div class="image-preview" id="imagePreview">
	    <!-- 선택한 이미지 미리보기로 표시 -->
	</div>


    <!-- 해시태그 입력 -->
    <div class="hashtag-input">
        <label style= "font-size: 1.3rem;"># 해시태그 입력</label>
        <div class="hashtag-box">
            <input type="text" placeholder="입력 (최대 5개)">
        </div>
    </div>

    <!-- 직무 카테고리 선택 (단일 선택 가능) -->
    <div class="job-category-container">
	    <label style="font-size: 1.3rem; font-weight: bold;">#관련 직무 선택</label>
	    <table class="job-category-table">
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="기획·전략"> 기획·전략</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="마케팅·홍보·조사"> 마케팅·홍보·조사</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="회계·세무·재무"> 회계·세무·재무</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="인사·노무·HRD"> 인사·노무·HRD</label></td>
	        </tr>
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="총무·법무·사무"> 총무·법무·사무</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="IT개발·데이터"> IT개발·데이터</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="디자인"> 디자인</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="영업·판매·무역"> 영업·판매·무역</label></td>
	        </tr>
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="고객상담·TM"> 고객상담·TM</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="구매·자재·물류"> 구매·자재·물류</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="상품기획·MD"> 상품기획·MD</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="운전·운송·배송"> 운전·운송·배송</label></td>
	        </tr>
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="서비스"> 서비스</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="생산"> 생산</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="건설·건축"> 건설·건축</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="의료"> 의료</label></td>
	        </tr>
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="연구·R&D"> 연구·R&D</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="교육"> 교육</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="미디어·문화·스포츠"> 미디어·문화·스포츠</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="금융·보험"> 금융·보험</label></td>
	        </tr>
	        <tr>
	            <td><label><input type="checkbox" class="job-checkbox" name="job" value="공공·복지"> 공공·복지</label></td>
	            <td><label><input type="checkbox" class="job-checkbox" id="job-none" name="job" value="선택 안 함"> 선택 안 함</label></td>
	        </tr>
	    </table>
	</div>
    
    <!-- 게시글 등록 버튼 -->
    <div class="submit-button-container">
        <button class="submit-button">게시글 등록</button>
    </div>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
