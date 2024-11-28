/*
    [테스트용 유저 데이터]
    - 테스트 계정 생성 전에 시퀀스 초기화부터 진행할 것
    - 비밀번호는 암호화된 상태 > 주석 확인
*/

--=======================================================================================================================


/* 개인 회원 */
-- 비밀번호: test1Person.

-- ID: person1
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '홍길동', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person1', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person1@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person2
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '팥쥐', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person2', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person2@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person3
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '김철수', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person3', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person3@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person4
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '이영희', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person4', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person4@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person5
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '박지민', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person5', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person5@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person6
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '최동호', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person6', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person6@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person7
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '김민지', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person7', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person7@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person8
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '황영민', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person8', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person8@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person9
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '최지영', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person9', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person9@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

-- ID: person10
INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '송태영', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person10', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person10@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);


/* 기업 회원 */
-- 비밀번호: test2Business.

-- ID: business1
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700622', '놀부', '(주)도화엔지니어링');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business1', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business1@workdream.co.kr', '01000000000', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business2
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700622', '변사또', '딜로이트');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business2', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business2@workdream.co.kr', NULL, SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business3
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700623', '김상철', '네이버');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business3', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business3@workdream.co.kr', '01000000001', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business4
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700624', '박대성', '메가스터디');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business4', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business4@workdream.co.kr', '01000000002', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business5
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700625', '정은미', '데이터사이언스');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business5', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business5@workdream.co.kr', '01000000003', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business6
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700626', '이상훈', '코웨이');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business6', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business6@workdream.co.kr', '01000000004', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business7
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700627', '최유나', 'HD한국조선해양');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business7', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business7@workdream.co.kr', '01000000005', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business8
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700628', '한예진');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business8', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business8@workdream.co.kr', '01000000006', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business9
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700629', '송재희');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business9', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business9@workdream.co.kr', '01000000007', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business10
INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME, COMPANY_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700630', '윤호성', 'CJ대한통운');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business10', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business10@workdream.co.kr', '01000000008', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);


--=======================================================================================================================


/* 채용공고 목록(임시) */

-- business1
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    SEQ_JOB.NEXTVAL, 1, '(주)도화엔지니어링 상하수도분야', '김철수', '개발팀', 'kim1@example.com', 'W',
    TO_TIMESTAMP('2024-01-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-01-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG', 
    '전형단계 및 제출서류' || CHR(10) ||
    '전형단계 : 서류전형 → 면접전형 → 최종합격' || CHR(10) ||
    '제출서류' || CHR(10) ||
    '- 입사지원서 (자사양식 제출)' || CHR(10) ||
    '- 경력증명서' || CHR(10) ||
    '- 자격증 사본 (해당자에 한함)' || CHR(10) ||
    '접수방법' || CHR(10) ||
    '채용시' || CHR(10) ||
    '접수기간 : 2024.01.25.(월) ~ 채용시 마감' || CHR(10) ||
    '접수방법 : 이메일 (******@*******.***)' || CHR(10) ||
    '문의사항 : 이메일 또는 ☏ ***-****-****' || CHR(10) ||
    '기타 유의사항' || CHR(10) ||
    '입사지원서 및 제출서류에 허위사실이 있을 경우 채용이 취소될 수 있습니다.'
);

-- business2
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    SEQ_JOB.NEXTVAL, 2, '[딜로이트] 경영자문부문 QRM', '박영희', '데이터팀', 'park2@example.com', 'H',
    TO_TIMESTAMP('2024-02-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-02-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting2.PNG', 
    '설립일1987년 02월 14일' || CHR(10) ||
    '기업규모중견기업 (사원수 2,723명)' || CHR(10) ||
    '업종법률·회계' || CHR(10) ||
    '복리후생연차, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 건강검진' || CHR(10) ||
    '주소(07326) 서울특별시 영등포구 국제금융로 10 (여의도동,서울 국제금융 센터) ONE IFC 9F' || CHR(10) ||
    '홈페이지http://-'
);

-- business3
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    SEQ_JOB.NEXTVAL, 3, '네이버 인물검색 운영', '이민수', '기획팀', 'lee3@example.com', 'W',
    TO_TIMESTAMP('2024-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-03-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting3.PNG', 
    '[ 기타사항 ]' || CHR(10) ||
    '- 재택근무 중 업무 기기 장애에 따라 원활한 업무가 불가능한 경우 오피스 출근으로 업무 중단을 최소화해야 함.' || CHR(10) ||
    '- 보훈대상자(취업지원대상자) 및 장애인 등은 관련 법령에 의거하여 우대' || CHR(10) ||
    '- 불합격한 지원자 채용서류 반환 절차는 그린웹서비스 홈페이지 Recruit - 공지사항 11번 게시글 「채용서류 반환 절차 안내 」 참조' || CHR(10) ||
    '(https://recruit.gwebscorp.com/gwebs/notice/8011367Popup)'
);

-- business4
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    SEQ_JOB.NEXTVAL, 4, '[경영지원] 회계1 경력직 채용', '정다영', '회계팀', 'jung4@example.com', 'H',
    TO_TIMESTAMP('2024-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-04-30 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting4.PNG', 
    '설립일2015년 04월 03일' || CHR(10) ||
    '기업규모중견기업 (사원수 1,865명)' || CHR(10) ||
    '업종학원·학습지' || CHR(10) ||
    '주소(06643) 서울특별시 서초구 효령로 321 (서초동)' || CHR(10)
);

