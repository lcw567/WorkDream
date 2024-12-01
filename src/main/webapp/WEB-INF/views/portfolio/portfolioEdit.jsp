<!-- WEB-INF/views/portfolio/portfolioEdit.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포트폴리오 수정</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Summernote CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/portfolioPost.css">
</head>
<body data-page="edit">
    <!-- 헤더 포함 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="container mt-5">
        <h1 class="text-center tekhelet styled-title">포트폴리오 수정</h1>
        <form action="${pageContext.request.contextPath}/portfolio/update" method="post">
            <!-- Portfolio ID (숨김 필드) -->
            <input type="hidden" name="portfolioId" value="${portfolio.portfolioId}"/>
            <!-- 버튼 -->
            <div class="d-flex justify-content-end mb-3">
                <button type="submit" class="btn btn-edit mr-2">수정</button>
                <a href="${pageContext.request.contextPath}/portfolio/portfolioDashboard" class="btn btn-purple">관리 페이지로 돌아가기</a>
            </div>
            <div class="form-group">
                <input type="text" class="form-control tekhelet-border" id="title" name="title" placeholder="제목을 입력하시오" value="${portfolio.title}" required>
            </div>
            <div class="form-group">
                <textarea id="summernote" name="content">${portfolio.content}</textarea>
            </div>
            <!-- 코드블럭 사용설명 추가 -->
			<div class="alert alert-info custom-alert" role="alert">
				    💡 코드 블럭 사용 방법<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;코드 블럭을 쉽게 작성하고 적용하는 방법을 소개합니다!<br><br>
				    🖊️ Colorscripter 접속하기 (<a href="https://colorscripter.com/" target="_blank" style="color: blue;">https://colorscripter.com</a>)<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;Colorscripter 사이트에 접속한 후, 코드 작성 공간에 코드를 입력합니다.<br><br>
				    📄 HTML로 변환 및 복사하기<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;작성한 코드를 HTML 포맷으로 변환한 뒤, 복사합니다.<br><br>
				    🔧 Code View로 전환하기<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;포트폴리오 작성 도구의 툴바에서 <strong>Code View</strong> 버튼을 클릭하여 코드 편집 모드로 전환합니다.<br><br>
				    📋 복사한 코드 붙여넣기<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;Code View 상태에서 복사한 코드를 붙여넣습니다.<br><br>
				    ✔️ Code View 종료하기<br>
				    &nbsp;&nbsp;&nbsp;&nbsp;<strong>Code View</strong> 버튼을 다시 클릭하여 일반 보기로 전환합니다. 이 상태에서 코드 블럭이 잘 적용되었는지 확인하세요.<br><br>
			</div>
			
            <!-- 사용설명 추가 -->
            <div class="alert alert-info custom-alert" role="alert">
				📝 포트폴리오 작성 팁<br>
				&nbsp;&nbsp;&nbsp;&nbsp;완벽한 포트폴리오를 만들기 위한 몇 가지 유용한 팁을 소개할게요!<br><br>
				🎨 디자인 일관성 유지하기<br>
				&nbsp;&nbsp;&nbsp;&nbsp;색상, 폰트, 레이아웃 등 디자인 요소를 일관성 있게 사용하여 전문적인 이미지를 전달하세요.<br><br>
				📂 프로젝트 선택하기<br>
				&nbsp;&nbsp;&nbsp;&nbsp;가장 잘 보여줄 수 있는 프로젝트를 선택하고, 각 프로젝트에 대한 상세한 설명과 역할을 명확히 기술하세요.<br><br>
				📈  성과 강조하기 <br>
				&nbsp;&nbsp;&nbsp;&nbsp;프로젝트를 통해 달성한 성과나 배운 점을 구체적으로 적어 자신을 어필하세요. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;수치나 구체적인 예시를 포함하면 더욱 효과적이에요.<br><br>
				🔗 관련 링크 포함하기<br>
				&nbsp;&nbsp;&nbsp;&nbsp;GitHub, 블로그, LinkedIn 등 관련된 외부 링크를 포함시켜 자신의 활동을 더 잘 보여주세요.<br><br>
				🖼️ 시각적 요소 활용하기<br>
				&nbsp;&nbsp;&nbsp;&nbsp;이미지, 동영상, 인포그래픽 등을 활용하여 포트폴리오를 시각적으로 풍부하게 만들어보세요.<br><br>
	        </div>
	        
        </form>
    </div>

    <!-- 푸터 포함 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />


    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Summernote JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/portfolioPost.js"></script>
</body>  
</html>  
