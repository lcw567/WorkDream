/*
    [테스트용 유저 데이터]
    - 테스트 계정 생성 전에 시퀀스 초기화부터 진행할 것
    - 비밀번호는 암호화된 상태 > 주석 확인
*/

--=======================================================================================================================
SET DEFINE OFF;


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
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700622', '박승우/손영일/곽준상/김덕구',
    '(주)도화엔지니어링', '서울 강남구 삼성로 438', 'http://www.dohwa.co.kr',
    '/resources/uploads/logos/business1_logo.png',
    '1000대기업, 중견기업, 코스피, 주식회사', 2284, '건물 및 토목 엔지니어링 서비스업', '도화엔지니어링'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business1', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business1@workdream.co.kr', '01000000000', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business2
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700622', '배재민',
    '딜로이트컨설팅(유)', '서울 영등포구 국제금융로 10', 'http://www2.deloitte.com/kr/ko.html',
    '/resources/uploads/logos/business2_logo.png',
    '중소기업, 외국 법인기업, 유한회사', 384, '경영 컨설팅업', '딜로이트 컨설팅'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business2', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business2@workdream.co.kr', NULL, SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business3
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700623', '김상철',
    '네이버(주)', '경기도 성남시 분당구 정자일로 95', 'https://www.naver.com/',
    '/resources/uploads/logos/business3_logo.png',
    '대기업', 4341, '온라인 검색포털', 'Naver'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business3', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business3@workdream.co.kr', '01000000001', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business4
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700624', '손성은',
    '메가스터디교육(주)', '서울 서초구 효령로 321', 'http://corp.megastudy.net',
    '/resources/uploads/logos/business4_logo.png',
    '코스닥, 중견기업, 주식회사, 외부감사법인', NULL, '온라인 교육 학원', '메가스터디, 엘리하이, 엠베스트, 메가스터디학원, 러셀, 메가공무원'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business4', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business4@workdream.co.kr', '01000000002', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business5
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700625', '강한승/박대준',
    '쿠팡(주)', '서울 송파구 송파대로 570, 18층', 'http://www.coupang.com',
    '/resources/uploads/logos/business5_logo.png',
    '1000대기업, 대기업, 주식회사, 외부감사법인', 11276, '전자상거래 소매업', '쿠팡'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business5', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business5@workdream.co.kr', '01000000003', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business6
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700626', '서장원',
    '코웨이(주)', '충남 공주시 유구읍 유구마곡사로 136-23', 'https://company.coway.com/',
    '/resources/uploads/logos/business6_logo.png',
    '대기업, 코스피, 주식회사, 외부감사법인, 수출입 기업', 5757, '그 외 기타 달리 분류되지 않은 개인 서비스업', '코웨이'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business6', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business6@workdream.co.kr', '01000000004', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business7
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700627', '서흥원',
    '에이치디현대이엔티(주)', '울산 동구 문현6길 42', 'http://www.hd-hent.co.kr',
    '/resources/uploads/logos/business7_logo.png',
    '대기업, 외부감사법인', 1337, '기타 엔지니어링 서비스업', 'HD현대이엔티'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business7', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business7@workdream.co.kr', '01000000005', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business8
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700628', '조완석',
    '금호건설(주)', '전남 나주시 시청길 4', 'http://www.kumhoenc.com',
    '/resources/uploads/logos/business8_logo.png',
    '1000대기업, 대기업, 코스피, 주식회사', 1220, '건물 건설업', '금호건설'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business8', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business8@workdream.co.kr', '01000000006', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business9
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700629', '송재희',
    '(주)영공조명', '서울 영등포구 양평로 146', 'http://www.youngkong.com',
    '/resources/uploads/logos/business9_logo.png',
    '중소기업, 주식회사, 수출입 기업', NULL, NULL, '영공조명'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business9', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business9@workdream.co.kr', '01000000007', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

-- ID: business10
INSERT INTO BUSINESS (
    BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME,
    COMPANY_NAME, COMPANY_ADDR, COMPANY_SITE,
    LOGO,
    COMPANY_TYPE, EMPLOYEE_COUNT, INDUSTRY, BRAND_NAME
) VALUES (
    SEQ_BNO.NEXTVAL, '8518700630', '신영수/민영학',
    '씨제이대한통운(주)', '서울 종로구 종로5길 7', 'http://www.cjlogistics.com',
    '/resources/uploads/logos/business10_logo.png',
    '1000대기업, 대기업, 코스피, 주식회사', 6254, '도로 화물 운송업', '클럽나인브릿지'
);
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business10', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business10@workdream.co.kr', '01000000008', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);


--기업 한줄소개, 기업소개, 기업비전 추거

-- BUSINESS_NO = 1: (주)도화엔지니어링
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '도화가 디자인하는 세상, 함께 만들어 가는 미래',
    INTRODUCTION = '[[해외사업]
· 최근 급격히 성장하고 있는 신흥국을 대상으로 당사의 주력분야인 설계와 감리용역을 집중 공략하고 이외에도 다양한 분야로의 진출 진행 중

· 신흥국들은 전기에너지, 교통, 상하수도, 철도 등의 기본적인 인프라 공급이 열악한 상태이나 경제성장, 산업화 및 근대화, 빈곤퇴치, 지역 균형발전, 재정확보, 금융환경 개선을 목표로 장기 인프라 건설 마스터플랜을 수립하고 효율적인 인프라 건설을 추진하고 있어 건설시장의 경우 매년 급 성장 중


[환경사업]

