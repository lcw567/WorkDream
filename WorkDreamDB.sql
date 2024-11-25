/* USER 생성 (관리자 계정으로 실행) */
--CREATE USER CODESYNC IDENTIFIED BY CODESYNC;
--GRANT CONNECT, RESOURCE TO CODESYNC;

DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE POSTING CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_POST_JOB_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_POST_HASHTAG CASCADE CONSTRAINTS;
DROP TABLE BUSINESS CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BENEFIT CASCADE CONSTRAINTS;
DROP TABLE WORK_ENVIRONMENT_IMAGE CASCADE CONSTRAINTS;
DROP TABLE JOB_RECRUITMENT CASCADE CONSTRAINTS;
DROP TABLE JOB_POSITION CASCADE CONSTRAINTS;
DROP TABLE JOB_STAGY CASCADE CONSTRAINTS;
DROP TABLE APPLICANTS CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE PERSON_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE PERSON CASCADE CONSTRAINTS;
DROP TABLE RESUME CASCADE CONSTRAINTS;
DROP TABLE SELF_INTRODUCTION CASCADE CONSTRAINTS;
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;
DROP TABLE POST_LIKE CASCADE CONSTRAINTS;
DROP TABLE REPLY_LIKE CASCADE CONSTRAINTS;
DROP TABLE USER_TAGS CASCADE CONSTRAINTS;


DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_PNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_JOB;
DROP SEQUENCE SEQ_JOB_P;
DROP SEQUENCE RESUME_SEQ;
DROP SEQUENCE POSTING_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE SELF_INTRO_SEQ;
DROP SEQUENCE POST_LIKE_SEQ;
DROP SEQUENCE REPLY_LIKE_SEQ;
DROP SEQUENCE SEQ_TAG_ID;
DROP SEQUENCE BUSINESS_SEQ;
DROP SEQUENCE WORK_ENVIRONMENT_IMAGE_SEQ;

/* Member */
-- MEMBER  (회원 테이블)
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY NOT NULL,    -- SEQ_UNO
    USER_TYPE CHAR(1) NOT NULL,
    USER_ID VARCHAR(20) UNIQUE NOT NULL,
    USER_PWD VARCHAR2(60) NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    PHONE   VARCHAR2(15) NULL,
    EROLL_DATE DATE,
    MODIFY_DATE TIMESTAMP NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')),
    BUSINESS_NO NUMBER NULL,
    PERSON_NO NUMBER NULL
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원 고유키';
COMMENT ON COLUMN MEMBER.USER_TYPE IS '회원 유형';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '회원 연락처';
COMMENT ON COLUMN MEMBER.EROLL_DATE IS '회원 가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '마지막 회원 정보 수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '계정 상태 ( 가입: Y / 탈퇴: N)';
COMMENT ON COLUMN MEMBER.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN MEMBER.PERSON_NO IS '개인 고유키';


/* POSTING 테이블 생성 */
CREATE TABLE POSTING (
    POSTING_NO NUMBER PRIMARY KEY NOT NULL,
    CATEGORY VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(225) NOT NULL,
    CONTENT CLOB NOT NULL,
    IMAGE VARCHAR2(255) NULL,
    AUTHOR VARCHAR2(100) NOT NULL,
    USER_NO NUMBER NOT NULL,
    IMAGE_PATH VARCHAR2(500) NULL,
    CREATED_TIME TIMESTAMP NOT NULL,
    UPDATED_TIME TIMESTAMP NULL,
    VIEW_COUNT NUMBER NOT NULL,
    LIKE_COUNT NUMBER NOT NULL,
    BUSINESS_NO NUMBER NULL,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK (STATUS IN ('Y','N')),
    PERSON_NO NUMBER NULL
);

COMMENT ON COLUMN POSTING.POSTING_NO IS '게시글 번호';
COMMENT ON COLUMN POSTING.CATEGORY IS '카테고리';
COMMENT ON COLUMN POSTING.TITLE IS '게시글 제목';
COMMENT ON COLUMN POSTING.CONTENT IS '게시글 내용';
COMMENT ON COLUMN POSTING.IMAGE IS '이미지';
COMMENT ON COLUMN POSTING.AUTHOR IS '작성자';
COMMENT ON COLUMN POSTING.USER_NO IS '회원 번호';
COMMENT ON COLUMN POSTING.CREATED_TIME IS '작성 시간';
COMMENT ON COLUMN POSTING.UPDATED_TIME IS '수정 시간';
COMMENT ON COLUMN POSTING.VIEW_COUNT IS '조회수';
COMMENT ON COLUMN POSTING.LIKE_COUNT IS '좋아요 수';
COMMENT ON COLUMN POSTING.BUSINESS_NO IS '기업 번호';
COMMENT ON COLUMN POSTING.STATUS IS '게시글 상태 (Y/N)';
COMMENT ON COLUMN POSTING.PERSON_NO IS '개인 번호';