-- business5
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    SEQ_JOB.NEXTVAL, 5, '데이터사이언스 (체험형인턴)', '최지훈', '인사팀', 'choi5@example.com', 'W',
    TO_TIMESTAMP('2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-05-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting5.PNG', 
    '우대사항' || CHR(10) ||
    '제조 데이터 분석 경험' || CHR(10) ||
    '관련분야 논문, 공모전 성과 우수자' || CHR(10) ||
    '- 최신 논문(알고리즘)을 이해하고 구현할 수 있는 수준의 연구/개발 능력 보유자' || CHR(10) ||
    '- 오픈소스 기반 최신 딥러닝 프레임워크 활용 능력 보유자 (Tensorflow, Pytorch 등)' || CHR(10) ||
    '커뮤니케이션 역량 우수자' || CHR(10) ||
    '전형절차' || CHR(10) ||
    '지원서 접수(~12/6) → 코딩테스트 (12월 중) → 면접전형 (1월 중)  → 채용 검진 (1월 중) → 입사 (1월 중)' || CHR(10) ||
    '※ 운영 상황에 따라 일부 전형은 온라인으로 진행될 수 있으며, 전형 및 일정 또한 변경될 수 있습니다.'
);


-- business6
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    6, 6, '[코웨이]경영관리본부채용공고', '홍길동', '관리팀', 'hong6@example.com', 'H',
    TO_TIMESTAMP('2024-06-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-06-30 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting6.PNG', 
    '※ 『장애인고용촉진 및 직업재활법』에 따른 등록 장애인 및 『국가유공자 등 예우 및 지원에 관한 법률』 등에 의거한 취업지원 대상자는 관련 법령에 따라 가산점을 부여하고 있습니다.' || CHR(10) ||
    '채용서류의 반환 여부' || CHR(10) ||
    '코웨이의 입사서류는 채용사이트를 통해서 온라인 작성 및 제출을 진행하고 있으므로 채용서류의 반환 의무가 없습니다.' || CHR(10) ||
    '(채용절차의 공정화에 관한 법률 제7조 제1항에 의거)' || CHR(10) ||
    '단, 코웨이가 요구하지 않았으나 자발적으로 제출한 서류가 있을 경우' || CHR(10) ||
    '최종합격 후 30일 이내에 당사 재용사이트에서 채용서류 반환 청구 양식을 작성하시어' || CHR(10) ||
    '채용공식 메일 계정인 naler1004@coway.com 로 송부하시면 청구일로부터 14일 이내 등기우편으로 발송해드립니다.'
);

-- business7
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    7, 7, '[HD한국조선해양] 신사업 지원 채용', '강은혜', '디자인팀', 'kang7@example.com', 'W',
    TO_TIMESTAMP('2024-07-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-07-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG7', 
    '기업규모대기업 (사원수 1,237명)' || CHR(10) ||
    '업종기계·조선·자동차·운송장비' || CHR(10) ||
    '복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원' || CHR(10) ||
    '주소(44032) 울산광역시 동구 방어진순환도로 1000 (전하동)'
);

-- business8
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    8, 8, '2024년 11월 P/J전문직 채용(토목)', '한예진', '토목팀', 'han8@example.com', 'H',
    TO_TIMESTAMP('2024-08-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-08-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG8', 
    '설립일1960년 09월 05일' || CHR(10) ||
    '기업규모대기업 (사원수 1,237명)' || CHR(10) ||
    '업종건설·건축·토목·조경' || CHR(10) ||
    '복리후생연차, 월차, 보건휴가, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 초등학자금지원' || CHR(10) ||
    '주소(51755) 전라남도 나주시 시청길 4 금호산업(주) (송월동)' || CHR(10) ||
    '홈페이지http://www.kumhoenc.com'
);

-- business9
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    9, 9, '조명설계 경력직 채용', '서준호', '설계팀', 'seo9@example.com', 'W',
    TO_TIMESTAMP('2024-09-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-09-30 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG9', 
    '설립일1950년 01월 10일' || CHR(10) ||
    '기업규모대기업 (사원수 7,334명)' || CHR(10) ||
    '업종건설·건축·토목·조경' || CHR(10) ||
    '복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원' || CHR(10) ||
    '주소(03058) 서울특별시 종로구 율곡로 75 (계동)' || CHR(10) ||
    '홈페이지http://www.hdec.kr'
);

-- business10
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO,
    BUSINESS_NO,
    TITLE,
    MANAGER_NAME,
    MANAGER_DEPT,
    MANAGER_EMAIL,
    METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT
) VALUES (
    10, 10, '[CJ대한통운](타이어 물류) 채용', '유지연', '물류팀', 'yoo10@example.com', 'H',
    TO_TIMESTAMP('2024-10-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-10-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG10', 
    '설립일1930년 11월 15일' || CHR(10) ||
    '기업규모대기업 (사원수 7,103명)' || CHR(10) ||
    '업종물류' || CHR(10) ||
    '복리후생주5일근무, 연차, 경조휴가, 국민연금, 의료보험, 산재보험, 고용보험, 사내동호회, 휴양' || CHR(10) ||
    '주소(04513) 서울특별시 중구 세종대로9길 53 (서소문동)' || CHR(10) ||
    '홈페이지http://www.cjlogistics.com'
);


--=======================================================================================================================


/* 지원자 목록(임시) */

-- person1

-- person2

-- person3

-- person4

-- person5

-- person6

-- person7

-- person8

-- person9

-- person10


--=======================================================================================================================

COMMIT;