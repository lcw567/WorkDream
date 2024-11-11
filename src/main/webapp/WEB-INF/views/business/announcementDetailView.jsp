<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 채용 공고열람</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/announcementDetailView.css">
    <script src="${pageContext.request.contextPath}/js/announcementDetailView.js" defer></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
    <div class="announcement-container">
        <h1>브랜드다즈 백엔드 개발자(자바/코틀린)</h1>
        <div class="actions">
            <button class="favorite"><span class="star">★</span> 0</button>
            <button class="apply">입사지원</button>
        </div>
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/img/preview_banner.png" alt="작업 이미지">
        </div>
        
        <!-- 기술 스택 섹션 -->
        <div class="tech-stack-section">
            <h2>기술 스택</h2>
            <div class="tech-stack">
                <span class="tech-item">Figma</span>
                <span class="tech-item">Java</span>
                <span class="tech-item">Javascript</span>
            </div>
        </div>
        
        <!-- 주요 업무 섹션 -->
        <div class="main-duties-section">
            <h2>주요 업무</h2>
            <ul>
                <li>React-Native (아이폰/안드로이드) 앱 개발</li>
                <li>앱 성능 향상을 위한 지속적인 업데이트 관리</li>
                <li>사용자 관점에서 앱 UX와 기능의 개선점 제시</li>
                <li>팀원과의 협력을 통해 서비스 이해하고 의견을 제시</li>
                <li>서비스 성능 및 품질 모니터링</li>
            </ul>
        </div>
        
        <!-- 자격 요건 섹션 -->
        <div class="qualifications-section">
            <h2>자격 요건</h2>
            <ul>
                <li>Objective-C, Java, React-Native 등을 활용한 3년 이상 혹은 그에 준하는 개발 능력</li>
                <li>Objective-C, Java, React-Native 등을 활용한 서비스 개발 및 배포 경험 보유</li>
                <li>자료구조, 운영체제, 알고리즘에 대한 이해 및 적용 능력 보유</li>
                <li>다양한 문제에 대해 체계적인 원인 분석 및 해결 능력을 보유</li>
                <li>팀원들과 원활한 커뮤니케이션 할 수 있는 스킬이 있으신 분</li>
                <li>빠르게 적응하며 자기 주도적으로 일하실 분</li>
                <li>포트폴리오 제출 필수: 개발 작성 내용 포함 - 본인이 최소 50% 이상 참여한 화면만 넣어주세요.</li>
            </ul>
        </div>
        
        <!-- 우대 사항 섹션 -->
        <div class="preferred-qualifications-section">
            <h2>우대 사항</h2>
            <ul>
                <li>Objective-C, Java, React-Native 등을 활용한 3년 이상 혹은 그에 준하는 개발 능력</li>
                <li>Objective-C, Java, React-Native 등을 활용한 서비스 개발 및 배포 경험 보유</li>
                <li>자료구조, 운영체제, 알고리즘에 대한 이해 및 적용 능력 보유</li>
                <li>다양한 문제에 대해 체계적인 원인 분석 및 해결 능력을 보유</li>
                <li>팀원들과 원활한 커뮤니케이션 할 수 있는 스킬이 있으신 분</li>
                <li>빠르게 적응하며 자기 주도적으로 일하실 분</li>
                <li>포트폴리오 제출 필수: 개발 작성 내용 포함 - 본인이 최소 50% 이상 참여한 화면만 넣어주세요.</li>
            </ul>
        </div>
        
        <!-- 추가 우대 사항 섹션 -->
        <div class="additional-preferred-qualifications-section">
            <h2>추가 우대 사항</h2>
            <ul>
                <li>크로스 플랫폼 디자인 시스템 구축 경험 보유자</li>
                <li>코드 퀄리티 향상 및 유지에 꾸준히 노력하시는 분</li>
                <li>마켓플레이스 서비스 구축 경험이 있으신 분</li>
                <li>고난도 성능 문제 진단 및 해결 경험자</li>
                <li>데이터 수집 및 분석 등에 경험 및 관심이 있으신 분</li>
                <li>콘텐츠 산업에 대한 관심이 많으신 분</li>
                <li>주도적으로 과업을 설정하고 해결할 때 성취감을 느끼시는 분</li>
            </ul>
        </div>
        
        <!-- 채용 절차 섹션 -->
        <div class="hiring-process-section">
            <h2>채용 절차</h2>
            <p>서류 전형 > 전화 인터뷰 > 직무 인터뷰 > 대표 인터뷰 > 처우 협의 > 최종 합격</p>
        </div>
        
        <!-- 복지 및 혜택 섹션 -->
        <div class="benefits-section">
            <h2>복지 및 혜택</h2>
            <ul>
                <li>장비지원: iMac 또는 MacBook Pro with 27인치 모니터</li>
                <li>점심 제공</li>
                <li>커피 음료 과자 무한 제공</li>
                <li>도서/세미나/스터디/강의 성장 지원</li>
                <li>명절 선물 지급</li>
                <li>논현역에서 1분 거리</li>
                <li>근무시간: 탄력근무제</li>
                <li>고용형태: 정규직 (수습기간 3개월, 월급 동일)</li>
            </ul>
        </div>
        
        <!-- 업무 환경 섹션 -->
        <div class="work-environment-section">
            <h2>업무 환경</h2>
            <table class="work-environment-table">
                <tr>
                    <td><strong>근무 요일</strong></td>
                    <td>주 5일 근무</td>
                </tr>
                <tr>
                    <td><strong>근무 시간</strong></td>
                    <td>09:00 ~ 18:00</td>
                </tr>
                <tr>
                    <td><strong>예상 연봉</strong></td>
                    <td>면접시 협의</td>
                </tr>
                <tr>
                    <td><strong>근무 형태</strong></td>
                    <td><span class="employment-type">정규직</span> 수습기간 3개월</td>
                </tr>
            </table>
        </div>

        <br><hr>
        
        <!-- 채용 정보 섹션 -->
        <div class="job-info-section">
            <table class="job-info-table">
                <tr>
                    <td><strong>경력</strong></td>
                    <td>신입</td>
                </tr>
                <tr>
                    <td><strong>학력</strong></td>
                    <td>무관</td>
                </tr>
                <tr>
                    <td><strong>마감일</strong></td>
                    <td>2024-06-28 24:00</td>
                </tr>
                <tr>
                    <td><strong>근무지 주소</strong></td>
                    <td>서울 강남구 테헤란로 2길 3층</td>
                </tr>
            </table>
            <br><hr>
            <div class="apply-button">
                <button class="apply">입사지원</button>
            </div>
        </div>
        
        <!-- 기업 정보 섹션 -->
        <div class="company-info-section">
            <h2>기업 정보</h2>
            <div class="company-info">
                <div class="company-header">
                    <span class="company-name">(주) 아이더스에프앤비</span>
                    <button class="interest-button">
                        <span class="icon">🌙</span> 관심기업
                    </button>
                </div>
                <div class="company-content">
                    <div class="company-details">
                        <table>
                            <tr>
                                <td><strong>대표자명</strong></td>
                                <td>홍길동</td>
                                <td><strong>기업형태</strong></td>
                                <td>중소기업</td>
                            </tr>
                            <tr>
                                <td><strong>업종</strong></td>
                                <td>웹 개발자</td>
                                <td><strong>사원수</strong></td>
                                <td>105명</td>
                            </tr>
                            <tr>
                                <td><strong>설립일</strong></td>
                                <td>2024년 06월 28일</td>
                                <td><strong>기업주소</strong></td>
                                <td>서울특별시 강남구 강남구 테헤란로14길 6</td>
                            </tr>
                            <tr>
                                <td><strong>홈페이지</strong></td>
                                <td colspan="3"><a href="https://codesync.com" target="_blank">https://codesync.com</a></td>
                            </tr>
                        </table>
                        <div class="view-more">
                            <button onclick="location.href='${pageContext.request.contextPath}/business/businessProfileView'">기업정보 전체보기 ➔</button>
                        </div>
                    </div>
                    <div class="company-logo">
                        <img src="${pageContext.request.contextPath}/img/logo_icon.png" alt="Work Dream 로고">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
