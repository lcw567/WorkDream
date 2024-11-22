<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>워크드림</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/enrollresume.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <!-- contextPath를 JavaScript 변수로 정의 -->
    <script type="text/javascript">
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/js/enrollresume.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/dynamicFields.js" defer></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="inner">
        <form action="insert.re" method="post" enctype="multipart/form-data">
            <div class="resume_title">
                <h1>이력서 제목</h1> 
                <input type="text" name="resumeTitle" placeholder="이력서의 제목을 입력해주세요." required>
            </div>
            <!-- 기본정보 -->
            <div class="Info">
                <fieldset class="basic_info">
                    <legend class="b_Info">기본정보</legend>
                    <div class="basic_inner">
                        <div id="basic1">
                            <fieldset class="name">
                                <legend class="username">이름*</legend>
                                <input type="text" name="userName" required>
                            </fieldset>
                            <fieldset class="gender">
                                <select name="userGender" id="selectgender" required>
                                    <option value="M">남</option>
                                    <option value="F">여</option>
                                </select>
                            </fieldset>
                            <fieldset class="birthday">
                                <legend class="userbirth">생년월일*</legend>
                                <input type="date" name="userBirth" required>
                            </fieldset>
                        </div>
                        <div id="basic2">  
                            <fieldset class="email">
                                <legend class="useremail">이메일*</legend>
                                <input type="email" name="userEmail" required>
                            </fieldset>
                            <button type="button" class="email_check">인증</button>
                        </div>
                        <div id="basic3">  
                            <fieldset class="phone">
                                <legend class="userphone">전화번호*</legend>
                                <input type="text" name="userPhone" required>
                            </fieldset>
                            <button type="button" class="phone_check">인증</button>
                        </div>
                        <div id="basic4">
                            <fieldset class="address">
                                <legend class="useraddress">주소*</legend>
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="userAddress" required>
                            </fieldset>
                            <input type="button" class="addressNum" name="usernumberaddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                            <fieldset class="dtaddress1">
                                <legend class="roadAddress">도로명주소*</legend>
                                <input type="text" id="roadAddress" name="userRoadAddress" placeholder="도로명주소" required>
                            </fieldset>
                            <fieldset class="dtaddress2">
                                <legend class="detailAddress">상세주소*</legend>
                                <input type="text" id="detailAddress" name="userDetailAddress" placeholder="상세주소" required>
                            </fieldset>
                        </div>
                        <div id="basic5">
                            <img src="${pageContext.request.contextPath}/img/file.png" class="profile_img" alt="">
                            <input type="file" class="profile_upload" accept="image/*" name="userPicFile">
                        </div>
                    </div>
                </fieldset>
            </div>
        
            <!-- 최종 학력 -->
            <div class="education">
                <fieldset class="education_Lv">
                    <legend class="edu_Lv">최종 학력</legend>
                    <div id="edu1">
                        <div class="edu_inner1">
                            <fieldset class="final_edu">
                                <select name="educationLevel" id="selectedu" onchange="displayEducationFields()">
                                    <option value="select">학력 구분 선택*</option>
                                    <option value="element">초등학교</option>
                                    <option value="middle">중학교</option>
                                    <option value="high">고등학교</option>
                                    <option value="college">대학/대학원 이상 졸업</option>
                                </select>
                            </fieldset>
                        </div>
                        
                        <!-- 초등학교 정보 -->
                        <div id="elementaryFields" style="display: none;">    
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName" class="element_name" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus" class="status" >
                                        <option value="graduate">졸업</option>
                                        <option value="withdraw">중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>중입 검정고시(초졸)</label>
                                    <label for="middle_exam">
                                        <input type="checkbox" id="middle_exam" name="examPassed" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="month" name="enterDate" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="month" name="graduationDate" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location" class="select_lo" >
                                        <option value="seoul">서울</option>
                                        <option value="busan">부산</option>
                                        <option value="daegu">대구</option>
                                        <option value="incheon">인천</option>
                                        <option value="gwangju">광주</option>
                                        <option value="daejeon">대전</option>
                                        <option value="ulsan">울산</option>
                                        <option value="sejong">세종</option>
                                        <option value="jeju">제주</option>
                                        <option value="gangwon">강원</option>
                                        <option value="gyeonggi">경기</option>
                                        <option value="chungbuk">충북</option>
                                        <option value="chungnam">충남</option>
                                        <option value="jeonbuk">전북</option>
                                        <option value="jeonnam">전남</option>
                                        <option value="gyeongbuk">경북</option>
                                        <option value="gyeongnam">경남</option>
                                        <option value="overseas">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 중학교 정보 -->
                        <div id="middleSchoolFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName" class="middle_name" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus" class="status" >
                                        <option value="graduate">졸업</option>
                                        <option value="withdraw">중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>고입 검정고시(중졸)</label>
                                    <label for="high_exam">
                                        <input type="checkbox" id="high_exam" name="examPassed" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="month" name="enterDate" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="month" name="graduationDate" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location" class="select_lo" >
                                        <option value="seoul">서울</option>
                                        <option value="busan">부산</option>
                                        <option value="daegu">대구</option>
                                        <option value="incheon">인천</option>
                                        <option value="gwangju">광주</option>
                                        <option value="daejeon">대전</option>
                                        <option value="ulsan">울산</option>
                                        <option value="sejong">세종</option>
                                        <option value="jeju">제주</option>
                                        <option value="gangwon">강원</option>
                                        <option value="gyeonggi">경기</option>
                                        <option value="chungbuk">충북</option>
                                        <option value="chungnam">충남</option>
                                        <option value="jeonbuk">전북</option>
                                        <option value="jeonnam">전남</option>
                                        <option value="gyeongbuk">경북</option>
                                        <option value="gyeongnam">경남</option>
                                        <option value="overseas">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 고등학교 정보 -->
                        <div id="highSchoolFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName" class="high_name" >
                                </fieldset>
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus" class="status" >
                                        <option value="graduate">졸업</option>
                                        <option value="attending">재학중</option>
                                        <option value="withdraw">중퇴</option>
                                        <option value="graduating">졸업예정</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>대입 검정고시</label>
                                    <label for="college_exam">
                                        <input type="checkbox" id="college_exam" name="examPassed" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="month" name="enterDate" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="month" name="graduationDate" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location" class="select_lo" >
                                        <option value="seoul">서울</option>
                                        <option value="busan">부산</option>
                                        <option value="daegu">대구</option>
                                        <option value="incheon">인천</option>
                                        <option value="gwangju">광주</option>
                                        <option value="daejeon">대전</option>
                                        <option value="ulsan">울산</option>
                                        <option value="sejong">세종</option>
                                        <option value="jeju">제주</option>
                                        <option value="gangwon">강원</option>
                                        <option value="gyeonggi">경기</option>
                                        <option value="chungbuk">충북</option>
                                        <option value="chungnam">충남</option>
                                        <option value="jeonbuk">전북</option>
                                        <option value="jeonnam">전남</option>
                                        <option value="gyeongbuk">경북</option>
                                        <option value="gyeongnam">경남</option>
                                        <option value="overseas">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 대학교 정보 -->
                        <div id="collegeFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName" class="college_name" >
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>전공 *</legend>
                                    <input type="text" name="majorName" class="major_name" >
                                </fieldset>
                                    
                                <fieldset class="input-group">
                                    <legend>학제 *</legend>
                                    <select name="degree" class="degree" >
                                        <option value="2year">2년제</option>
                                        <option value="3year">3년제</option>
                                        <option value="4year">4년제</option>
                                        <option value="master">대학원(석사)</option>
                                        <option value="dr">대학원(박사)</option>
                                    </select>
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus" class="status" >
                                        <option value="graduate">졸업</option>
                                        <option value="attending">재학중</option>
                                        <option value="absence">휴학중</option>
                                        <option value="withdraw">중퇴</option>
                                        <option value="dropping">자퇴</option>
                                        <option value="expected">졸업예정</option>
                                    </select>
                                </fieldset>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="month" name="enterDate" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="month" name="graduationDate" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location" class="select_lo" >
                                        <option value="seoul">서울</option>
                                        <option value="busan">부산</option>
                                        <option value="daegu">대구</option>
                                        <option value="incheon">인천</option>
                                        <option value="gwangju">광주</option>
                                        <option value="daejeon">대전</option>
                                        <option value="ulsan">울산</option>
                                        <option value="sejong">세종</option>
                                        <option value="jeju">제주</option>
                                        <option value="gangwon">강원</option>
                                        <option value="gyeonggi">경기</option>
                                        <option value="chungbuk">충북</option>
                                        <option value="chungnam">충남</option>
                                        <option value="jeonbuk">전북</option>
                                        <option value="jeonnam">전남</option>
                                        <option value="gyeongbuk">경북</option>
                                        <option value="gyeongnam">경남</option>
                                        <option value="overseas">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        
            <!-- 경력 -->
            <div class="Career">
                <fieldset class="career">
                    <legend class="career_Lv">경력</legend>
                    <label class="careerYorN">경력이 있을 경우 선택해주세요.</label>
                    <label for="CareerY">
                        <input type="checkbox" id="CareerY" name="career_present"/>
                        <span></span>&nbsp;
                    </label>
                    <div class="career1">
                        <fieldset class="company_title">
                            <legend>회사명</legend>
                            <input type="text" class="com_title" name="companyTitle" >
                        </fieldset>
                        <fieldset class="enter_com">
                            <legend>입사년월</legend>
                            <input type="month" name="startDateWork" >
                        </fieldset>
                        <fieldset class="retire_com">
                            <legend>퇴사년월</legend>
                            <input type="month" name="endDateWork">
                        </fieldset>
                        <fieldset class="input-group">
                            <legend>근무현황</legend>
                            <select name="careerStatus" class="career_status" >
                                <option value="Y">재직중</option>
                                <option value="N">퇴사</option>
                                <option value="P">퇴사예정</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="career2">
                        <fieldset class="job">
                            <legend>직무</legend>
                            <input type="text" class="job_name" name="work" >
                        </fieldset>
                        <fieldset class="department">
                            <legend>근무부서</legend>
                            <input type="text" class="department_name" name="department" >
                        </fieldset>
                        <fieldset class="position">
                            <legend>직급/직책</legend>
                            <input type="text" class="position_name" name="position" >
                        </fieldset>
                    </div>
                    <div class="career3">
                        <fieldset class="job_content">
                            <legend>담당업무</legend>
                            <textarea name="jobContent" id="j_content" placeholder="담당업무를 입력해주세요.
            
            - 진행한 업무를 다 적기보다는 경력사항 별로 중요합니다!
            
            - 담당한 업무 내용을 요약해서 작성해보세요!
            
            - 경력별 프로젝트 내용을 적을 경우, 역할/팀구성/기여도/성과를 기준으로 요약해서 작성해보세요!" ></textarea>
                        </fieldset>
                    </div>
                </fieldset>
            </div>
        
            <!-- 스킬 -->
            <div id="Skill">
                <fieldset class="skill">
                    <legend class="skill_name">스킬</legend>
                    <div id="sk_title1">
                        <fieldset class="skill_title">
                            <input type="text" name="skillName" placeholder="툴/직무역량/소프트스킬을 입력해주세요.">
                        </fieldset>
                        <button type="button" class="addSkillButton">추가하기</button>
                    </div>
                    <div id="sk_title2" style="display: none;">
                        <div id="MYsk">
                            <h1>나의 스킬</h1>
                        </div>
                    </div>
                </fieldset>
            </div>
        
            <!-- 경험/활동/교육 -->
            <div id="Experience">
                <fieldset class="experience">
                    <legend class="exp">경험/활동/교육</legend>
                    <div class="exp1">
                        <fieldset class="activity">
                            <legend>활동구분선택</legend>
                            <select name="activityType" class="select_activity" >
                                <option value="working">교내활동</option>
                                <option value="intern">인턴</option>
                                <option value="volunteer">자원봉사</option>
                                <option value="club">동아리</option>
                                <option value="parttime">아르바이트</option>
                                <option value="social">사회활동</option>
                                <option value="project">수행과제</option>
                                <option value="overseas">해외연수</option>
                                <option value="education">교육이수내역</option>
                            </select>
                        </fieldset>
                        <fieldset class="place">
                            <legend class="place_name">기관/장소</legend>
                            <input type="text" name="organizationName" >
                        </fieldset>
                        <fieldset class="start_date">
                            <legend>시작년월</legend>
                            <input type="month" name="startDateAct" >
                        </fieldset>
                        <fieldset class="finish_date">
                            <legend>종료년월</legend>
                            <input type="month" name="endDateAct">
                        </fieldset>
                    </div>
                    <div class="exp2">
                        <fieldset class="exp_content">
                            <legend>활동설명</legend>
                            <textarea name="description" id="e_content" placeholder="경험/활동 상세내용 입력" ></textarea>
                        </fieldset>
                    </div>
                </fieldset>
            </div>
        
            <!-- 자격/어학/수상 -->
            <div class="awards">
                <fieldset class="select_awards">
                    <legend class="awa">자격/어학/수상</legend>
                    <div class="AWARDS">
                        <fieldset class="select_inner">
                            <legend>구분</legend>
                            <select name="category" id="sortation">
                                <option value="">구분*</option>
                                <option value="certificate">자격증/면허증</option>
                                <option value="language">어학시험</option>
                                <option value="award_details">수상내역/공모전</option>
                            </select>
                        </fieldset>
                    </div>
                    <!-- 자격증/면허증 정보 -->
                    <div class="awards2" id="certificateFields" style="display: none;">
                        <fieldset class="certi_title">
                            <legend>자격증명</legend>
                            <input type="text" name="qualificationName">
                        </fieldset>
                        <fieldset class="institution">
                            <legend>발행처/기관</legend>
                            <input type="text" name="issuingAgency">
                        </fieldset>
                        <fieldset class="pass_status">
                            <legend>합격구분</legend>
                            <select name="passStatus" id="pass_menu">
                                <option value="">합격구분*</option>
                                <option value="1pass">1차합격</option>
                                <option value="2pass">2차합격</option>
                                <option value="writtenpass">필기합격</option>
                                <option value="practicepass">실기합격</option>
                                <option value="finalpass">최종합격</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="awards3" id="certificateDate" style="display: none;">
                        <fieldset class="pass_date">
                            <legend>발급일자</legend>
                            <input type="month" class="pass" name="issueDate">
                        </fieldset>
                        <button type="button" class="addQualificationButton">추가하기</button>
                    </div>
                    <!-- 어학시험 정보 -->
                    <div class="Language" id="languageFields" style="display: none;">
                        <div class="Lang">
                            <div class="language1">
                                <fieldset class="lang_title">
                                    <legend>어학시험명</legend>
                                    <input type="text" name="languageName">
                                </fieldset>
                                <fieldset class="level">
                                    <legend>급수</legend>
                                    <select name="proficiencyLevel" id="certi_level">
                                        <option value="">급수</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                    </select>
                                </fieldset>
                                <fieldset class="lang_category">
                                    <legend>언어</legend>
                                    <select name="languageType" id="lang_cate">
                                        <option value="">언어</option>
                                        <option value="english">영어</option>
                                        <option value="japan">일본어</option>
                                        <option value="china">중국어</option>
                                        <option value="german">독일어</option>
                                        <option value="french">불어</option>
                                        <option value="spanish">스페인어</option>
                                        <option value="russian">러시아어</option>
                                        <option value="italy">이탈리아어</option>
                                        <option value="korean">한국어</option>
                                        <option value="etc">기타</option>
                                    </select>
                                </fieldset>
                            </div>
                            <div class="language2" id="languageDate1" style="display: block;">
                                <fieldset class="get_date">
                                    <legend>취득일</legend>
                                    <input type="month" class="get" name="issueDate">
                                </fieldset>
                                <button type="button" class="addLanguageButton">추가하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- 수상/공모전 정보 -->
                    <div class="Contest" id="awardDetailsFields" style="display: none;">
                        <div class="contest1">
                            <fieldset class="contest_title">
                                <legend>수상/공모전명</legend>
                                <input type="text" name="awardName">
                            </fieldset>
                            <fieldset class="contest_place">
                                <legend>주최기관</legend>
                                <input type="text" name="organizer">
                            </fieldset>
                            <fieldset class="acquire_date">
                                <legend>취득일</legend>
                                <input type="month" class="acquire" name="awardDate">
                            </fieldset>
                        </div>
                        <div class="contest2">
                            <button type="button" class="addAwardButton">추가하기</button>
                        </div>
                    </div>
                    <div class="result-list">
                        <!-- 동적으로 추가된 리스트 아이템들이 여기에 추가됩니다. -->
                    </div>
                </fieldset>
            </div>
        
            <!-- 취업우대사항 -->
            <div class="Preferential">
                <fieldset class="preferential">
                    <legend class="pre_title">취업우대사항</legend>
                    <div class="pre1">
                        <fieldset class="pre_content">
                            <legend>보훈사유</legend>
                            <input type="text" name="veteranReason" placeholder="보훈사유 입력">
                        </fieldset>
                    </div>
                    <div class="pre2">
                        <fieldset class="mil_sub">
                            <legend>병역대상</legend>
                            <select name="serviceStatus" id="military_status">
                                <option value="not">대상아님</option>
                                <option value="unfulfilled">미필</option>
                                <option value="fulfilled">군필</option>
                                <option value="exempted">면제</option>
                                <option value="serving">복무중</option>
                            </select>
                        </fieldset>
                        <div class="unfulfilled" id="unfulfilledFields" style="display: none;">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="unfinishedReason" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <div class="EXEMPTED" id="exemptedFields" style="display: none;">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="exemptionReason" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <div class="fulfilled" id="fulfilledFields" style="display: none;">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="month" name="enlistmentDate">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="month" name="dischargeDate">
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch">
                                    <option value="1">육군</option>
                                    <option value="2">해군</option>
                                    <option value="3">공군</option>
                                    <option value="4">해병</option>
                                    <option value="5">의경</option>
                                    <option value="6">전경</option>
                                    <option value="7">기타</option>
                                    <option value="8">사회복무요원</option>
                                    <option value="9">의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank">
                                    <option value="1">이병</option>
                                    <option value="2">일병</option>
                                    <option value="3">상병</option>
                                    <option value="4">병장</option>
                                    <option value="5">하사</option>
                                    <option value="6">중사</option>
                                    <option value="7">상사</option>
                                    <option value="8">원사</option>
                                    <option value="9">준위</option>
                                    <option value="10">소위</option>
                                    <option value="11">중위</option>
                                    <option value="12">대위</option>
                                    <option value="13">소령</option>
                                    <option value="14">중령</option>
                                    <option value="15">대령</option>
                                    <option value="16">준장</option>
                                    <option value="17">소장</option>
                                    <option value="18">중장</option>
                                    <option value="19">대장</option>
                                    <option value="20">기타</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>전역사유 선택</legend>
                                <select name="dischargeReason" id="discharge_reason">
                                    <option value="">전역사유</option>
                                    <option value="1">만기전역</option>
                                    <option value="2">의가사전역</option>
                                    <option value="3">의병전역</option>
                                    <option value="4">소집해제</option>
                                    <option value="5">불명예전역</option>
                                    <option value="6">상이전역</option>
                                    <option value="7">기타</option>
                                </select>
                            </fieldset>
                        </div>
                        <div class="serving" id="servingFields" style="display: none;">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="month" name="enlistmentDate">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="month" name="dischargeDate" readonly>
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch">
                                    <option value="1">육군</option>
                                    <option value="2">해군</option>
                                    <option value="3">공군</option>
                                    <option value="4">해병</option>
                                    <option value="5">의경</option>
                                    <option value="6">전경</option>
                                    <option value="7">기타</option>
                                    <option value="8">사회복무요원</option>
                                    <option value="9">의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank">
                                    <option value="1">이병</option>
                                    <option value="2">일병</option>
                                    <option value="3">상병</option>
                                    <option value="4">병장</option>
                                    <option value="5">하사</option>
                                    <option value="6">중사</option>
                                    <option value="7">상사</option>
                                    <option value="8">원사</option>
                                    <option value="9">준위</option>
                                    <option value="10">소위</option>
                                    <option value="11">중위</option>
                                    <option value="12">대위</option>
                                    <option value="13">소령</option>
                                    <option value="14">중령</option>
                                    <option value="15">대령</option>
                                    <option value="16">준장</option>
                                    <option value="17">소장</option>
                                    <option value="18">중장</option>
                                    <option value="19">대장</option>
                                    <option value="20">기타</option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                </fieldset>
            </div>
        
            <!-- 제출 버튼 -->
            <div class="btn_select">
                <button type="submit" class="final_save">작성 완료</button>
            </div>
        </form>
        
        <div class="">
            <button type="button" class="preview">미리 보기</button>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
