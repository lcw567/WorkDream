<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심공고</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clipping.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/js/clipping.js" defer></script>
</head>
<c:import url="/WEB-INF/views/common/header.jsp" />
<body data-context-path="${pageContext.request.contextPath}">
    <div class="main-container">
        <div class="select">
            <div class="tabs">
                <form action="clipping">
                   <button class="btntype1 active">스크랩<span class="badge1">12</span></button>
                </form>
                <form action="clippingcompany">
                    <button class="btntype2">관심기업<span class="badge2">14</span></button>
                </form>
            </div>
            <div class="option">
                <label for="selectAll">
                    <input type="checkbox" id="selectAll" />
                    <span></span>
                </label>
                <button class="remove">삭제</button>
                <button class="move">이동</button>
                <select name="" id="" class="status">
                    <option value="전체" selected="selected">전체 (12)</option>
                    <option value="ing">진행중</option>
                    <option value="end">마감</option>
                </select>
            </div>
            <div class="option2">
                <select name="" id="" class="sequence">
                    <option value="date" selected="selected">날짜순</option>
                    <option value="name">이름순</option>
                </select>
            </div>
        </div>

        <!-- 반복되는 채용 공고 -->
        <div class="content">
            <label for="job1">
                <input type="checkbox" id="job1" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job2">
                <input type="checkbox" id="job2" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job3">
                <input type="checkbox" id="job3" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job4">
                <input type="checkbox" id="job4" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job5">
                <input type="checkbox" id="job5" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job6">
                <input type="checkbox" id="job6" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job7">
                <input type="checkbox" id="job7" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job8">
                <input type="checkbox" id="job8" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job9">
                <input type="checkbox" id="job9" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job10">
                <input type="checkbox" id="job10" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job11">
                <input type="checkbox" id="job11" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="content">
            <label for="job12">
                <input type="checkbox" id="job12" name="checkboxName" value="" />
                <span class="content_check"></span>
            </label>
            <div class="job-details">
                <div class="company-name">대보건설(주)</div>
                <div class="job-title">대보건설 각 부문 경력직 수시채용</div>
                <div class="job-info">경력 대학(2,3년)이상 정규직 및 계약직 서울전체</div>
            </div>
            <div class="job-actions">
                <button class="apply-button">입사지원</button>
                <div class="delete-icon" onclick="deleteJob(this)">&#128465;</div>
                <div class="deadline">~ 11/03(일)</div>
            </div>
        </div>
        <div class="pagination">
            <button id="prevPage" disabled>&#9664;</button>
            <span id="pageNumber">1</span>
            <button id="nextPage">&#9654;</button>
        </div>
    </div>
</body>
</html>
<c:import url="/WEB-INF/views/common/footer.jsp" />