· 정부는 농어촌, 도서 등 환경 서비스 취약지역에 대해 상하수도 등 환경기초시설을 확충해 나가고 오염 농도가 높은 가축분뇨의 처리시설은 해양 투기가 금지되어 수질개선사업에 대한 투자가 지속적으로 이루어질 전망

· 상하수도에 특화된 전문기업으로서 R&D투자를 통한 고부가가치의 환경기술 개발을 중점적으로 추진하는 한편 기술의 상용화·상업화에 대한 투자를 강화시켜 해외수출까지 육성해 나갈 계획


[원자력발전소 설계]

· 전력산업기술기준을 취득함으로써 원자력 구조물 설계용역을 직접 수주해 설계할 수있고 원전시장 설계자로 참여할 수 있음에 따라 국내 토목설계에서 축척된 노하우를 바탕으로 국내 뿐만아니라 세계 원전 시장에 대비해 나갈 계획
]',
    VISION = '주요 사업내용 : 상하수도, 수자원개발, 도시계획, 조경, 도로교통, 교량, 터널, 항만, 철도, 환경 등 
엔지니어링 전 분야에서 기획, 타당성조사, 설계, 분석, 시험, 감리, 시운전, 평가, 자문주요 

취급품목 : 토목설계, 공사감리, 건설사업관리, 시설물안전진단, 토질조사, 공공측량, 환경영향평가'
WHERE BUSINESS_NO = 1;

-- BUSINESS_NO = 2: 딜로이트컨설팅(유)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = 'Global No.1 종합 컨설팅 펌',
    INTRODUCTION = '딜로이트 컨설팅은 세계 최대의 회계·컨설팅 그룹 딜로이트 투쉬 토마츠(DTTL)의 멤버펌인 딜로이트 아시아퍼시픽(Deloitte Asia Pacific)의 구성펌(Participating Firm)입니다.

딜로이트 컨설팅은 비즈니스 조류를 읽는 안목으로 전 분야에 걸쳐 전문가의 통찰력과 창의적인 아이디어를 결합한 최상의 결론을 도출하는 컨설팅을 제공해 드립니다.

소비재 및 물류산업, 금융산업, 제조업 등 특화된 산업 전문가 그룹과 함께 각 산업에 최적화된 고객 서비스를 제공함으로써 급변하는 시장 변화 및 트렌드에 고객들이 기민하게 대응하며 경쟁력을 강화할 수 있도록 지원하고 있습니다.',
    VISION = '딜로이트 컨설팅 코리아는 ‘’Explore. Become. at Deloitte’’라는 Talent Vision 아래, 다양한 역량과 목표를 가진 인재들이 자신만의 Career Path를 개척하고, 각자의 분야에서 전문가로 성장할 수 있는 차별화된 환경을 제공합니다.'
WHERE BUSINESS_NO = 2;