/* REPLY 테이블 생성 */
CREATE TABLE REPLY (
    REPLY_NO NUMBER PRIMARY KEY NOT NULL,
    POSTING_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    CONTENT CLOB NOT NULL,
    CREATED_TIME TIMESTAMP DEFAULT SYSDATE,
    LIKE_COUNT NUMBER DEFAULT 0,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK (STATUS IN ('Y','N'))
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.POSTING_NO IS '게시글 번호';
COMMENT ON COLUMN REPLY.USER_NO IS '회원 번호';
COMMENT ON COLUMN REPLY.CONTENT IS '댓글 내용';
COMMENT ON COLUMN REPLY.CREATED_TIME IS '작성 시간';
COMMENT ON COLUMN REPLY.LIKE_COUNT IS '좋아요 수';
COMMENT ON COLUMN REPLY.STATUS IS '댓글 상태 (Y/N)';

/* COMMUNITY_POST_JOB_CATEGORY 테이블 생성 */
CREATE TABLE COMMUNITY_POST_JOB_CATEGORY (
    POSTING_NO NUMBER NOT NULL,
    JOB_CATEGORY VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN COMMUNITY_POST_JOB_CATEGORY.POSTING_NO IS '게시글 번호';
COMMENT ON COLUMN COMMUNITY_POST_JOB_CATEGORY.JOB_CATEGORY IS '직업 카테고리';

/* COMMUNITY_POST_HASHTAG 테이블 생성 */
CREATE TABLE COMMUNITY_POST_HASHTAG (
    POSTING_NO NUMBER NOT NULL,
    HASHTAG VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN COMMUNITY_POST_HASHTAG.POSTING_NO IS '게시글 번호';
COMMENT ON COLUMN COMMUNITY_POST_HASHTAG.HASHTAG IS '해시태그';

/* POST_LIKE 테이블 생성 (게시글 공감 기록) */
CREATE TABLE POST_LIKE (
    LIKE_NO NUMBER PRIMARY KEY NOT NULL,
    POSTING_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    LIKED_TIME TIMESTAMP DEFAULT SYSDATE,
    CONSTRAINT fk_post_like_posting FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO),
    CONSTRAINT fk_post_like_user FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    CONSTRAINT uq_post_like_posting_user UNIQUE (POSTING_NO, USER_NO)
);

COMMENT ON TABLE POST_LIKE IS '게시글 공감 기록 테이블';
COMMENT ON COLUMN POST_LIKE.LIKE_NO IS '공감 고유 번호';
COMMENT ON COLUMN POST_LIKE.POSTING_NO IS '게시글 번호';
COMMENT ON COLUMN POST_LIKE.USER_NO IS '회원 번호';
COMMENT ON COLUMN POST_LIKE.LIKED_TIME IS '공감 시간';



/* REPLY_LIKE 테이블 생성 (댓글 공감 기록) */
CREATE TABLE REPLY_LIKE (
    LIKE_NO NUMBER PRIMARY KEY NOT NULL,
    REPLY_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    LIKED_TIME TIMESTAMP DEFAULT SYSDATE,
    CONSTRAINT fk_reply_like_reply FOREIGN KEY (REPLY_NO) REFERENCES REPLY (REPLY_NO),
    CONSTRAINT fk_reply_like_user FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    CONSTRAINT uq_reply_like_reply_user UNIQUE (REPLY_NO, USER_NO)
);

COMMENT ON TABLE REPLY_LIKE IS '댓글 공감 기록 테이블';
COMMENT ON COLUMN REPLY_LIKE.LIKE_NO IS '공감 고유 번호';
COMMENT ON COLUMN REPLY_LIKE.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY_LIKE.USER_NO IS '회원 번호';
COMMENT ON COLUMN REPLY_LIKE.LIKED_TIME IS '공감 시간';


/* POST_LIKE 시퀀스 생성 */
CREATE SEQUENCE POST_LIKE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

/* REPLY_LIKE 시퀀스 생성 */
CREATE SEQUENCE REPLY_LIKE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


--==============================================================================


/* BUSINESS 관련 */
-- BUSINESS (기업 정보 테이블)
CREATE TABLE BUSINESS (
    BUSINESS_NO NUMBER PRIMARY KEY NOT NULL,    -- SEQ_BNO
    REGISTRATION_NUMBER VARCHAR2(12) NOT NULL,
    OWNER_NAME VARCHAR2(15) NULL,
    COMPANY_NAME VARCHAR2(50) NULL,
    COMPANY_CODE NUMBER  NULL,
    COMPANY_TEL VARCHAR2(15) NULL,
    COMPANY_ADDR VARCHAR2(50) NULL,
    COMPANY_FAX VARCHAR2(15) NULL,
    COMPANY_SITE VARCHAR2(50) NULL,
    LOGO VARCHAR2(500) NULL,
    INTRODUCTION CLOB NULL,
    VISION CLOB NULL,
    COMPANY_TYPE VARCHAR(50) NULL,
    EMPLOYEE_COUNT NUMBER NULL,
    INDUSTRY VARCHAR(100) NULL,
    SHORT_INTRODUCTION VARCHAR2(255),
    BRAND_NAME VARCHAR(100) NULL
);

COMMENT ON COLUMN BUSINESS.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN BUSINESS.REGISTRATION_NUMBER IS '사업자등록번호';
COMMENT ON COLUMN BUSINESS.OWNER_NAME IS '대표자명';
COMMENT ON COLUMN BUSINESS.COMPANY_NAME IS '상호명';
COMMENT ON COLUMN BUSINESS.COMPANY_CODE IS '업종코드';
COMMENT ON COLUMN BUSINESS.COMPANY_TEL IS '사업장 전화번호';
COMMENT ON COLUMN BUSINESS.COMPANY_ADDR IS '사업장 주소';
COMMENT ON COLUMN BUSINESS.COMPANY_FAX IS '사업장 팩스 주소';
COMMENT ON COLUMN BUSINESS.COMPANY_SITE IS '기업 홈페이지 주소';
COMMENT ON COLUMN BUSINESS.LOGO IS '기업 로고 이미지';
COMMENT ON COLUMN BUSINESS.INTRODUCTION IS '기업 소개';
COMMENT ON COLUMN BUSINESS.VISION IS '기업 비전';
COMMENT ON COLUMN BUSINESS.COMPANY_TYPE IS '기업 형태';
COMMENT ON COLUMN BUSINESS.EMPLOYEE_COUNT IS '직원수';
COMMENT ON COLUMN BUSINESS.INDUSTRY IS '업종';
COMMENT ON COLUMN BUSINESS.BRAND_NAME IS '브랜드명';


-- BUSINESS_BENEFIT (기업 복리후생 정보 테이블)
CREATE TABLE BUSINESS_BENEFIT (
    BUSINESS_NO NUMBER NOT NULL,
    BENEFIT VARCHAR2(100) NULL,
    CONSTRAINT FK_BUSINESS_BENEFIT_BUSINESS FOREIGN KEY (BUSINESS_NO)
        REFERENCES BUSINESS (BUSINESS_NO)
        ON DELETE CASCADE
);

COMMENT ON COLUMN BUSINESS_BENEFIT.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN BUSINESS_BENEFIT.BENEFIT IS '복리후생';


-- WORK_ENVIRONMENT_IMAGE (사내 근무환경 이미지)
CREATE TABLE WORK_ENVIRONMENT_IMAGE (
    WORK_ENVIRONMENT_IMAGE_NO NUMBER NOT NULL,
    BUSINESS_NO NUMBER NOT NULL,
    IMAGE_URL VARCHAR2(500) NULL,
    TITLE VARCHAR2(255) NULL,
    CONSTRAINT FK_WORK_ENV_IMAGE_BUSINESS FOREIGN KEY (BUSINESS_NO)
        REFERENCES BUSINESS (BUSINESS_NO)
        ON DELETE CASCADE
);

COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.WORK_ENVIRONMENT_IMAGE_NO IS '작업 환경 이미지 번호';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.IMAGE_URL IS '이미지 URL';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.TITLE IS '이미지 제목';


-- JOB_POSTING (채용공고)
CREATE TABLE JOB_RECRUITMENT (
    RECRUITMENT_NO NUMBER PRIMARY KEY NOT NULL,
    BUSINESS_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    MANAGER_NAME VARCHAR2(15) NOT NULL,
    MANAGER_DEPT VARCHAR2(30) NOT NULL,
    MANAGER_EMAIL VARCHAR2(50) NOT NULL,
    METHOD CHAR(1) NOT NULL,
    START_DATE TIMESTAMP NOT NULL,
    DEADLINE TIMESTAMP NOT NULL,
    POSTING_DATE DATE NOT NULL,
    CONTENT_IMG VARCHAR2(100) NULL,
    CONTENT_TEXT VARCHAR2(3000) NULL
);

COMMENT ON COLUMN JOB_POSTING.RECRUITMENT_NO IS '채용공고 번호';
COMMENT ON COLUMN JOB_POSTING.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN JOB_POSTING.TITLE IS '공고 제목';
COMMENT ON COLUMN JOB_POSTING.MANAGER_NAME IS '담당자 이름';
COMMENT ON COLUMN JOB_POSTING.MANAGER_DEPT IS '담당자 부서';
COMMENT ON COLUMN JOB_POSTING.MANAGER_EMAIL IS '담당자 이메일(연락처)';
COMMENT ON COLUMN JOB_POSTING.METHOD IS '모집 방식(워크드림 이력서: W / 자사 홈페이지 지원: H)';
COMMENT ON COLUMN JOB_POSTING.START_DATE IS '채용 시작일';
COMMENT ON COLUMN JOB_POSTING.DEADLINE IS '채용 마감일';
COMMENT ON COLUMN JOB_POSTING.POSTING_DATE IS '공고 게시일';
COMMENT ON COLUMN JOB_POSTING.CONTENT_IMG IS '내용 이미지';
COMMENT ON COLUMN JOB_POSTING.CONTENT_TEXT IS '내용 텍스트';


-- JOB_POSITION (채용 포지션)
CREATE TABLE JOB_POSITION (
    POSITION_NO NUMBER PRIMARY KEY NOT NULL,    -- SEQ_JOB_P
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NAME VARCHAR2(50) NOT NULL,
    POSITION_RANK VARCHAR2(30) NOT NULL,
    EMPLOYMENT_FORM CHAR(1) NOT NULL,
    RECRUITED_PEOPLE NUMBER NOT NULL,
    WORKING_DAY NUMBER NOT NULL,
    WORKING_TIME_START TIMESTAMP NULL,
    WORKING_TIME_END TIMESTAMP NULL,
    WORKING_PLACE VARCHAR2(50) NOT NULL,
    MIN_SALARY NUMBER NOT NULL,
    MAX_SALARY NUMBER NOT NULL,
    ACADEMIC_ABILITY CHAR(2) NOT NULL,
    MIN_CAREER NUMBER NOT NULL,
    MAX_CAREER NUMBER NOT NULL
);

COMMENT ON COLUMN JOB_POSITION.POSITION_NO IS '포지션 고유키';
COMMENT ON COLUMN JOB_POSITION.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN JOB_POSITION.POSITION_NAME IS '직위 이름';
COMMENT ON COLUMN JOB_POSITION.POSITION_RANK IS '직위 등급';
COMMENT ON COLUMN JOB_POSITION.EMPLOYMENT_FORM IS '고용 형태(정규직: R / 계약직: C)';
COMMENT ON COLUMN JOB_POSITION.RECRUITED_PEOPLE IS '채용 인원(합격자 수)';
COMMENT ON COLUMN JOB_POSITION.WORKING_DAY IS '근무일(협의, 스케쥴 근무: 0 / 주n일 근무: 1~7)';
COMMENT ON COLUMN JOB_POSITION.WORKING_TIME_START IS '근무 시간 시작';
COMMENT ON COLUMN JOB_POSITION.WORKING_TIME_END IS '근무 시간 종료';
COMMENT ON COLUMN JOB_POSITION.WORKING_PLACE IS '근무 장소';
COMMENT ON COLUMN JOB_POSITION.MIN_SALARY IS '최소 급여(연봉)';
COMMENT ON COLUMN JOB_POSITION.MAX_SALARY IS '최대 급여(연봉)';
COMMENT ON COLUMN JOB_POSITION.ACADEMIC_ABILITY IS '학력 요구(학력 무관: NA / 고등학교 졸업: HS / 대학교(2년제) 졸업: C2 / 대학교(4년제) 졸업: C4 / 석사 이상: DH)';
COMMENT ON COLUMN JOB_POSITION.MIN_CAREER IS '최소 요구 경력(신입: 0 / 경력무관: 999)';
COMMENT ON COLUMN JOB_POSITION.MAX_CAREER IS '최대 요구 경력';


-- JOB_STAGY (전형 단계)
CREATE TABLE JOB_STAGY (
    STAGY_NO NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NO NUMBER NOT NULL,
    STAGY_NAME VARCHAR(30) NOT NULL,
    STAGY_START TIMESTAMP NOT NULL,
    STAGY_END TIMESTAMP NOT NULL,
    STATUS CHAR(1) NOT NULL
);

COMMENT ON COLUMN JOB_STAGY.STAGY_NO IS '전형 단계 번호';
COMMENT ON COLUMN JOB_STAGY.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN JOB_STAGY.POSITION_NO IS '포지션 고유키';
COMMENT ON COLUMN JOB_STAGY.STAGY_NAME IS '전형 단계 이름';
COMMENT ON COLUMN JOB_STAGY.STAGY_START IS '전형 시작일';
COMMENT ON COLUMN JOB_STAGY.STAGY_END IS '전형 종료일';
COMMENT ON COLUMN JOB_STAGY.STATUS IS '전형 미진행: N / 전형 진행중: P / 전형 종료: E)';


-- APPLICANTS (지원자 정보)
CREATE TABLE APPLICANTS (
    APPLICANTS_NO NUMBER PRIMARY KEY NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    APPLICANTS_DATE DATE NOT NULL,
    RESUME_STATUS CHAR(1) NOT NULL,
    SCORE NUMBER NULL,
    MEMO VARCHAR2(200) NULL,
    APPLICATION_STATUS VARCHAR2(15) NOT NULL,
    PASS_STATUS CHAR(1) NOT NULL
);

COMMENT ON COLUMN APPLICANTS.APPLICANTS_NO IS '지원자 고유키';
COMMENT ON COLUMN APPLICANTS.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN APPLICANTS.POSITION_NO IS '포지션 고유키';
COMMENT ON COLUMN APPLICANTS.RESUME_NO IS '이력서 고유키';
COMMENT ON COLUMN APPLICANTS.APPLICANTS_DATE IS '지원일자';
COMMENT ON COLUMN APPLICANTS.RESUME_STATUS IS '이력서 상태(열람완료: Y / 미열람: N)';
COMMENT ON COLUMN APPLICANTS.SCORE IS '평가 점수';
COMMENT ON COLUMN APPLICANTS.MEMO IS '평가 관련 메모';
COMMENT ON COLUMN APPLICANTS.APPLICATION_STATUS IS '지원 전형 단계';
COMMENT ON COLUMN APPLICANTS.PASS_STATUS IS '합격 상태(미분류: N / 합격: P / 불합격: F)';


-- BUSINESS_BOOKMARK (기업용_구직자 즐겨찾기)
CREATE TABLE BUSINESS_BOOKMARK (
    BUSINESS_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    FLOER VARCHAR(15) NULL,
    ADD_DATE TIMESTAMP NULL
);

COMMENT ON COLUMN BUSINESS_BOOKMARK.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN BUSINESS_BOOKMARK.RESUME_NO IS '이력서 고유키';
COMMENT ON COLUMN BUSINESS_BOOKMARK.FLOER IS '분류 폴더명';
COMMENT ON COLUMN BUSINESS_BOOKMARK.ADD_DATE IS '즐겨찾기 추가 날짜';


--==============================================================================

/* PERSON_BOOKMARK 테이블 생성 */
CREATE TABLE PERSON_BOOKMARK (
    PERSON_NO NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    FOLDER VARCHAR2(15) NULL,
    ADD_DATE TIMESTAMP NOT NULL
);

COMMENT ON COLUMN PERSON_BOOKMARK.PERSON_NO IS '개인 번호';
COMMENT ON COLUMN PERSON_BOOKMARK.RECRUITMENT_NO IS '채용 번호';
COMMENT ON COLUMN PERSON_BOOKMARK.FOLDER IS '폴더';
COMMENT ON COLUMN PERSON_BOOKMARK.ADD_DATE IS '추가 날짜';


/* PERSON (개인 정보 테이블) */
CREATE TABLE PERSON (
    PERSON_NO NUMBER PRIMARY KEY NOT NULL,  -- SEQ_PNO
    NAME VARCHAR2(15) NULL,
    BIRTHDAY DATE NULL,
    GENDER VARCHAR2(3) NULL,
    ADDRESS VARCHAR2(100) NULL
);

COMMENT ON COLUMN PERSON.PERSON_NO IS '개인 고유키';
COMMENT ON COLUMN PERSON.NAME IS '회원 이름';
COMMENT ON COLUMN PERSON.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN PERSON.GENDER IS '성별';
COMMENT ON COLUMN PERSON.ADDRESS IS '주소';


CREATE TABLE RESUME(        
    RESUME_NO NUMBER NOT NULL PRIMARY KEY,                       -- 이력서 번호
    PERSON_NO NUMBER NOT NULL,                                   -- 사람 번호
    RESUME_TITLE VARCHAR2(100) NOT NULL,                        -- 이력서 제목
    CREATE_DATE DATE DEFAULT SYSDATE,                           -- 생성일자
    MODIFIED_DATE DATE DEFAULT SYSDATE,                         -- 수정일자
    DELETED CHAR(1) DEFAULT 'N',                                 -- 삭제 여부
    USER_NAME VARCHAR2(50) NOT NULL,                             -- 사용자 이름
    USER_GENDER CHAR(1) NOT NULL CHECK (USER_GENDER IN ('M', 'F')), -- 성별
    USER_BIRTH DATE NOT NULL,                                    -- 생년월일
    USER_EMAIL VARCHAR2(100) NOT NULL,                           -- 이메일
    USER_PHONE VARCHAR2(20) NOT NULL,                            -- 전화번호
    USER_ADDRESS VARCHAR2(255) NOT NULL,                         -- 주소
    USER_ROAD_ADDRESS VARCHAR2(255),                             -- 도로명 주소
    USER_DETAIL_ADDRESS VARCHAR2(255),                           -- 상세 주소
    USER_PIC VARCHAR2(500),                                      -- 사용자 사진
    EDUCATION_LEVEL VARCHAR2(10) NOT NULL,                       -- 학력 수준 (educationLevel)
    ACADEMIC_NAME_EL VARCHAR2(30) NULL,
    ACADEMIC_NAME_MI VARCHAR2(30) NULL,
    ACADEMIC_NAME_HI VARCHAR2(30) NULL,
    ACADEMIC_NAME VARCHAR2(30) NULL,                         -- 학력 이름 (academicName)
    MAJOR VARCHAR2(100) NULL,                                 -- 전공 (majorName)
    DEGREE VARCHAR2(10),                                          -- 학위 (degree)
    STATUS VARCHAR2(20) NULL,
    STATUS_EL VARCHAR2(20) NULL,
    STATUS_MI VARCHAR2(20) NULL,
    STATUS_HI VARCHAR2(20) NULL,                                 -- 상태 (graduationStatus)
    ENTER_DATE_EL DATE,                                              -- 입학 날짜 (enterDate)
    GRADUATION_DATE_EL DATE,
    ENTER_DATE_MI DATE,                                              -- 입학 날짜 (enterDate)
    GRADUATION_DATE_MI DATE,
    ENTER_DATE_HI DATE,                                              -- 입학 날짜 (enterDate)
    GRADUATION_DATE_HI DATE,
    ENTER_DATE_COL DATE,                                              -- 입학 날짜 (enterDate)
    GRADUATION_DATE_COL DATE,                                         -- 졸업 날짜 (graduationDate)
    LOCATION_EL VARCHAR2(10) NULL, 
    LOCATION_MI VARCHAR2(10) NULL, 
    LOCATION_HI VARCHAR2(10) NULL, 
    LOCATION VARCHAR2(10) NULL,                               -- 위치 (location)
    EXAM_PASSED_EL CHAR(1),
    EXAM_PASSED_MI CHAR(1),
    EXAM_PASSED_HI CHAR(1),                                          -- 시험 합격 여부 (examPassed)
    SKILL VARCHAR2(1000),                                         -- 스킬 (skillName)
    ACTICITY_TYPE VARCHAR2(50),                                   -- 활동 유형 (activityType)
    ORGANIZATION_NAME VARCHAR2(100),                              -- 기관 이름 (organizationName)
    START_DATE_ACT DATE,                                          -- 활동 시작 날짜 (startDateAct)
    END_DATE_ACT DATE,                                            -- 활동 종료 날짜 (endDateAct)
    DESCRIPTION VARCHAR2(300),                                    -- 설명 (description)
    CATEGORY VARCHAR2(30),                                        -- 카테고리 (category)
    NAME VARCHAR2(30),                                            -- 이름 (name)
    ISSUED_BY VARCHAR2(30),                                       -- 발행 기관 (issuingAgency)
    PROFICIENCY_LEVEL VARCHAR2(30),                               -- 숙련도 수준 (proficiencyLevel)
    KIND_OF_LANGUAGE VARCHAR2(10) NULL,                       -- 언어 종류 (languageType)
    PASSING_CATEGORY VARCHAR2(30),                                -- 합격 카테고리 (passStatus)
    AWARD_NAME VARCHAR2(50),                                      -- 수상 이름 (awardName)
    ORGANIZER VARCHAR2(50),                                       -- 주최 기관 (organizer)
    AWARD_DATE DATE,                                              -- 수상 날짜 (awardDate)
    ISSUE_DATE DATE,                                              -- 발급 날짜 (issueDate)
    VETERAN_REASON VARCHAR2(100),                                 -- 보훈 사유 (veteranReason)
    SERVICE_STATE VARCHAR2(20) NOT NULL,                          -- 병역 상태 (serviceStatus)
    UNFULFILLED_REASON VARCHAR2(50),                              -- 미필 사유 (unfinishedReason)
    EXEMPTED_REASON VARCHAR2(50),                                 -- 면제 사유 (exemptionReason)
    ENLISTMENT_DATE DATE,                                         -- 입대일 (enlistmentDate)
    DISCHARGE_DATE DATE,                                          -- 전역일 (dischargeDate)
    MILITARY_SELECTION VARCHAR2(10),                              -- 군별 선택 (militaryBranch)
    CLASS_SELECTION VARCHAR2(10),                                 -- 계급 선택 (rank)
    DISCHARGE_REASON VARCHAR2(50),                                -- 전역 사유 (dischargeReason)
    WORK VARCHAR2(20) NOT NULL,                                   -- 직무 (work)
    DEPARTMENT VARCHAR2(20) NOT NULL,                            -- 부서 (department)
    COMPANY_TITLE VARCHAR2(50) NOT NULL,                          -- 회사명 (companyTitle)
    START_DATE_WORK DATE NOT NULL,                                -- 업무 시작 날짜 (startDateWork)
    END_DATE_WORK DATE,                                           -- 업무 종료 날짜 (endDateWork)
    STATUS_WORK CHAR(1) NOT NULL CHECK (STATUS_WORK IN ('Y', 'N', 'P')), -- 업무 상태 (careerStatus)
    JOB_CONTENT VARCHAR2(100) NOT NULL,                           -- 업무 내용 (jobContent)
    POSITION VARCHAR2(20) NOT NULL                                 -- 직급/직책 (position)
);

/* RESUME 테이블에 기본 키 추가 */
ALTER TABLE RESUME
ADD CONSTRAINT PK_RESUME PRIMARY KEY (RESUME_NO);


/* SELF_INTRODUCTION 테이블 생성 */
CREATE TABLE SELF_INTRODUCTION (
    SELF_INTRODUCTION_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(500) NOT NULL,
    CREATED_DATE DATE NOT NULL,
    MODIFIED_DATE DATE NULL,
    DELETED CHAR(1) NULL CHECK (DELETED IN ('Y', 'N')),
    PERSON_NO NUMBER NOT NULL
);

ALTER TABLE SELF_INTRODUCTION
ADD CONSTRAINT FK_SELF_INTRO_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO);

COMMENT ON COLUMN SELF_INTRODUCTION.SELF_INTRODUCTION_NO IS '자기소개 번호';
COMMENT ON COLUMN SELF_INTRODUCTION.RESUME_NO IS '이력서 번호';
COMMENT ON COLUMN SELF_INTRODUCTION.USER_ID IS '회원 아이디';
COMMENT ON COLUMN SELF_INTRODUCTION.TITLE IS '자기소개 제목';
COMMENT ON COLUMN SELF_INTRODUCTION.CONTENT IS '자기소개 내용';
COMMENT ON COLUMN SELF_INTRODUCTION.CREATED_DATE IS '생성 날짜';
COMMENT ON COLUMN SELF_INTRODUCTION.MODIFIED_DATE IS '수정 날짜';
COMMENT ON COLUMN SELF_INTRODUCTION.DELETED IS '삭제 여부';

/* PORTFOLIO 테이블 생성 */
CREATE TABLE PORTFOLIO (
    PORTFOLIO_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    TYPE VARCHAR2(10) NOT NULL CHECK (TYPE IN ('파일', 'URL')),
    FILE_URL VARCHAR2(200) NULL
);

COMMENT ON COLUMN PORTFOLIO.PORTFOLIO_NO IS '포트폴리오 번호';
COMMENT ON COLUMN PORTFOLIO.RESUME_NO IS '이력서 번호';
COMMENT ON COLUMN PORTFOLIO.TITLE IS '포트폴리오 제목';
COMMENT ON COLUMN PORTFOLIO.TYPE IS '포트폴리오 타입';
COMMENT ON COLUMN PORTFOLIO.FILE_URL IS '파일 또는 URL 주소';


/* 관심태그 테이블 생성 */
CREATE TABLE USER_TAGS (
    TAG_ID NUMBER PRIMARY KEY NOT NULL,      
    USER_NO NUMBER NOT NULL,                   
    TAG_NAME VARCHAR2(50) NOT NULL,           
    CREATED_DATE DATE DEFAULT SYSDATE,        
    CONSTRAINT FK_USER_TAGS_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);

/* 컬럼 설명 */
COMMENT ON COLUMN USER_TAGS.TAG_ID IS '태그 고유 번호';
COMMENT ON COLUMN USER_TAGS.USER_NO IS '회원 고유 번호 (MEMBER의 USER_NO)';
COMMENT ON COLUMN USER_TAGS.TAG_NAME IS '관심 태그 이름';
COMMENT ON COLUMN USER_TAGS.CREATED_DATE IS '태그 생성 날짜';


/* 관심태그 ID 시퀀스 생성 */
CREATE SEQUENCE SEQ_TAG_ID START WITH 1 INCREMENT BY 1 NOCACHE;   

/* 제약조건 추가 */
/*
ALTER TABLE MEMBER
    ADD CONSTRAINT FK_MEMBER_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);
ALTER TABLE MEMBER
    ADD CONSTRAINT FK_MEMBER_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO);

ALTER TABLE POSTING
    ADD CONSTRAINT PK_POSTING PRIMARY KEY (POSTING_NO);
ALTER TABLE POSTING
    ADD CONSTRAINT FK_POSTING_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);
ALTER TABLE POSTING
    ADD CONSTRAINT FK_POSTING_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO);
ALTER TABLE POSTING
    ADD CONSTRAINT FK_POSTING_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO);

ALTER TABLE COMMUNITY_POST_JOB_CATEGORY
    ADD CONSTRAINT FK_COMMUNITY_JOB_CATEGORY FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO);

ALTER TABLE COMMUNITY_POST_HASHTAG
    ADD CONSTRAINT FK_COMMUNITY_HASHTAG FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO);

ALTER TABLE BUSINESS_BENEFIT
    ADD CONSTRAINT FK_BUSINESS_BENEFIT FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);

ALTER TABLE WORK_ENVIRONMENT_IMAGE
    ADD CONSTRAINT PK_WORK_ENVIRONMENT_IMAGE PRIMARY KEY (WORK_ENVIRONMENT_IMAGE_NO);
ALTER TABLE WORK_ENVIRONMENT_IMAGE
    ADD CONSTRAINT FK_WORK_ENVIRONMENT_IMAGE FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);

ALTER TABLE RESUME
    ADD CONSTRAINT PK_RESUME PRIMARY KEY (RESUME_NO, PERSON_NO);

ALTER TABLE BUSINESS_BOOKMARK
    ADD (PERSON_NO NUMBER);

ALTER TABLE BUSINESS_BOOKMARK
    ADD CONSTRAINT FK_BUSINESS_BOOKMARK_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE JOB_POSTING
    ADD CONSTRAINT PK_JOB_POSTING PRIMARY KEY (RECRUITMENT_NO);
ALTER TABLE JOB_POSTING
    ADD CONSTRAINT FK_JOB_POSTING_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);

ALTER TABLE JOB_REQUIREMENTS
    ADD CONSTRAINT PK_JOB_REQUIREMENTS PRIMARY KEY (POSITION_NO);
ALTER TABLE JOB_REQUIREMENTS
    ADD CONSTRAINT FK_JOB_REQ_RECRUIT_NO FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO);

ALTER TABLE APPLICANTS
    ADD CONSTRAINT PK_APPLICANTS PRIMARY KEY (APPLICANTS_NO);
ALTER TABLE APPLICANTS
    ADD CONSTRAINT FK_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO);

ALTER TABLE APPLICANTS
    ADD (PERSON_NO NUMBER);
ALTER TABLE APPLICANTS
    ADD CONSTRAINT FK_APPLICANTS_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE PERSON_BOOKMARK
    ADD CONSTRAINT FK_PERSON_BOOKMARK_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO);
ALTER TABLE PERSON_BOOKMARK
    ADD CONSTRAINT FK_PERSON_BOOKMARK_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO);

ALTER TABLE RESUME
    ADD CONSTRAINT FK_RESUME_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO);

ALTER TABLE SELF_INTRODUCTION
    ADD (PERSON_NO NUMBER);
ALTER TABLE SELF_INTRODUCTION
    ADD CONSTRAINT PK_SELF_INTRODUCTION PRIMARY KEY (SELF_INTRODUCTION_NO, RESUME_NO);
ALTER TABLE SELF_INTRODUCTION
    ADD CONSTRAINT FK_SELF_INTRO_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE PORTFOLIO
    ADD (PERSON_NO NUMBER);
ALTER TABLE PORTFOLIO
    ADD CONSTRAINT PK_PORTFOLIO PRIMARY KEY (PORTFOLIO_NO, RESUME_NO);
ALTER TABLE PORTFOLIO
    ADD CONSTRAINT FK_PORTFOLIO_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);


/* REPLY 테이블 제약조건 추가 */
/*
ALTER TABLE REPLY
    ADD CONSTRAINT FK_REPLY_POSTING FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO);

ALTER TABLE REPLY
    ADD CONSTRAINT FK_REPLY_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO);
*/
-- COMMUNITY_POST_JOB_CATEGORY 테이블에 기본 키 추가
/*
ALTER TABLE COMMUNITY_POST_JOB_CATEGORY
ADD CONSTRAINT PK_COMMUNITY_POST_JOB_CATEGORY PRIMARY KEY (POSTING_NO, JOB_CATEGORY);
*/
-- COMMUNITY_POST_HASHTAG 테이블에 기본 키 추가
/*
ALTER TABLE COMMUNITY_POST_HASHTAG
ADD CONSTRAINT PK_COMMUNITY_POST_HASHTAG PRIMARY KEY (POSTING_NO, HASHTAG);

*/

CREATE SEQUENCE SEQ_UNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 유저 고유키
CREATE SEQUENCE SEQ_PNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 개인 고유키
CREATE SEQUENCE SEQ_BNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 기업 고유키
CREATE SEQUENCE SEQ_JOB START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 채용공고 고유키
CREATE SEQUENCE SEQ_JOB_P START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;   -- 포지션 고유키

CREATE SEQUENCE RESUME_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE POSTING_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE REPLY_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SELF_INTRO_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE BUSINESS_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE WORK_ENVIRONMENT_IMAGE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


commit;