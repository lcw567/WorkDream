<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listOfJobOpenings.css">
    <script>const contextPath = "${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/js/listOfJobOpenings.js" defer></script>
</head>

<body>
    <div id="List_content">
        <div id="List_Category">
            <a href="#" onclick="setActiveLink(event)">지역별</a>
            <a href="#" onclick="setActiveLink(event)">직업별</a>
            <a href="#" onclick="setActiveLink(event)">HOT100</a>
        </div>

        <br>
        <hr style="margin-left: 22px; margin-right: 645px; border: 1px solid #D8D8D8;">

        <div id="List_content_Center">
            <div id="List_content_Filter">
                <select name="Career" style="border: none; width: 70px;">
                    <option value="104">경력 선택</option>
                    <option value="105">신입</option>
                    <option value="106">경력</option>
                    <option value="107">경력 무관</option>
                </select>
                <select name="Academic" style="margin-left: 8px; border: none; width: 70px;">
                    <option value="104">학력 선택</option>
                    <option value="105">학력 무관</option>
                    <option value="105">고등학교 졸업</option>
                    <option value="105">대학졸업(2,3년)</option>
                    <option value="105">대학교졸업(4년)</option>
                    <option value="105">대학원 석사졸업</option>
                    <option value="105">대학원 박사졸업</option>
                </select>
            </div>

            <div id="Filter_cantain">
                <div class="choce_area" onclick="toggleRegionPopup(event)">
                    <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역 아이콘">
                    <span id="selected_region" style="color: #A09F9F;">지역 선택</span>
                    <div class="region_popup" id="region_popup">
                        <ul onclick="event.stopPropagation();">
                            <li onclick="selectRegion('서울')">서울</li>
                            <li onclick="selectRegion('부산')">부산</li>
                            <li onclick="selectRegion('대구')">대구</li>
                            <li onclick="selectRegion('인천')">인천</li>
                            <li onclick="selectRegion('광주')">광주</li>
                            <li onclick="selectRegion('대전')">대전</li>
                            <li onclick="selectRegion('울산')">울산</li>
                            <li onclick="selectRegion('경기')">경기</li>
                            <li onclick="selectRegion('강원')">강원</li>
                            <li onclick="selectRegion('충북')">충북</li>
                            <li onclick="selectRegion('충남')">충남</li>
                            <li onclick="selectRegion('전북')">전북</li>
                            <li onclick="selectRegion('전남')">전남</li>
                            <li onclick="selectRegion('경북')">경북</li>
                            <li onclick="selectRegion('경남')">경남</li>
                            <li onclick="selectRegion('제주')">제주</li>
                        </ul>
                    </div>
                </div>

                <!-- 상세 구 선택 팝업 -->
                <div class="district_popup" id="district_popup">
                    <div class="district_header">
                        <span id="district_title">구 선택</span>
                        <button onclick="confirmDistrictSelection()" style="margin-left: 75px;">확인</button>
                        <button onclick="closeDistrictPopup()">닫기</button>
                    </div>
                    <div class="district_list" id="district_list">
                        <!-- 구 목록이 동적으로 생성됩니다 -->
                    </div>
                </div>

                <div class="choce_area" onclick="toggleJobPopup(event)">
                    <img src="${pageContext.request.contextPath}/img/icons8-job-24.png" alt="직업 아이콘">
                    <span id="selected_job" style="color: #A09F9F;">직업 선택</span>
                    <div class="job_popup" id="job_popup">
                        <input type="text" placeholder="직업(직무) 또는 관련 분야 입력">
                        <div class="job_categories">
                            <span class="job_category">기획·전략</span>
                            <span class="job_category">마케팅·홍보·조사</span>
                            <span class="job_category">회계·세무·재무</span>
                            <span class="job_category">인사·노무·HRD</span>
                            <span class="job_category">총무·법무·사무</span>
                            <span class="job_category">IT개발·데이터</span>
                            <span class="job_category">디자인</span>
                            <span class="job_category">영업·판매·구매</span>
                            <span class="job_category">고객상담·TM</span>
                            <span class="job_category">구매·자재·물류</span>
                            <span class="job_category">생산·기획·MD</span>
                            <span class="job_category">운전·운송·배송</span>
                            <span class="job_category">서비스</span>
                            <span class="job_category">생산</span>
                            <span class="job_category">건설·건축</span>
                            <span class="job_category">의료</span>
                            <span class="job_category">연구·R&D</span>
                            <span class="job_category">교육</span>
                            <span class="job_category">미디어·문화·스포츠</span>
                            <span class="job_category">금융·보험</span>
                            <span class="job_category">공공·목재</span>
                        </div>
                    </div>
                </div>


                <div class="choce_area">
                    <img src="${pageContext.request.contextPath}/img/icons8-search-24.png">
                    <div style="margin-left: 3px; border: none;">
                        <input type="text" placeholder="검색어 입력"
                            style="width: 260px; height: 26px; border: none; padding-left: 5px;"></input>
                    </div>
                </div>
            </div>

            <h2 style="margin-top: 80px; font-size: 1.1rem;">이 공고, 놓치지 마세요!</h2>
            <div class="list_of_advertisements">
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/(주)국민은행/(주)국민은행.png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/CJ(주)/CJ(주).png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/GS칼텍스(주)/GS칼텍스(주).png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/hd현대/hd현대.png" alt="GS칼텍스 로고" style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div style="display: flex; align-items: center;">
                <h2 style="margin-top: 50px; font-size: 1.1rem;">요즘 뜨는 공고</h2>
                <img src="${pageContext.request.contextPath}/img/free-icon-star-9076891.png"
                    style="width: 30px; height: 30px; margin-left: 10px; margin-top: 34px;">
            </div>

            <div class="list_of_advertisements">
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/(주)국민은행/(주)국민은행.png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/CJ(주)/CJ(주).png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/GS칼텍스(주)/GS칼텍스(주).png" alt="GS칼텍스 로고"
                                style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="announcement">
                    <div class="announcement_inside">
                        <div class="announcement_img">
                            <img src="../공고.logo.기업정보/hd현대/hd현대.png" alt="GS칼텍스 로고" style="width: auto; height: 40px; ">
                        </div>
                        <h2>물류운영,엔지니어,경영지원,EHS 경력 채용</h2>
                        <p>쿠팡몰먼스 서비스(유)</p>
                        <!--지역 | 경력 • 학력 -->
                        <div style="display: flex;">
                            <img src="${pageContext.request.contextPath}/img/icons8-area-32.png" alt="지역" style="width: 18px; height: 16px;">
                            <p style="margin-top: 0px; color: #A09F9F;">서울전체 외 | 경력 • 학력무관</p>
                        </div>
                        <div class="D_day_star-icon">
                            <p><!-- 마감일 날짜 -->D-3</p>
                            <div onclick="toggleStar(this)">
                                <img src="${pageContext.request.contextPath}/img/btn_star_off.png" style="width: 16px; height: 16px;" class="star-icon">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>

</html>