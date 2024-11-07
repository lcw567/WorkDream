<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/positionAndCareer.css">

</head>

<body>
    <div id="Job_Position_content">
        <div class="Position_And_Career">
            <div class="Position_And_Career_Title">
                <h2>직급 및 직책</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Rank_And_Position">
                <input type="text" id="Rank" placeholder="직급을 선택해 주세요.">
                <input type="text" id="Position" placeholder="직책을 선택해 주세요.">
            </div>

            <div class="Position_And_Career_Title">
                <h2>고용 형태</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Employment_Type">
                <div>
                    <input type="radio" id="fullTime" name="employment" />
                    <label for="fullTime">정규직</label>
                </div>
                <div style="margin-left: 10px;">
                    <input type="radio" id="contract" name="employment" />
                    <label for="contract">계약직</label>
                </div>
            </div>

            <div class="Position_And_Career_Title">
                <h2>경력</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Career">
                <div>
                    <input type="radio" id="Newcomer" name="Newcomer">
                    <label for="Newcomer" style="margin-left: 0px;">신입</label>
                </div>
                <div>
                    <input type="radio" id="Work_History" name="Newcomer">
                    <label for="Work_History">경력</label>
                </div>
                <div>
                    <input type="radio" id="Regardless_Of_Experience" name="Newcomer">
                    <label for="Regardless_Of_Experience">경력 무관</label>
                </div>
            </div>

            <div id="Career_Year">
                <input type="text" class="Career_Year_Min" placeholder="최소">
                <p style="font-size: 0.9rem; font-weight: 900;">~</p>
                <input type="text" class="Career_Year_Min" placeholder="최대">
                <p style="font-size: 0.9rem; font-weight: 700;">년차</p>
            </div>

            <div class="Position_And_Career_Title">
                <h2>학력</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Education">
                <div>
                    <input type="radio" id="Academic" name="Academic">
                    <label for="Academic" style="margin-left: 0px; width: 150px;">학력무관</label>
                </div>
                <div>
                    <input type="radio" id="High_School_Graduate" name="Academic">
                    <label for="High_School_Graduate">고등학교 졸업</label>
                </div>
                <div>
                    <input type="radio" id="College_Graduate2" name="Academic">
                    <label for="College_Graduate2">대학졸업(2,3년)</label>
                </div>
                <div>
                    <input type="radio" id="College_Graduate4" name="Academic">
                    <label for="College_Graduate4">대학졸업(4년)</label>
                </div>
                <div>
                    <input type="radio" id="University_Master_Graduate" name="Academic">
                    <label for="University_Master_Graduate">대학원 석사졸업</label>
                </div>
                <div>
                    <input type="radio" id="PhD_Graduate" name="Academic">
                    <label for="PhD_Graduate">대학원 박사졸업</label>
                </div>
            </div>

            <div class="Position_And_Career_Title">
                <h2>근무요일</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Work_Days">
                <div>
                    <input type="radio" id="6-Day_Work_Week" name="Warking">
                    <label for="6-Day_Work_Week" style="margin-left: 0px; width: 150px;">주 6일</label>
                </div>
                <div>
                    <input type="radio" id="5-Day_Work_Week" name="Warking">
                    <label for="5-Day_Work_Week">주 5일</label>
                </div>
                <div>
                    <input type="radio" id="4-Day_Work_Week" name="Warking">
                    <label for="4-Day_Work_Week">주 4일</label>
                </div>
                <div>
                    <input type="radio" id="3-Day_Work_Week" name="Warking">
                    <label for="3-Day_Work_Week">주 3일</label>
                </div>
                <div>
                    <input type="radio" id="2-Day_Work_Week" name="Warking">
                    <label for="2-Day_Work_Week">주 2일</label>
                </div>
                <div>
                    <input type="radio" id="1-Day_Work_Week" name="Warking">
                    <label for="1-Day_Work_Week">주 1일</label>
                </div>
                <div>
                    <input type="radio" id="Negotiable" name="Warking">
                    <label for="Negotiable">협의,스케쥴 근무</label>
                </div>
            </div>

            <div class="Position_And_Career_Title">
                <h2>근무시간</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Wark_Time" style="margin-bottom: 0px;">
                <input type="time" class="Wark_Time_Min">
                <p style="font-size: 0.9rem; font-weight: 900;">~</p>
                <input type="time" class="Wark_Time_Min">
                <p style="font-size: 0.9rem; font-weight: 700;">까지</p>
            </div>

            <label id="Negotiable_Checkbox">
                <input type="checkbox" style="font-weight: 900; font-size: 15px;">
                <p>협의,스케쥴 근무</p>
            </label>

            <div class="Position_And_Career_Title">
                <h2>예상연봉</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Expected_Salary" style="margin-bottom: 0px;">
                <input type="text" class="Expected_Salary_Min" placeholder="최소">
                <p style="font-size: 0.9rem; font-weight: 900;">~</p>
                <input type="text" class="Expected_Salary_Min" placeholder="최대">
                <p style="font-size: 0.9rem; font-weight: 700;">만원</p>
            </div>

            <label id="Negotiable_Checkbox">
                <input type="checkbox" style="font-weight: 900; font-size: 15px; margin-left: 4px;">
                <p>채용시 협의</p>
            </label>

            <div class="Position_And_Career_Title">
                <h2>근무지 주소</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <button class="Work_Location_Address">
                <img src="${pageContext.request.contextPath}/img//free-icon-plus-3524388.png">
                <p>지역 선택</p>
            </button>

            <div class="Position_And_Career_Title">
                <h2 style="font-size: 1.5rem; font-weight: 900; margin-bottom: 20px;">선호 경력</h2>
            </div>

            <div class="Position_And_Career_Title">
                <h2>업종</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div style="display: flex;">
                <button class="Industry_Type">
                    <p>IT/통신업 기타</p>
                </button>
                <button class="Industry_Category">
                    <img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
                    <p>업종 추가</p>
                </button>
            </div>

            <div class="Position_And_Career_Title">
                <h2>전문분야 및 스킬</h2>
                <b>
                    <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                </b>
            </div>

            <div id="Skill_Search">
                <img src="${pageContext.request.contextPath}/img/icons8-search-24.png" id="search_Icon">
                <img src="${pageContext.request.contextPath}/img/icons8-vertical-line-16.png" id="Vertical_Line">
                <input type="text" placeholder="키워드로 전문분야 - 스킬을 검색하세요" id="Skill_Search_Keyward">
            </div>

            <p style="font-size: 0.8rem; color: #656565;">추천 스킬을 선택해보세요</p>

            <div class="Skill_Search_Contant">
                <img src="${pageContext.request.contextPath}/img/icons8-done-24.png">
                <h2>Figma</h2>
            </div>

            <hr>

            <div class="Position_And_Career_Title" style="margin-top: 20px; margin-bottom: 30px;">
                <h2 style="font-size:1.5rem;">선호 기업</h2>
            </div>

            <div class="Position_And_Career_Title" style="margin-bottom: 0px;">
                <h2>기업 유형</h2>
            </div>
            <p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정 기업 유형의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요
            </p>

            <div id="Business_Type">
                <div>
                    <input type="radio" id="Enterprise" name="Company">
                    <label for="Enterprise" style="margin-left: 0px; width: 150px;">대기업</label>
                </div>
                <div>
                    <input type="radio" id="Medium-sized_Enterprise" name="Company">
                    <label for="Medium-sized_Enterprise">중견기업</label>
                </div>
                <div>
                    <input type="radio" id="Small_and_Medium_Enterprise" name="Company">
                    <label for="Small_and_Medium_Enterprise">중소기업</label>
                </div>
                <div>
                    <input type="radio" id="Startup" name="Company">
                    <label for="Startup">스타트업</label>
                </div>
                <div>
                    <input type="radio" id="Foreign_Company" name="Company">
                    <label for="Foreign_Company">외국계기업</label>
                </div>
            </div>

            <div class="Position_And_Career_Title" style="margin-bottom: 0px;">
                <h2>특정기업</h2>
            </div>
            <p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정 기업의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요
            </p>

            <div style="display: flex;">
                <button class="Industry_Type" style="width: 120px;">
                    <p>삼성전자</p>
                </button>
                <button class="Industry_Category">
                    <img src="${pageContext.request.contextPath}/img/free-icon-plus-3524388.png">
                    <p>기업 추가</p>
                </button>
            </div>

            <div id="Employment_Status_with_Preferred_Company">
                <div class="Position_And_Career_Title">
                    <h2>선호 기업에 대한 재직 여부</h2>
                    <b>
                        <p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
                    </b>
                </div>

                <div style="display: flex; width: 90%; justify-content: space-between;">
                    <div class="Currently_Employed">
                        <div class="Employment_Status">
                            <div>
                                <input type="radio" id="Currently_Employed" name="Currently_Employed">
                                <label for="Currently_Employed" style="margin-left: 0px; width: 150px;">재직중</label>
                            </div>
                        </div>

                        <p style="margin-left: 35px;">기업 유형•특정 기업의 재직자를 타겟팅합니다</p>
                    </div>

                    <div class="Currently_Employed">
                        <div class="Employment_Status">
                            <div>
                                <input type="radio" id="Regardless_of_Employment_Status" name="Currently_Employed">
                                <label for="Regardless_of_Employment_Status" style="margin-left: 0px; width: 150px;">재직무관</label>
                            </div>
                        </div>

                        <p style="margin-left: 35px;">과거•현재 재직자를 함께 타겟팅합니다</p>
                    </div>
                </div>
            </div>
            
            <div style="width: 93%; display: flex; margin-top: 15px; justify-content: end;"><button id="Confirm">확인</button></div>
        
        </div>
    </div>

</body>
</html>