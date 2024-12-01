<!-- editPost.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"> <!-- common.css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityPost.css"> 
    
    <script src="${pageContext.request.contextPath}/js/editPost.js" defer></script> <!-- editPost.js 연결 -->
</head>
<body>	
    <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}"/>

    <c:import url="/WEB-INF/views/common/header.jsp" />
    
    <div class="post-container">
        <!-- 게시글 수정 폼 시작 -->
        <form id="editPostForm" enctype="multipart/form-data">
            <input type="hidden" name="postingNo" value="${post.postingNo}" />

            <!-- 카테고리 선택 -->
            <div class="category-select">
                <label for="category"><h4>카테고리</h4></label>
                <select id="category" name="category" required>
                    <option value="">-- 선택 --</option>
                    <option value="신입" <c:if test="${post.category == '신입'}">selected</c:if>>신입</option>
                    <option value="채용공고" <c:if test="${post.category == '채용공고'}">selected</c:if>>채용공고</option>
                    <option value="취준" <c:if test="${post.category == '취준'}">selected</c:if>>취준</option>
                    <option value="자소서" <c:if test="${post.category == '자소서'}">selected</c:if>>자소서</option>
                    <option value="자격증" <c:if test="${post.category == '자격증'}">selected</c:if>>자격증</option>
                    <option value="Q&A" <c:if test="${post.category == 'Q&A'}">selected</c:if>>Q&A</option>
                    <option value="커리어" <c:if test="${post.category == '커리어'}">selected</c:if>>커리어</option>
                    <option value="이직" <c:if test="${post.category == '이직'}">selected</c:if>>이직</option>
                    <option value="잡담" <c:if test="${post.category == '잡담'}">selected</c:if>>잡담</option>
                    <option value="면접" <c:if test="${post.category == '면접'}">selected</c:if>>면접</option>
                </select>
            </div>
        
            <!-- 제목 입력 -->
            <div class="title-input">
                <input type="text" placeholder="제목을 입력해주세요" name="title" value="${post.title}" required>
            </div>
        
            <!-- 내용 입력 -->
            <div class="content-input">
                <textarea placeholder="내용을 입력해주세요" name="content" required>${post.content}</textarea>
                <p class="content-guidelines">
                    - 저작권 침해, 음란, 상습적 유해물, 기타 허락받지 않은 게시물은 경고 없이 삭제됩니다.
                </p>
            </div>
        
            <!-- 이미지 첨부 -->
            <div class="image-upload">
                <label for="imageInput" class="image-upload-label">
                    📷 이미지 첨부
                </label>
                <input type="file" accept="image/*" id="imageInput" name="image" style="display: none;" />
            </div>
        
            <div class="image-preview" id="imagePreview">
			    <c:if test="${not empty post.imagePath}">
			        <img id="existingImage" src="${pageContext.request.contextPath}/board/uploads/${post.imagePath}" alt="이미지 미리보기">
			    </c:if>
			</div>

        
            <!-- 해시태그 입력 -->
            <div class="hashtag-input">
                <label for="hashtags"># 해시태그 입력</label>
                <div class="hashtag-box">
                    <c:forEach var="tag" items="${post.hashtags}">
                        <span class="hashtag">
                            #${tag} <span class="remove-btn">×</span>
                        </span>
                    </c:forEach>
                    <input type="text" id="hashtags" name="hashtags" placeholder="입력 (최대 5개)" />
                </div>
            </div>
        
            <!-- 관련 직무 선택 -->
            <div class="job-category-container">
                <label class="job-category-label"> 관련 직무 선택</label>
                <table class="job-category-table">
                    <tr>
                        <td>
                            <label for="job-KIHYEOK">
                                <input type="checkbox" id="job-KIHYEOK" class="job-checkbox" name="jobCategories" value="기획·전략" />
                                <span class="custom-checkbox"></span>
                                기획·전략
                            </label>
                        </td>
                        <td>
                            <label for="job-MARKETING">
                                <input type="checkbox" id="job-MARKETING" class="job-checkbox" name="jobCategories" value="마케팅·홍보·조사" />
                                <span class="custom-checkbox"></span>
                                마케팅·홍보·조사
                            </label>
                        </td>
                        <td>
                            <label for="job-ACCOUNTING">
                                <input type="checkbox" id="job-ACCOUNTING" class="job-checkbox" name="jobCategories" value="회계·세무·재무" />
                                <span class="custom-checkbox"></span>
                                회계·세무·재무
                            </label>
                        </td>
                        <td>
                            <label for="job-HR">
                                <input type="checkbox" id="job-HR" class="job-checkbox" name="jobCategories" value="인사·노무·HRD" />
                                <span class="custom-checkbox"></span>
                                인사·노무·HRD
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="job-ADMIN">
                                <input type="checkbox" id="job-ADMIN" class="job-checkbox" name="jobCategories" value="총무·법무·사무" />
                                <span class="custom-checkbox"></span>
                                총무·법무·사무
                            </label>
                        </td>
                        <td>
                            <label for="job-IT">
                                <input type="checkbox" id="job-IT" class="job-checkbox" name="jobCategories" value="IT개발·데이터" />
                                <span class="custom-checkbox"></span>
                                IT개발·데이터
                            </label>
                        </td>
                        <td>
                            <label for="job-DESIGN">
                                <input type="checkbox" id="job-DESIGN" class="job-checkbox" name="jobCategories" value="디자인" />
                                <span class="custom-checkbox"></span>
                                디자인
                            </label>
                        </td>
                        <td>
                            <label for="job-SALES">
                                <input type="checkbox" id="job-SALES" class="job-checkbox" name="jobCategories" value="영업·판매·무역" />
                                <span class="custom-checkbox"></span>
                                영업·판매·무역
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="job-CUSTOMER">
                                <input type="checkbox" id="job-CUSTOMER" class="job-checkbox" name="jobCategories" value="고객상담·TM" />
                                <span class="custom-checkbox"></span>
                                고객상담·TM
                            </label>
                        </td>
                        <td>
                            <label for="job-PURCHASE">
                                <input type="checkbox" id="job-PURCHASE" class="job-checkbox" name="jobCategories" value="구매·자재·물류" />
                                <span class="custom-checkbox"></span>
                                구매·자재·물류
                            </label>
                        </td>
                        <td>
                            <label for="job-MD">
                                <input type="checkbox" id="job-MD" class="job-checkbox" name="jobCategories" value="상품기획·MD" />
                                <span class="custom-checkbox"></span>
                                상품기획·MD
                            </label>
                        </td>
                        <td>
                            <label for="job-DRIVING">
                                <input type="checkbox" id="job-DRIVING" class="job-checkbox" name="jobCategories" value="운전·운송·배송" />
                                <span class="custom-checkbox"></span>
                                운전·운송·배송
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="job-SERVICE">
                                <input type="checkbox" id="job-SERVICE" class="job-checkbox" name="jobCategories" value="서비스" />
                                <span class="custom-checkbox"></span>
                                서비스
                            </label>
                        </td>
                        <td>
                            <label for="job-PRODUCTION">
                                <input type="checkbox" id="job-PRODUCTION" class="job-checkbox" name="jobCategories" value="생산" />
                                <span class="custom-checkbox"></span>
                                생산
                            </label>
                        </td>
                        <td>
                            <label for="job-CONSTRUCTION">
                                <input type="checkbox" id="job-CONSTRUCTION" class="job-checkbox" name="jobCategories" value="건설·건축" />
                                <span class="custom-checkbox"></span>
                                건설·건축
                            </label>
                        </td>
                        <td>
                            <label for="job-MEDICAL">
                                <input type="checkbox" id="job-MEDICAL" class="job-checkbox" name="jobCategories" value="의료" />
                                <span class="custom-checkbox"></span>
                                의료
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="job-RD">
                                <input type="checkbox" id="job-RD" class="job-checkbox" name="jobCategories" value="연구·R&D" />
                                <span class="custom-checkbox"></span>
                                연구·R&D
                            </label>
                        </td>
                        <td>
                            <label for="job-EDUCATION">
                                <input type="checkbox" id="job-EDUCATION" class="job-checkbox" name="jobCategories" value="교육" />
                                <span class="custom-checkbox"></span>
                                교육
                            </label>
                        </td>
                        <td>
                            <label for="job-MEDIA">
                                <input type="checkbox" id="job-MEDIA" class="job-checkbox" name="jobCategories" value="미디어·문화·스포츠" />
                                <span class="custom-checkbox"></span>
                                미디어·문화·스포츠
                            </label>
                        </td>
                        <td>
                            <label for="job-FINANCE">
                                <input type="checkbox" id="job-FINANCE" class="job-checkbox" name="jobCategories" value="금융·보험" />
                                <span class="custom-checkbox"></span>
                                금융·보험
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="job-PUBLIC">
                                <input type="checkbox" id="job-PUBLIC" class="job-checkbox" name="jobCategories" value="공공·복지" />
                                <span class="custom-checkbox"></span>
                                공공·복지
                            </label>
                        </td>
                        <td colspan="3">
                            <label for="job-NONE">
                                <input type="checkbox" id="job-NONE" class="job-checkbox" name="jobNone" value="선택 안 함" />
                                <span class="custom-checkbox"></span>
                                선택 안 함
                            </label>
                        </td>
                    </tr>
                </table>
            </div>
                
            <!-- 게시글 수정 버튼 -->
            <div class="submit-button-container">
                <button type="submit" class="submit-button">게시글 수정</button>
            </div>
        </form>
        <!-- 게시글 수정 폼 끝 -->
    </div>
    
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
