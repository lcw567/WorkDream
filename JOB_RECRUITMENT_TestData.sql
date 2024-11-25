-- JOB_RECRUITMENT 테이블에 테스트 데이터 10개 삽입
-- memberTestData.sql먼저 실행

set define off;
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
    1, 1, '(주)도화엔지니어링 상하수도분야', '김철수', '개발팀', 'kim1@example.com', 'W',
    TO_TIMESTAMP('2024-01-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-01-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting1.PNG', 
    '전형단계 및 제출서류

전형단계 : 서류전형 → 면접전형 → 최종합격
제출서류
- 입사지원서 (자사양식 제출)
- 경력증명서
- 자격증 사본 (해당자에 한함)
접수방법

채용시

접수기간 : 2024.011.25.(월) ~ 채용시 마감
접수방법 : 이메일 (******@*******.***)
문의사항 : 이메일 또는 ☏ ***-****-****
기타 유의사항

입사지원서 및 제출서류에 허위사실이 있을 경우 채용이 취소될 수 있습니다.'
);

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
    2, 2, '[딜로이트] 경영자문부문 QRM', '박영희', '데이터팀', 'park2@example.com', 'H',
    TO_TIMESTAMP('2024-02-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-02-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting2.PNG', 
    '설립일1987년 02월 14일
기업규모중견기업 (사원수 2,723명)
업종법률·회계
복리후생연차, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 건강검진
주소(07326) 서울특별시 영등포구 국제금융로 10 (여의도동,서울 국제금융 센터) ONE IFC 9F 
지도보기
홈페이지http://-'
);

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
    3, 3, '네이버 인물검색 운영', '이민수', '기획팀', 'lee3@example.com', 'W',
    TO_TIMESTAMP('2024-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-03-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting3.PNG', 
    '[ 기타사항 ]

- 재택근무 중 업무 기기 장애에 따라 원활한 업무가 불가능한 경우 오피스 출근으로 업무 중단을 최소화해야 함.

- 보훈대상자(취업지원대상자) 및 장애인 등은 관련 법령에 의거하여 우대

- 불합격한 지원자 채용서류 반환 절차는 그린웹서비스 홈페이지 Recruit - 공지사항 11번 게시글 「채용서류 반환 절차 안내 」 참조

  (https://recruit.gwebscorp.com/gwebs/notice/8011367Popup)'
);

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
    4, 4, '[경영지원] 회계&세무 경력직 채용', '정다영', '회계팀', 'jung4@example.com', 'H',
    TO_TIMESTAMP('2024-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-04-30 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting4.PNG', 
    '설립일2015년 04월 03일
기업규모중견기업 (사원수 1,865명)
업종학원·학습지
주소(06643) 서울특별시 서초구 효령로 321 (서초동)'
);

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
    5, 5, '데이터사이언스 (체험형인턴)', '최지훈', '인사팀', 'choi5@example.com', 'W',
    TO_TIMESTAMP('2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2024-05-31 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    SYSDATE, '/img/posting5.PNG', 
    '우대사항

제조 데이터 분석 경험
관련분야 논문, 공모전 성과 우수자
 - 최신 논문(알고리즘)을 이해하고 구현할 수 있는 수준의 연구/개발 능력 보유자
 - 오픈소스 기반 최신 딥러닝 프레임워크 활용 능력 보유자 (Tensorflow, Pytorch 등)
 커뮤니케이션 역량 우수자
 
전형절차

지원서 접수(~12/6) → 코딩테스트 (12월 중) → 면접전형 (1월 중)  → 채용 검진 (1월 중) → 입사 (1월 중)
※ 운영 상황에 따라 일부 전형은 온라인으로 진행될 수 있으며, 전형 및 일정 또한 변경될 수 있습니다.'
);

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
    '※ 『장애인고용촉진 및 직업재활법』에 따른 등록 장애인 및 『국가유공자 등 예우 및 지원에 관한 법률』 등에 의거한 취업지원 대상자는 관련 법령에 따라 가산점을 부여하고 있습니다.



*채용서류의 반환 여부

코웨이의 입사서류는 채용사이트를 통해서 온라인 작성 및 제출을 진행하고 있으므로 채용서류의 반환 의무가 없습니다.

(채용절차의 공정화에 관한 법률 제7조 제1항에 의거)



단, 코웨이가 요구하지 않았으나 자발적으로 제출한 서류가 있을 경우 

최종합격 후 30일 이내에 당사 재용사이트에서 채용서류 반환 청구 양식을 작성하시어

채용공식 메일 계정인 naler1004@coway.com 로 송부하시면 청구일로부터 14일 이내 등기우편으로 발송해드립니다'
);

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
    '기업규모대기업 (사원수 1,237명)
업종기계·조선·자동차·운송장비
복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원
주소(44032) 울산광역시 동구 방어진순환도로 1000 (전하동)'
);

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
    '설립일1960년 09월 05일
기업규모대기업 (사원수 1,237명)
업종건설·건축·토목·조경
복리후생연차, 월차, 보건휴가, 국민연금, 의료보험, 산재보험, 고용보험, 퇴직금, 초등학자금지원... +
주소(51755) 전라남도 나주시 시청길 4 금호산업(주) (송월동) 
지도보기
홈페이지http://www.kumhoenc.com'
);

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
    '설립일1950년 01월 10일
기업규모대기업 (사원수 7,334명)
업종건설·건축·토목·조경
복리후생주5일근무, 연차, 월차, 보건휴가, 식대지원, 초등학자금지원, 중등학자금지원
주소(03058) 서울특별시 종로구 율곡로 75 (계동) 
지도보기
홈페이지http://www.hdec.kr'
);

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
    '설립일1930년 11월 15일
기업규모대기업 (사원수 7,103명)
업종물류
복리후생주5일근무, 연차, 경조휴가, 국민연금, 의료보험, 산재보험, 고용보험, 사내동호회, 휴양... +
주소(04513) 서울특별시 중구 세종대로9길 53 (서소문동) 
지도보기
홈페이지http://www.cjlogistics.com'
);

COMMIT;