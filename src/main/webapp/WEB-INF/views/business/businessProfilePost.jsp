<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 정보 등록</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/businessProfilePost.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header_biz.jsp" />
    <div class="post-container">
        <div class="header">
            <h1>기업 정보 등록</h1>
            <button type="button" class="register-btn">등록하기</button>
        </div>
        <form action="#" id="business-form">
            <!-- Main Profile Table -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>대표 기업 로고</th>
                        <td>
                            <input type="file" id="company-logo" class="input-text" accept="image/*">
                            <div id="logo-preview-container">
                                <img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; max-width: 200px; margin-top: 10px;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>기업 한줄 소개</th>
                        <td>
                            <input type="text" class="input-text" maxlength="100" placeholder="기업 한줄소개를 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>기업 홈페이지</th>
                        <td>
                            <input type="url" class="input-text" maxlength="100" placeholder="기업홈페이지 주소를 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>기업 형태</th>
                        <td>
                        	<div class="radio-group">
						        <label><input type="radio" name="company-type" class="input-radio" value="대기업"> 대기업</label>
						        <label><input type="radio" name="company-type" class="input-radio" value="중견기업"> 중견기업</label>
						        <label><input type="radio" name="company-type" class="input-radio" value="중소기업"> 중소기업</label>
						        <label><input type="radio" name="company-type" class="input-radio" value="기타"> 기타</label>
						    </div>
                        </td>
                    </tr>
                    <tr>
                        <th>기업 직원수</th>
                        <td>
                            <input type="number" class="input-text" min="0" placeholder="기업 직원수를 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td>
                            <input type="text" class="input-text" maxlength="100" placeholder="대표자명을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>업종</th>
                        <td>
                            <input type="text" class="input-text" maxlength="100" placeholder="업종을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th>브랜드명</th>
                        <td>
                            <input type="text" class="input-text" maxlength="100" placeholder="브랜드명을 입력하세요">
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 기업소개 Table -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>기업소개</th>
                        <td>
                            <textarea class="long-text" maxlength="1000" placeholder="기업소개를 입력하세요"></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 기업비전 Table -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>기업비전</th>
                        <td>
                            <textarea class="long-text" maxlength="1000" placeholder="기업비전을 입력하세요"></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 복리후생 Table -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th rowspan="2">복리후생</th>
                        <td colspan="2">
                            <input type="text" id="benefits-input" class="input-text" placeholder="입력 후 Enter 키를 누르세요">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="benefits-list">
                            <!-- 복리후생 항목이 추가될 곳 -->
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 사내 근무 환경 Table -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>사내 근무 환경</th>
                        <td>
                            <div class="image-grid">
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                                <div class="image-item">
                                    <img src= "${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                    <input type="file" accept="image/*" class="hidden-file-input">
                                    <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>  
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
