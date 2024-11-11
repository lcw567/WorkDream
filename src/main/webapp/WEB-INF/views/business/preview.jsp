<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/preview.css">
    <script src="${pageContext.request.contextPath}/js/preview.js" defer></script>
</head>

<body>
    <div id="preview">
        <div id="preview_head">
            <h2>공고 미리보기</h2>
        </div>

        <hr style="border: 1px solid #A1A1A1">

        <div id="preview_content">
            <div id="Preview_content_left">
                <img src="${pageContext.request.contextPath}/img/example.PNG">
            </div>

            <div id="preview_content_right">
                <div id="preview_content_Registration">
                    <table style="margin: 0 25px; margin-top: 5px; margin-bottom: 16px;">
                        <tr style="display: flex; align-items: center; font-weight: 900; ">
                            <td width="35" height="30"><img src="${pageContext.request.contextPath}/img/free-icon-calendar-1283503.png" style="width: 15px; height: 16px; margin-top: 7px; margin-left: 3px;"></td>
                            <td width="100" style="color: #616161;">경력</td>
                            <td width="100" style="color: #616161;">10년 차 이상</td>
                        </tr>
                        <tr style="display: flex; align-items: center; font-weight: 900; color: #616161;">
                            <td width="35" height="30"><img src="${pageContext.request.contextPath}/img/free-icon-south-korean-won-3282881.png" style="width: 16px; height: 16px; display: flex; margin-left: 2px; margin-top: 7px;"></td>
                            <td width="100" style="color: #616161;">연봉</td>
                            <td width="100" style="color: #616161;">-----원</td>
                        </tr>
                        <tr style="display: flex; align-items: center; font-weight: 900; color: #616161;">
                            <td width="35" height="30"><img src="${pageContext.request.contextPath}/img/free-icon-clock-3288819.png" style="width: 16px; height: 16px;  margin-left: 2px; margin-top: 7px;"></td>
                            <td width="95" style="color: #616161;">마감일</td>
                            <td width="100" style="color: #616161;">2024년 12월 12일</td>
                        </tr>
                    </table>

                    <button>등록하기</button>
                </div>
            </div>
        </div>
    </div>

</body>

</html>