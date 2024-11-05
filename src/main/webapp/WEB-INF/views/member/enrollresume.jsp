<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크드림</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/enrollresume.css">
<script src="${pageContext.request.contextPath}/js/enrollresume.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
        <div id="inner">
            <div class="resume_title">
                <h1>이력서 제목</h1> <input type="text" placeholder="이력서의 제목을 입력해주세요.">
            </div>
            <div class="Info">
                <fieldset class="basic_info">
                    <legend class="b_Info">기본정보</legend>
                    <div id="basic1">
                        <fieldset class="name">
                            <legend class="username">이름*</legend>
                            <input type="text" name="username">
                        </fieldset>
                        <fieldset class="gender">
                            <select name="usergender" id="selectgender">
                                <option value="male">남</option>
                                <option value="female">여</option>
                            </select>
                        </fieldset>
                        <fieldset class="birthday">
                            <legend class="userbirth">생년월일*</legend>
                            <input type="date">
                        </fieldset>
                    </div>
                    <div id="basic2">  
                        <fieldset class="email">
                            <legend class="useremail">이메일*</legend>
                            <input type="email" name="useremail">
                        </fieldset>
                        <button class="email_check">인증</button>
                    </div>
                    <div id="basic3">  
                        <fieldset class="phone">
                            <legend class="userphone">전화번호*</legend>
                            <input type="text" name="userphone">
                        </fieldset>
                        <button class="phone_check">인증</button>
                    </div>
                    <div id="basic4">
                        <fieldset class="address">
                            <legend class="useraddress">주소*</legend>
                            <input type="text" name="useraddress" placeholder="주소를 입력해주세요.">
                        </fieldset>
                        <fieldset class="dtaddress">
                            <legend class="userdtaddress">상세주소*</legend>
                            <input type="text" name="userdtaddress" placeholder="상세주소를 입력해주세요.">
                        </fieldset>
                    </div>
                </fieldset>
            </div>
            <div class="education">
                <fieldset class="education_Lv">
                    <legend class="edu_Lv">학력</legend>
                    <div id="edu1">
                        <div class="edu_inner1">
                            <fieldset class="final_edu">
                                <select name="useredu" id="selectedu" onchange="displayEducationFields()">
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
                                        <input type="text" name="elementarySchoolName" class="element_name">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 여부 *</legend>
                                        <select name="elementaryGraduationStatus" class="status">
                                            <option value="graduate">졸업</option>
                                            <option value="withdraw">중퇴</option>
                                        </select>
                                    </fieldset>
                                    <div class="exam">
                                        <label>중입 검정고시(초졸)</label>
                                        <input type="checkbox" name="elementaryGed" class="exam_status">
                                    </div>
                                </div>
                                <div class="form-group2">
                                    <fieldset class="input-group">
                                        <legend>입학 년월</legend>
                                        <input type="month" name="elementaryAdmissionDate" class="enter_date">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 년월</legend>
                                        <input type="month" name="elementaryGraduationDate" class="end_date">
                                    </fieldset>
                        
                                    <fieldset class="input-group">
                                        <legend>지역 선택</legend>
                                        <select name="elementaryRegion" class="select_lo">
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
                                        <input type="text" name="middleSchoolName" class="middle_name">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 여부 *</legend>
                                        <select name="middleGraduationStatus" class="status">
                                            <option value="graduate">졸업</option>
                                            <option value="withdraw">중퇴</option>
                                        </select>
                                    </fieldset>
                                    <div class="exam">
                                        <label>고입 검정고시(중졸)</label>
                                        <input type="checkbox" name="middleGed" class="exam_status">
                                    </div>
                                </div>
                                <div class="form-group2">
                                    <fieldset class="input-group">
                                        <legend>입학 년월</legend>
                                        <input type="month" name="middleAdmissionDate" class="enter_date">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 년월</legend>
                                        <input type="month" name="middleGraduationDate" class="end_date">
                                    </fieldset>
                        
                                    <fieldset class="input-group">
                                        <legend>지역 선택</legend>
                                        <select name="middleRegion" class="select_lo">
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
                                        <input type="text" name="highSchoolName" class="high_name">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 여부 *</legend>
                                        <select name="highGraduationStatus" class="status">
                                            <option value="graduate">졸업</option>
                                            <option value="graduate">재학중</option>
                                            <option value="graduate">중퇴</option>
                                            <option value="graduate">졸업예정</option>
                                        </select>
                                    </fieldset>
                                    <div class="exam">
                                        <label>대입 검정고시</label>
                                        <input type="checkbox" name="highGed" class="exam_status">
                                    </div>
                                </div>
                                <div class="form-group2">
                                    <fieldset class="input-group">
                                        <legend>입학 년월</legend>
                                        <input type="month" name="highAdmissionDate" class="enter_date">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 년월</legend>
                                        <input type="month" name="highGraduationDate" class="end_date">
                                    </fieldset>
                        
                                    <fieldset class="input-group">
                                        <legend>지역 선택</legend>
                                        <select name="highRegion" class="select_lo">
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
                                        <input type="text" name="collegeName" class="college_name">
                                    </fieldset>

                                    <fieldset class="input-group">
                                        <legend>전공 *</legend>
                                        <input type="text" name="major" class="major_name">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>학제 *</legend>
                                        <select name="collegedegree" class="degree">
                                            <option value="2year">2년제</option>
                                            <option value="3year">3년제</option>
                                            <option value="4year">4년제</option>
                                            <option value="master">대학원(석사)</option>
                                            <option value="dr">대학원(박사)</option>
                                        </select>
                                    </fieldset>

                                    <fieldset class="input-group">
                                        <legend>졸업 여부 *</legend>
                                        <select name="collegeGraduationStatus" class="status">
                                            <option value="graduate">졸업</option>
                                            <option value="attending ">재학중</option>
                                            <option value="absence">휴학중</option>
                                            <option value="leave">중퇴</option>
                                            <option value="dropping ">자퇴</option>
                                            <option value="Expected ">졸업예정</option>
                                        </select>
                                    </fieldset>
                                </div>
                                <div class="form-group2">
                                    <fieldset class="input-group">
                                        <legend>입학 년월</legend>
                                        <input type="month" name="collegeAdmissionDate" class="enter_date">
                                    </fieldset>
                                    
                                    <fieldset class="input-group">
                                        <legend>졸업 년월</legend>
                                        <input type="month" name="collegeGraduationDate" class="end_date">
                                    </fieldset>
                        
                                    <fieldset class="input-group">
                                        <legend>지역 선택</legend>
                                        <select name="collegeRegion" class="select_lo">
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
            <div class="Career">
                <fieldset class="career">
                    <legend class="career_Lv">경력</legend>
                    <div class="career1">
                        <fieldset class="company_title">
                            <legend>회사명</legend>
                            <input type="text" class="com_title" name="com_title">
                        </fieldset>
                        <fieldset class="enter_com">
                            <legend>입사년월</legend>
                            <input type="date" class="enter_com" name="enter_com">
                        </fieldset>
                        <fieldset class="retire_com">
                            <legend>퇴사년월</legend>
                            <input type="date" class="retire_com" name="retire_com">
                        </fieldset>
                        <fieldset class="input-group">
                            <legend>근무현황</legend>
                            <select name="career_status" class="career_status">
                                <option value="working">재직중</option>
                                <option value="retire">퇴사</option>
                                <option value="retire_plan">퇴사예정</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="career2">
                        <fieldset class="job">
                            <legend>직무</legend>
                            <input type="text" class="job_name" name="job_name">
                        </fieldset>
                        <fieldset class="department">
                            <legend>근무부서</legend>
                            <input type="text" class="department_name" name="department_name">
                        </fieldset>
                        <fieldset class="position">
                            <legend>직급/직책</legend>
                            <input type="text" class="position_name" name="position_name">
                        </fieldset>
                    </div>
                    <div class="career3">
                        <fieldset class="job_content">
                            <legend>담당업무</legend>
                            <textarea name="job_content" id="j_content" placeholder="담당업무를 입력해주세요.

- 진행한 업무를 다 적기보다는 경력사항 별로 중요합니다!

- 담당한 업무 내용을 요약해서 작성해보세요!

- 경력별 프로젝트 내용을 적을 경우, 역할/팀구성/기여도/성과를 기준으로 요약해서 작성해보세요!"></textarea>
                        </fieldset>
                    </div>
                </fieldset>
            </div>
            <div id="Skill">
                <fieldset class="skill">
                    <legend class="skill_name">스킬</legend>
                    <div id="sk_title1">
                        <fieldset class="skill_title">
                            <input type="text" name="sk_title" placeholder="툴/직무역량/소프트스킬을 입력해주세요.">
                        </fieldset>
                        <button>추가하기</button>
                    </div>
                    <div id="sk_title2">

                    </div>
                </fieldset>
            </div>
        </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>