-- BUSINESS_NO = 3: 네이버(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '혁신적인 기술로 세상을 연결하는 대한민국 대표 인터넷 기업',
    INTRODUCTION = '네이버는 검색 엔진, 온라인 광고, 전자상거래, 클라우드 서비스 등 다양한 인터넷 서비스를 제공하는 대한민국의 선도적인 IT 기업입니다. 
사용자 중심의 혁신적인 기술과 서비스를 통해 글로벌 시장에서 경쟁력을 확보하며, 지속 가능한 성장을 추구하고 있습니다. 
네이버는 끊임없는 연구개발과 창의적인 아이디어를 바탕으로 디지털 생태계를 구축하고, 
사용자들에게 최고의 인터넷 경험을 제공하기 위해 노력하고 있습니다.',
    VISION = 'AI와 빅데이터를 활용하여 인간의 삶을 풍요롭게 하고, 
디지털 생태계를 선도하며, 전 세계 사용자에게 최고의 인터넷 경험을 제공하는 것을 목표로 합니다. 
네이버는 지속 가능한 혁신을 통해 글로벌 시장에서의 리더십을 강화하고, 
사회적 책임을 다하며 모두가 함께 성장하는 미래를 만들어 나가고자 합니다.'
WHERE BUSINESS_NO = 3;

-- BUSINESS_NO = 4: 메가스터디교육(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '미래를 여는 교육의 선두주자, 메가스터디',
    INTRODUCTION = '메가스터디는 대한민국을 대표하는 교육 전문 기업으로, 온라인 및 오프라인을 아우르는 다양한 교육 서비스를 제공합니다. 
입시 준비, 자격증 교육, 평생 학습 등 학생부터 성인까지 모든 연령층을 대상으로 한 맞춤형 교육 솔루션을 제공하며, 
혁신적인 디지털 플랫폼과 우수한 강사진을 바탕으로 학습 효과를 극대화하고 있습니다. 
메가스터디는 지속적인 연구개발과 교육 콘텐츠의 고도화를 통해 교육의 질을 향상시키고, 
교육의 기회를 넓혀 모두가 꿈을 실현할 수 있는 사회를 만드는 데 기여하고 있습니다.',
    VISION = '메가스터디는 첨단 기술과 창의적인 교육 방법을 결합하여 모든 이에게 평등한 교육 기회를 제공하고, 
글로벌 교육 시장에서의 리더십을 확립하는 것을 목표로 합니다. 
지속 가능한 성장을 추구하며, 혁신적인 교육 솔루션을 통해 학습자의 잠재력을 최대한 발휘할 수 있도록 지원하고, 교육을 통한 사회적 가치 창출에 앞장서고자 합니다.'
WHERE BUSINESS_NO = 4;

-- BUSINESS_NO = 5: 쿠팡(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '혁신적인 물류 시스템으로 고객 만족을 실현하는 대한민국 대표 전자상거래 기업',
    INTRODUCTION = '쿠팡(주)은 대한민국을 대표하는 전자상거래 기업으로, 
최첨단 물류 시스템과 사용자 중심의 플랫폼을 통해 다양한 상품과 서비스를 제공하고 있습니다. 
고객의 편의성과 만족을 최우선으로 생각하며, 
빠르고 정확한 배송 서비스를 통해 시장을 선도하고 있습니다. 
쿠팡은 지속적인 기술 혁신과 데이터 분석을 바탕으로 고객의 니즈를 충족시키는 맞춤형 서비스를 개발하고 있으며, 
글로벌 시장에서도 경쟁력을 강화하기 위해 노력하고 있습니다. 
또한, 쿠팡은 직원들의 성장과 발전을 지원하는 다양한 프로그램을 운영하며, 
긍정적이고 창의적인 기업 문화를 조성하고 있습니다.',
    VISION = '쿠팡은 ''고객 중심''의 경영 철학을 바탕으로, 최상의 쇼핑 경험을 제공하는 것을 목표로 합니다. 
첨단 기술과 혁신적인 물류 시스템을 통해 전 세계 고객에게 빠르고 편리한 서비스를 제공하며, 
글로벌 전자상거래 시장에서의 리더십을 확립하고자 합니다. 지속 가능한 성장을 추구하며, 
사회적 책임을 다하고 모두가 함께 발전하는 미래를 만들어 나가고자 합니다.'
WHERE BUSINESS_NO = 5;

-- BUSINESS_NO = 6: 코웨이(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '더 나은 세상과 편리한 일상을 제공하는 대한민국 대표 환경가전 기업',
    INTRODUCTION = '코웨이㈜는 1989년 설립된 대한민국의 선도적인 환경가전 기업으로, 정수기, 공기청정기, 비데, 매트리스 등 다양한 생활 편의 제품을 생산 및 판매하고 있습니다. 
최첨단 기술력과 디지털 경쟁력을 바탕으로 고객의 건강하고 편리한 생활환경을 조성하며, 
IoT와 빅데이터를 활용한 스마트 홈 솔루션을 통해 혁신적인 제품과 서비스를 제공합니다. 
코웨이는 지속적인 연구개발과 품질 관리를 통해 국내외 시장에서 신뢰받는 브랜드로 자리매김하고 있으며, 글로벌 시장에서도 경쟁력을 강화하고 있습니다.',
    VISION = '코웨이는 ''Best Life Solution Company''를 비전으로 삼아, 혁신을 통해 건강하고 편리한 생활환경을 창출하고자 합니다. 
지속 가능한 성장을 추구하며, 디지털 혁신과 ESG 경영을 강화하여 고객과 사회에 가치를 제공하고, 
모두가 함께 발전하는 미래를 만들어 나가고자 합니다.'
WHERE BUSINESS_NO = 6;

-- BUSINESS_NO = 7: 에이치디현대이엔티(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '최고의 기술과 품질로 글로벌 시장을 선도하는 종합 엔지니어링 기업',
    INTRODUCTION = '에이치디현대이엔티㈜는 2004년 설립된 대한민국의 대표적인 엔지니어링 서비스 기업으로, 선박 설계, 건조 검사, 엔지니어링, 인력 공급, 안전 관리 등 다양한 분야에서 전문적인 서비스를 제공합니다. 
HD현대그룹의 일원으로서, 조선, 해양, 건설기계 등 여러 산업 분야에서 세계 최고 수준의 기술력과 품질을 바탕으로 고객의 성공적인 미래를 함께 만들어가고 있습니다. 
지속적인 연구개발과 혁신을 통해 글로벌 시장에서의 경쟁력을 강화하며, 고객 만족을 최우선으로 하는 경영 철학을 실현하고 있습니다.',
    VISION = '에이치디현대이엔티㈜는 ''최고의 기술과 품질으로 고객의 가치를 창출하는 글로벌 리더''를 비전으로 삼아, 
지속 가능한 성장을 추구하고 있습니다. 첨단 기술과 창의적인 솔루션을 통해 고객의 다양한 요구를 충족시키며, 
사회적 책임을 다하고 모두가 함께 발전하는 미래를 만들어 나가고자 합니다.'
WHERE BUSINESS_NO = 7;

-- BUSINESS_NO = 8: 금호건설(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '국내외 건설 분야에서 혁신과 신뢰를 바탕으로 성장하는 종합건설 기업',
    INTRODUCTION = '금호건설㈜는 1967년 창립 이래 도심공항터미널, 아셈 컨벤션 센터, 인천국제공항, 천안-논산 고속도로, 인천 LNG 생산기지 저장탱크 등 국가 기반시설의 건설을 주도하며 대한민국의 발전에 기여해왔습니다. 
2022년 3월에는 국내 하수처리시설 건설 기술인 KIDEA 공법으로 장영실상을 수상하며 기술력을 인정받았습니다. 
또한, 2003년부터 아파트 브랜드 ''어울림''을 런칭하여 주거 문화를 선도하고 있습니다.',
    VISION = '금호건설은 ''업계 최고 1등의 기업가치를 창출하는 아름다운 기업''을 비전으로 삼고 있습니다. 
이를 위해 지탄받지 않고 약속을 지키며, 사회적 책임을 다하는 신뢰받는 기업으로서의 역할을 수행하고자 합니다. 
또한, 열정과 집념을 가진 ''아름다운 사람''들이 모여 새로운 금호아시아나를 만들어가고 있습니다.'
WHERE BUSINESS_NO = 8;

-- BUSINESS_NO = 9: ㈜영공조명
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '아웃도어 조명 분야에서 혁신과 품질으로 삶의 질을 높이는 조명 전문 기업',
    INTRODUCTION = '㈜영공조명은 1984년 설립되어 인테리어 조명기구 생산을 시작으로, 현재는 아웃도어 조명 분야에서 독자적인 기술력과 디자인 역량을 갖춘 대한민국 대표 조명 기업입니다.
조경 및 건축에 특화된 조명을 자체적으로 연구 개발하여 생산하며, 인천공항 제2터미널, 서울대학교 정문 경관조명 등 다양한 프로젝트를 성공적으로 수행하였습니다. 
창립 40주년을 맞이한 2024년에는 자연 친화적인 볼라드 조명 ''아일라''와 콤팩트 라인등 ''펜슬 플러스'' 등 혁신적인 신제품을 출시하며, 
모든 생명체의 삶의 질을 높이는 미래 조명을 지향하고 있습니다.',
    VISION = '㈜영공조명은 ''인간 중심적인 조명''을 통해 자연과 더불어 사는 환경을 조성하고, 
미래 스마트시티에서 아웃도어 조명의 새로운 가능성을 탐구하며, 
글로벌 경쟁력을 갖춘 프리미엄 아웃도어 조명 기업으로 성장하는 것을 목표로 합니다.'
WHERE BUSINESS_NO = 9;

-- BUSINESS_NO = 10: 씨제이대한통운(주)
UPDATE BUSINESS
SET 
    SHORT_INTRODUCTION = '혁신적인 물류 솔루션으로 글로벌 시장을 선도하는 대한민국 대표 종합물류기업',
    INTRODUCTION = '씨제이대한통운㈜는 1930년 설립되어 90년 이상의 역사를 가진 대한민국 대표 종합물류기업입니다. 
계속되는 도전과 혁신을 통해 물류산업의 역사를 새로이 써왔으며, 
첨단 융복합 기술 개발과 지속적인 투자로 글로벌 네트워크를 확장하여 세계 물류시장을 선도하는 글로벌 혁신물류기업으로 도약하고 있습니다.',
    VISION = '씨제이대한통운은 ''1등·초격차·글로벌 역량''을 기반으로 국내 최고를 넘어 글로벌 리딩기업으로 도약하고자 합니다. 
이를 위해 지속적인 혁신과 도전을 통해 글로벌 물류시장을 선도하는 SCM 솔루션 기업으로 성장하고 있습니다.'
WHERE BUSINESS_NO = 10;


--=======================================================================================================================


/* 채용공고 목록(임시) */

-- business1
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 1, '도화엔지니어링 도시단지1부 경력직 모집(단지설계, 계획)',
    '김철수', '개발팀', 'kim1@example.com', 'W',
    TO_DATE(TO_CHAR(SYSDATE - 15, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(SYSDATE, 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business1/recruitment/business1_recruitment_01.png',
    '전형단계 및 제출서류' || CHR(10) ||
    '전형단계 : 서류전형 → 면접전형 → 최종합격' || CHR(10) ||
    '제출서류' || CHR(10) ||
    '- 입사지원서 (자사양식 제출)' || CHR(10) ||
    '- 경력증명서' || CHR(10) ||
    '- 자격증 사본 (해당자에 한함)' || CHR(10) ||
    '접수방법' || CHR(10) ||
    '채용시' || CHR(10) ||
    '접수기간 : 2024.XX.XX.(월) ~ 채용시 마감' || CHR(10) ||
    '접수방법 : 이메일 (******@*******.***)' || CHR(10) ||
    '문의사항 : 이메일 또는 ☏ ***-****-****' || CHR(10) ||
    '기타 유의사항' || CHR(10) ||
    '입사지원서 및 제출서류에 허위사실이 있을 경우 채용이 취소될 수 있습니다.',
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '서류전형',
    TO_TIMESTAMP(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 15, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '면접전형',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 15, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 30, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_POSITION (POSITION_NO, RECRUITMENT_NO, POSITION_NAME, POSITION_RANK, EMPLOYMENT_FORM, RECRUITED_PEOPLE)
VALUES (NULL, SEQ_JOB.CURRVAL, '단지설계(토목) 및 도시계획	', '과장, 차장, 부장', 'R', 0);

-- business2
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 2, '[딜로이트 컨설팅] 24년 하반기 각 부문별 컨설턴트 경력직 채용',
    '박영희', '인사팀', 'park2@example.com', 'H',
    TO_DATE(TO_CHAR(SYSDATE - 30, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 33, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business2/recruitment/business2_recruitment_01.png',
    '설립일1987년 02월 14일' || CHR(10) ||
    '기업규모중견기업 (사원수 2,723명)' || CHR(10) ||
    '업종법률·회계' || CHR(10) ||
    '복리후생연차, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 건강검진' || CHR(10) ||
    '주소(07326) 서울특별시 영등포구 국제금융로 10 (여의도동,서울 국제금융 센터) ONE IFC 9F' || CHR(10) ||
    '홈페이지http://-',
    'P'
);

-- business3
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 3, '네이버 인물검색 운영',
    '이민수', '기획팀', 'lee3@example.com', 'W',
    TO_DATE(TO_CHAR(SYSDATE - 5, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE + 5, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 8, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business3/recruitment/business3_recruitment_01.png', 
    '[ 기타사항 ]' || CHR(10) ||
    '- 재택근무 중 업무 기기 장애에 따라 원활한 업무가 불가능한 경우 오피스 출근으로 업무 중단을 최소화해야 함.' || CHR(10) ||
    '- 보훈대상자(취업지원대상자) 및 장애인 등은 관련 법령에 의거하여 우대' || CHR(10) ||
    '- 불합격한 지원자 채용서류 반환 절차는 그린웹서비스 홈페이지 Recruit - 공지사항 11번 게시글 「채용서류 반환 절차 안내 」 참조' || CHR(10) ||
    '(https://recruit.gwebscorp.com/gwebs/notice/8011367Popup)',
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '서류 전형',
    TO_TIMESTAMP(TO_CHAR(SYSDATE - 5, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '필기 테스트 및 인성면접',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 20, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_POSITION (POSITION_NO, RECRUITMENT_NO, POSITION_NAME, POSITION_RANK, EMPLOYMENT_FORM, RECRUITED_PEOPLE)
VALUES (NULL, SEQ_JOB.CURRVAL, '네이버 인물검색 운영', '신입', 'R', 3);


-- business4
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 4, '메가스터디 입시전략연구소 (대입컨설팅센터) 입시컨설턴트 채용',
    '정다영', '회계팀', 'jung4@example.com', 'H',
    TO_DATE(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE + 1, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 15, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business4/recruitment/business4_recruitment_01.png',
    '근무형태	:	정규직 (수습기간)' || CHR(10) ||
    '근무일시	:	09:00~18:00' || CHR(10) ||
    '근무지역	:	(06634) 서울 서초구 서초중앙로22길 17 3층 대입컨설팅센터(서초동) - 서울 2호선 교대 에서 100m 이내' || CHR(10) ||
    '※입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.' || CHR(10),
    'P'
);

-- business5
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 5, '[쿠팡] 쿠팡 신사업(쿠팡포스) 영업사원 대규모 채용(서울권)',
    '김수한무', '인사팀', 'choi5@example.com', 'W',
    TO_DATE(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE + 7, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 12, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business5/recruitment/business5_recruitment_01.png',
    NULL,
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '서류전형',
    TO_TIMESTAMP(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 14, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '전화면접',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 14, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 23, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '대면(화상)면접',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 23, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 30, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_POSITION (POSITION_NO, RECRUITMENT_NO, POSITION_NAME, POSITION_RANK, EMPLOYMENT_FORM, RECRUITED_PEOPLE)
VALUES (NULL, SEQ_JOB.CURRVAL, '영업사원', '인턴', 'C', 0);

-- business6
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 6, '[코웨이]24년 11월 경력직 수시채용(마케팅/경영/인사/연구소)',
    '홍길동', '관리팀', 'hong6@example.com', 'H',
    TO_DATE(TO_CHAR(SYSDATE - 60, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 40, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    SYSDATE,
    '/resources/business/business6/recruitment/business6_recruitment_01.png',
    '※ 『장애인고용촉진 및 직업재활법』에 따른 등록 장애인 및 『국가유공자 등 예우 및 지원에 관한 법률』 등에 의거한 취업지원 대상자는 관련 법령에 따라 가산점을 부여하고 있습니다.' || CHR(10) ||
    '채용서류의 반환 여부' || CHR(10) ||
    '코웨이의 입사서류는 채용사이트를 통해서 온라인 작성 및 제출을 진행하고 있으므로 채용서류의 반환 의무가 없습니다.' || CHR(10) ||
    '(채용절차의 공정화에 관한 법률 제7조 제1항에 의거)' || CHR(10) ||
    '단, 코웨이가 요구하지 않았으나 자발적으로 제출한 서류가 있을 경우' || CHR(10) ||
    '최종합격 후 30일 이내에 당사 재용사이트에서 채용서류 반환 청구 양식을 작성하시어' || CHR(10) ||
    '채용공식 메일 계정인 naler1004@coway.com 로 송부하시면 청구일로부터 14일 이내 등기우편으로 발송해드립니다.',
    'E'
);

-- business7
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 7, '[HD현대이엔티] 2025년 1/4분기 대졸신입 및 경력사원 모집',
    '강은혜', '인사팀', 'kang7@example.com', 'W',
    TO_DATE(TO_CHAR(SYSDATE - 30, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 40, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business7/recruitment/business7_recruitment_01.png',
    '기업규모대기업 (사원수 1,237명)' || CHR(10) ||
    '업종기계·조선·자동차·운송장비' || CHR(10) ||
    '복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원' || CHR(10) ||
    '주소(44032) 울산광역시 동구 방어진순환도로 1000 (전하동)',
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '서류심사',
    TO_TIMESTAMP(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '1차 실무면접',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 20, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '2차 임원면접',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 20, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 27, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '채용 건강검진',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 27, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 40, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_POSITION (POSITION_NO, RECRUITMENT_NO, POSITION_NAME, POSITION_RANK, EMPLOYMENT_FORM, RECRUITED_PEOPLE)
VALUES (NULL, SEQ_JOB.CURRVAL, '신사업지원', '일반사원', 'R', 0);

-- business8
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 8, '[금호건설(주)] 강릉회산동공동주택신축현장 건축기사 채용',
    '한예진', '토목팀', 'han8@example.com', 'H',
    TO_DATE(TO_CHAR(SYSDATE - 30, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 35, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business8/recruitment/business8_recruitment_01.png',
    '설립일1960년 09월 05일' || CHR(10) ||
    '기업규모대기업 (사원수 1,237명)' || CHR(10) ||
    '업종건설·건축·토목·조경' || CHR(10) ||
    '복리후생연차, 월차, 보건휴가, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 초등학자금지원' || CHR(10) ||
    '주소(51755) 전라남도 나주시 시청길 4 금호산업(주) (송월동)' || CHR(10) ||
    '홈페이지http://www.kumhoenc.com',
    'P'
);

-- business9
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 9, '㈜영공조명 조명설계 디자이너 경력 및 신입사원 모집',
    '서준호', '설계팀', 'seo9@example.com', 'W',
    TO_DATE(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE + 5, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business9/recruitment/business9_recruitment_01.png', 
    '설립일1950년 01월 10일' || CHR(10) ||
    '기업규모중소기업 (사원수 334명)' || CHR(10) ||
    '업종건설·건축·토목·조경' || CHR(10) ||
    '복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원',
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '서류전형',
    TO_TIMESTAMP(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'P'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '1차면접(인성)',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 17, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_STAGY (
    STAGY_NO, RECRUITMENT_NO, STAGY_NAME,
    STAGY_START,
    STAGY_END,
    STATUS
) VALUES (
    NULL, SEQ_JOB.CURRVAL, '2차면접(실무)',
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 17, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP(TO_CHAR(SYSDATE + 25, 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO JOB_POSITION (POSITION_NO, RECRUITMENT_NO, POSITION_NAME, POSITION_RANK, EMPLOYMENT_FORM, RECRUITED_PEOPLE)
VALUES (NULL, SEQ_JOB.CURRVAL, '조명디자인', '일반사원', 'R', 5);

-- business10
INSERT INTO JOB_RECRUITMENT (
    RECRUITMENT_NO, BUSINESS_NO, TITLE,
    MANAGER_NAME, MANAGER_DEPT, MANAGER_EMAIL, METHOD,
    START_DATE,
    DEADLINE,
    POSTING_DATE,
    CONTENT_IMG,
    CONTENT_TEXT,
    STATUS
) VALUES (
    SEQ_JOB.NEXTVAL, 10, '[CJ대한통운] 물류 영업 경력사원 모집',
    '유지연', '물류팀', 'yoo10@example.com', 'H',
    TO_DATE(TO_CHAR(SYSDATE - 20, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE + 10, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    TO_DATE(TO_CHAR(SYSDATE - 21, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    '/resources/business/business10/recruitment/business10_recruitment_01.png',
    '설립일1930년 11월 15일' || CHR(10) ||
    '기업규모대기업 (사원수 7,103명)' || CHR(10) ||
    '업종물류' || CHR(10) ||
    '복리후생주5일근무, 연차, 경조휴가, 국민연금, 의료보험, 산재보험, 고용보험, 사내동호회, 휴양' || CHR(10) ||
    '주소(04513) 서울특별시 중구 세종대로9길 53 (서소문동)' || CHR(10) ||
    '홈페이지http://www.cjlogistics.com',
    'P'
);


--=======================================================================================================================


/* 지원자 목록(임시) */

-- RECRUITMENT_NO: 1
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 1, 1, SYSDATE, 'Y', 'N');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 2, 2, SYSDATE, 'N', 'P');
    
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 1, 3, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 1, 4, SYSDATE, 'N', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 1, 5, SYSDATE, 'Y', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 2, 6, SYSDATE, 'N', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 2, 7, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 2, 8, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 1, 9, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 1, 1, 2, 10, SYSDATE, 'N', 'N');

-- RECRUITMENT_NO: 3
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 1, 1, SYSDATE, 'Y', 'N');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 2, 2, SYSDATE, 'N', 'P');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 2, 3, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 1, 4, SYSDATE, 'N', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 1, 5, SYSDATE, 'Y', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 2, 6, SYSDATE, 'N', 'F');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 1, 7, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 2, 8, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 1, 9, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 3, 1, 2, 10, SYSDATE, 'N', 'N');

-- RECRUITMENT_NO: 5
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 1, 1, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 4, 2, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 3, 3, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 4, 4, SYSDATE, 'N', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 4, 5, SYSDATE, 'Y', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 2, 6, SYSDATE, 'N', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 3, 7, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 4, 8, SYSDATE, 'N', 'P');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 1, 9, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 5, 1, 2, 10, SYSDATE, 'N', 'N');

-- RECRUITMENT_NO: 7
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 1, 1, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 2, 2, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 3, 3, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 1, 4, SYSDATE, 'N', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 1, 5, SYSDATE, 'Y', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 2, 6, SYSDATE, 'N', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 3, 7, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 3, 8, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 1, 9, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 7, 1, 2, 10, SYSDATE, 'N', 'N');
    
-- RECRUITMENT_NO: 9
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 1, 1, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 2, 2, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 3, 3, SYSDATE, 'Y', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 2, 4, SYSDATE, 'N', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 1, 5, SYSDATE, 'Y', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 2, 6, SYSDATE, 'N', 'F');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 3, 7, SYSDATE, 'Y', 'N');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 3, 8, SYSDATE, 'N', 'P');

INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 1, 9, SYSDATE, 'Y', 'F');
    
INSERT INTO APPLICANTS (
    APPLICANTS_NO, RECRUITMENT_NO, POSITION_NO, STAGY_NO, RESUME_NO,
    APPLICANTS_DATE, RESUME_STATUS, PASS_STATUS
) VALUES (SEQ_APP.NEXTVAL, 9, 1, 2, 10, SYSDATE, 'N', 'N');


--=======================================================================================================================


/* 구직자 즐겨찾기(임시) */

-- business1
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (1, 2, '2024-11-01 10:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (1, 4, '2024-11-02 14:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (1, 3, '2024-11-03 09:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (1, 5, '2024-11-04 11:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (1, 1, '2024-11-05 16:30:00');

-- business2
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (2, 9, '2024-11-06 08:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (2, 6, '2024-11-07 13:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (2, 8, '2024-11-08 10:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (2, 10, '2024-11-09 15:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (2, 7, '2024-11-10 12:30:00');

-- business3
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (3, 4, '2024-11-11 11:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (3, 1, '2024-11-12 08:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (3, 5, '2024-11-13 09:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (3, 3, '2024-11-14 14:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (3, 2, '2024-11-15 16:00:00');

-- business4
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (4, 8, '2024-11-16 10:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (4, 9, '2024-11-17 14:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (4, 6, '2024-11-18 12:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (4, 7, '2024-11-19 17:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (4, 10, '2024-11-20 13:00:00');

-- business5
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (5, 3, '2024-11-21 09:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (5, 5, '2024-11-22 10:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (5, 2, '2024-11-23 11:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (5, 4, '2024-11-24 14:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (5, 1, '2024-11-25 15:45:00');

-- business6
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (6, 6, '2024-11-26 08:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (6, 9, '2024-11-27 12:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (6, 7, '2024-11-28 10:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (6, 10, '2024-11-29 14:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (6, 8, '2024-11-30 09:45:00');

-- business7
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (7, 5, '2024-11-01 11:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (7, 2, '2024-11-02 14:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (7, 4, '2024-11-03 16:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (7, 3, '2024-11-04 09:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (7, 1, '2024-11-05 13:30:00');

-- business8
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (8, 10, '2024-11-06 10:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (8, 7, '2024-11-07 11:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (8, 8, '2024-11-08 09:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (8, 6, '2024-11-09 14:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (8, 9, '2024-11-10 13:00:00');

-- business9
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (9, 2, '2024-11-11 10:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (9, 4, '2024-11-12 14:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (9, 5, '2024-11-13 09:45:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (9, 1, '2024-11-14 11:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (9, 3, '2024-11-15 13:30:00');

-- business10
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (10, 7, '2024-11-16 16:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (10, 10, '2024-11-17 08:15:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (10, 6, '2024-11-18 10:30:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (10, 8, '2024-11-19 12:00:00');
INSERT INTO BUSINESS_BOOKMARK (BUSINESS_NO, RESUME_NO, ADD_DATE) VALUES (10, 9, '2024-11-20 09:00:00');



--=======================================================================================================================
--기업 복리후생 추가

-- BUSINESS_NO = 1: (주)도화엔지니어링
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '금연수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '각종 경조사 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '자녀학자금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '우수사원포상');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '자격증수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '우수사원시상식');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '외국어 교육 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '구내식당(사원식당)');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '연차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '경조휴가제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (1, '반차');

-- BUSINESS_NO = 2: 딜로이트컨설팅(유)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '선택적복리후생');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '인센티브제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '명절선물/귀향비');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (2, '사내동호회 운영');

-- BUSINESS_NO = 3: 네이버(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '선택적복리후생');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '인센티브제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '명절선물/귀향비');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '사내동호회 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '유연근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '교육지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '자녀 교육비 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '사내식당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '휴가제도');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '탄력근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '재택근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (3, '주택자금 지원');

-- BUSINESS_NO = 4: 메가스터디교육(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '선택적복리후생');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '인센티브제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '명절선물/귀향비');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '사내동호회 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '유연근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '교육지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '자녀 교육비 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '사내식당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '휴가제도');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '탄력근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '재택근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '주택자금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '직원 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '심리 상담 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '체육 시설 이용');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (4, '경조사 지원');

-- BUSINESS_NO = 5: 쿠팡(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '선택적복리후생');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '인센티브제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '명절선물/귀향비');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '사내동호회 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '유연근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '교육지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '자녀 교육비 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '사내식당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '휴가제도');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '탄력근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '재택근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '주택자금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '직원 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '심리 상담 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '체육 시설 이용');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (5, '경조사 지원');

-- BUSINESS_NO = 6: 코웨이(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '복지포인트 지급');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '건강검진 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '전직원 상해보험 가입');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '헬스케어 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '심리 상담실 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '경조사 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '자녀 학자금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '기념일 선물 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '주택자금 이자 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, 'Refresh 휴가 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '휴양지 숙소 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '자격증 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '직무 전문가 육성');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (6, '어학 교육 지원');

-- BUSINESS_NO = 7: 에이치디현대이엔티(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '건강검진');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '각종 경조사 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '자녀학자금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '상여금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '장기근속자 포상');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '우수사원 포상');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '퇴직금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '성과급');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '야근수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '휴일(특근)수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '연차수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '직책수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '4대 보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '명절선물/귀향비');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '결혼기념일 선물');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '사내동호회 운영');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '유연근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '교육지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '사내식당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '휴가제도');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '탄력근무제');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '재택근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '주택자금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '직원 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (7, '심리 상담 지원');

-- BUSINESS_NO = 8: 금호건설(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '건강보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '국민연금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '고용보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '산재보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '애경사 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '금호리조트 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '항공권 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (8, '금호타이어 할인');

-- BUSINESS_NO = 9: ㈜영공조명
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '국민연금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '고용보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '산재보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '건강보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '퇴직연금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '주5일 근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '연차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '월차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '경조휴가');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '반차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '노동절 휴무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '각종 경조금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '장기근속자 포상');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '연월차수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '카페테리아');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (9, '중식 제공');

-- BUSINESS_NO = 10: 씨제이대한통운(주)
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '국민연금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '고용보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '산재보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '건강보험');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '퇴직연금');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '주5일 근무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '연차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '월차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '경조휴가');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '반차');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '노동절 휴무');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '각종 경조금 지원');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '장기근속자 포상');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '연월차수당');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '카페테리아');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '중식 제공');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '자녀입학 돌봄 휴가');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '긴급 자녀 돌봄 근로시간 단축');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '임신 위험기 근로시간 단축');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '난임 지원 휴가');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, 'CJ계열사 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, 'CJmall 임직원 특가');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '공연 할인');
INSERT INTO BUSINESS_BENEFIT (BUSINESS_NO, BENEFIT) VALUES (10, '해외 콘도 지원');

--=======================================================================================================================
--사내 근무환경 추가

    -- BUSINESS_NO = 1: (주)도화엔지니어링
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        1,
        '/resources/uploads/work_env_images/business1building1.png',
        '도화엔지니어링 건물 1'
    );
    
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        1,
        '/resources/uploads/work_env_images/business1building2.png',
        '도화엔지니어링 건물 2'
    );
    
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        1,
        '/resources/uploads/work_env_images/business1cabinet1.png',
        '도화엔지니어링 회의실 1'
    );
    
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        1,
        '/resources/uploads/work_env_images/business1foyer1.png',
        '도화엔지니어링 휴게실 1'
    );
    
    
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        1,
        '/resources/uploads/work_env_images/business1office1.png',
        '도화엔지니어링 사무실 1'
    );

    -- BUSINESS_NO = 2: 딜로이트컨설팅(유)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        2,
        '/resources/uploads/work_env_images/business2building1.png',
        '딜로이트컨설팅 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        2,
        '/resources/uploads/work_env_images/business2building2.png',
        '딜로이트컨설팅 건물 2'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        2,
        '/resources/uploads/work_env_images/business2office.png',
        '딜로이트컨설팅 사무실'
    );

    -- BUSINESS_NO = 3: 네이버(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        3,
        '/resources/uploads/work_env_images/business3building1.png',
        '네이버 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        3,
        '/resources/uploads/work_env_images/business3cabinet1.png',
        '네이버 회의실 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        3,
        '/resources/uploads/work_env_images/business3library1.png',
        '네이버 도서관 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        3,
        '/resources/uploads/work_env_images/business3office1.png',
        '네이버 사무실 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        3,
        '/resources/uploads/work_env_images/business3restaurant1.png',
        '네이버 식당 1'
    );

    -- BUSINESS_NO = 4: 메가스터디교육(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        4,
        '/resources/uploads/work_env_images/business4building1.png',
        '메가스터디교육 건물 1'
    );

    -- BUSINESS_NO = 5: 쿠팡(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        5,
        '/resources/uploads/work_env_images/business5building1.png',
        '쿠팡 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        5,
        '/resources/uploads/work_env_images/business5foyer1.png',
        '쿠팡 휴게실 1'
    );


    -- BUSINESS_NO = 6: 코웨이(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        6,
        '/resources/uploads/work_env_images/business6building1.png',
        '코웨이 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        6,
        '/resources/uploads/work_env_images/business6building2.png',
        '코웨이 건물 2'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        6,
        '/resources/uploads/work_env_images/business6building3.png',
        '코웨이 건물 3'
    );

    -- BUSINESS_NO = 7: 에이치디현대이엔티(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        7,
        '/resources/uploads/work_env_images/business7building1.png',
        '에이치디현대이엔티 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        7,
        '/resources/uploads/work_env_images/business7foyer1.png',
        '에이치디현대이엔티 휴게실 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        7,
        '/resources/uploads/work_env_images/business7office1.png',
        '에이치디현대이엔티 사무실 1'
    );

    -- BUSINESS_NO = 8: 금호건설(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        8,
        '/resources/uploads/work_env_images/business8building1.png',
        '금호건설 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        8,
        '/resources/uploads/work_env_images/business8building2.png',
        '금호건설 건물 2'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        8,
        '/resources/uploads/work_env_images/business8building3.png',
        '금호건설 건물 3'
    );

    -- BUSINESS_NO = 9: ㈜영공조명
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        9,
        '/resources/uploads/work_env_images/business9building1.png',
        '영공조명 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        9,
        '/resources/uploads/work_env_images/business9cabinet1.png',
        '영공조명 회의실 1'
    );

    -- BUSINESS_NO = 10: 씨제이대한통운(주)
    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        10,
        '/resources/uploads/work_env_images/business10building1.png',
        '씨제이대한통운 건물 1'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        10,
        '/resources/uploads/work_env_images/business10building2.png',
        '씨제이대한통운 건물 2'
    );

    INSERT INTO WORK_ENVIRONMENT_IMAGE (
        WORK_ENVIRONMENT_IMAGE_NO,
        BUSINESS_NO,
        IMAGE_URL,
        TITLE
    ) VALUES (
        WORK_ENVIRONMENT_IMAGE_SEQ.NEXTVAL,
        10,
        '/resources/uploads/work_env_images/business10office1.png',
        '씨제이대한통운 사무실 1'
    );


--=======================================================================================================================


COMMIT;