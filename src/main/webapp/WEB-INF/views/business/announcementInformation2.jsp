<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/announcementInformation2.css">
    <script>const contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/js/announcementInformation2.js" defer></script>
</head>

<body>
    <div id="Job_Announcement_Information">
        <div id="announcement_Information">
            <h2>채용 공고 등록</h2>
            <div id="preview_and_TemporarySave">
                <button id="preview">미리 보기</button>
                <button id="TemporarySave">임시 저장</button>
            </div>
        </div>

        <hr>

        <div id="Job_Announcement_Information_content">
            <div id="Job_Announcement_Information_Index">
                <div id="Job_Announcement_Information_Index_One">
                    <img src="${pageContext.request.contextPath}/img/icons8-1-24.png">
                    <p>기업 정보</p>
                    <hr>
                    <img src="${pageContext.request.contextPath}/img/icons8-2-48.png">
                    <p>공고 정보</p>
                </div>
            </div>

            <div class="Contact_Announcement_Information">
                <div class="Contact_Announcement_Information_Title">
                    <h2>공고 지원 방식</h2>
                    <b>
                        <p style="color: #FE0000; font-weight: 900;">*</p>
                    </b>
                </div>
            </div>

            <div>
                <div id="WorkDream_Applied">
                    <label style="display: flex;">
                        <input type="radio" name="workdream" checked>
                        <h2>워크드림 프로필로 간편 지원</h2>
                    </label>
                </div>
                <div id="Homepage_Applied">
                    <label style="display: flex;">
                        <input type="radio" name="workdream">
                        <h2>자사 홈페이지에서 지원</h2>
                    </label>
                </div>
            </div>

            <div class="Contact_Announcement_Information_Title">
                <h2>제목</h2>
                <b>
                    <p style="color: #FE0000; font-weight: 900;">*</p>
                </b>
            </div>

            <input id="Announcement_Title" type="text" placeholder="공고 제목을 입력해주세요.">
            <div style="display: flex;">
            <p style="color: #000000; font-weight: 900; margin-top: 3px; margin-bottom: 1px;">* 25자 이내의 글자 수를 입력해주세요.</p>
            </div><div id="charCount" style="font-size: 0.8rem; color: #757575; margin-bottom: 40px; margin-left: 5px;">현재 글자 수: 0/25</div>

            <div class="Contact_Announcement_Information_Title">
                <h2>직무</h2>
                <b>
                    <p style="color: #FE0000; font-weight: 900;">*</p>
                </b>
            </div>
            <p style="margin-top: 0px; color: #757575; font-weight: 200;">최대 5개까지 추가 가능합니다.</p>

            <div>
                <div class="Job_duty">
                    <p>사원 / 경력 O년~ O년 / 학력 - 4년제 대학 졸업 / 채용시 협의</p>
                    <button><img src="${pageContext.request.contextPath}/img/letter-x_9215129.png" style="width: 25px; height: 25px;"></button>
                </div>
                <button class="Add_Duty" id="addDutyButton">
                    <img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
                    <p>직무 추가</p>
                </button>
            </div>

           <div class="Contact_Announcement_Information_Title">
                <h2>공고 소개 이미지</h2>
            </div>
            <div id="Announcement_Introduction_img" >
                <img src="${pageContext.request.contextPath}/img/icons8-img-48.png">
            </div>
            <div id="Announcement_Introduction_file">
                <input type="text" id="Announcement_Introduction_fileName" placeholder=".png" disabled>
                <input type="file" id="Announcement-file" hidden>
                <label for="Announcement-file" id="Announcement_custom-file-upload">파일첨부</label>
            </div>
            <p style="color: #000000; font-weight: 900; margin-bottom: 2px;">* 공고와 관련된 이미지를 올려주세요. 소개문 이전에 노출됩니다. 공고와
                관련없는 이미지는 제지를 받을 수 있습니다.</p>
            <p style="color: #000000; font-weight: 900; margin-top: 2px; margin-bottom: 40px;">* 최소 1200 x 800px 이상, 3:2
                비율의 이미지</p>

            <div class="Contact_Announcement_Information_Title">
                <h2>공고 소개</h2>
            </div>
            <textarea class="Text_Container" placeholder="회사나 제품 / 서비스 또는 공고에 대한 소개를 작성해주세요."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2>주요 업무</h2>
            </div>
            <textarea class="Text_Container" placeholder="해당 포지션에서 어떤 업무를 하는지 작성해주세요."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2>자격 요건</h2>
            </div>
            <textarea class="Text_Container" placeholder="업무상 꼭 필요한 필수 요건을 작성해 주세요."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2>우대 사항</h2>
            </div>
            <textarea class="Text_Container" placeholder="우대하는 요건을 작성해 주세요."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2>채용 절차</h2>
            </div>
            <textarea class="Text_Container" placeholder="서류 전형, 면접 등 채용 절차를 작성해 주세요."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2>기타 안내</h2>
            </div>
            <textarea class="Text_Container" style="margin-bottom: 80px;"
                placeholder="복지 및 해택 등 알리고 싶은 기타 정보를 작성합니다."></textarea>

            <div class="Contact_Announcement_Information_Title">
                <h2 style="margin-bottom: 20px;">공고 게시 기간</h2>
            </div>
            <div id="Announcement_Post_Time">
                <input type="datetime-local" id="Post_First_Time">
                <p style="margin-bottom: 10px;">~</p>
                <input type="datetime-local" id="Post_End_Time">
            </div>

            <div class="Contact_Announcement_Information_Title">
                <h2>지원자가 필수로 입력해야 하는 정보</h2>
            </div>
            <p style="margin-top: 3px; color: #A09F9F; font-size: 0.9rem;">필수 입력 정보가 적을수록, 지원 허들이 낮아져요</p>

            <hr style="border: 1px solid #9E9E9E;">

            <div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
                <h2 style="padding: 0 20px; width: 150px;">자격요건</h2>
                <div class="Need_Input_Infomation">
                    <label class="Check_And_Text" style="width: 90px;"><input type="checkbox">외국어 능력</label>
                    <label class="Check_And_Text" style="width: 60px;"><input type="checkbox">자격증</label>
                    <label class="Check_And_Text" style="width: 85px;"><input type="checkbox">포트폴리오</label>
                </div>
            </div>



            <hr style="border: 1px solid #9E9E9E;">

            <div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
                <h2 style="padding: 0 20px; width: 150px;">우대사항</h2>
                <div class="Need_Input_Infomation">
                    <label class="Check_And_Text"><input type="checkbox">보훈 여부</label>
                    <label class="Check_And_Text"><input type="checkbox">장애 여부</label>
                    <label class="Check_And_Text"><input type="checkbox">병역 정보</label>
                </div>

            </div>

            <hr style="border: 1px solid #9E9E9E;">

            <div class="Contact_Announcement_Information_Title" style="padding: 35px 0;">
                <h2 style="padding: 0 20px; width: 150px;">개인정보</h2>
                <div class="Need_Input_Infomation">
                    <label class="Check_And_Text"><input type="checkbox">출생연도</label>
                    <label class="Check_And_Text" style="width: 50px;"><input type="checkbox">성별</label>
                    <label class="Check_And_Text"><input type="checkbox">현재연봉</label>
                </div>

            </div>


            <hr style="border: 1px solid #9E9E9E; margin-bottom: 70px;">


        </div>
        <div id="Job_Posting_division_zones"></div>

        <div class="Next_Or_Back">
            <button class="Cancel_Push">취소</button>
            <button class="Next_Push">다음</button>
        </div>
</body>

</html>