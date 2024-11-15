-- USER 생성 (관리자 계정으로 실행)
-- CREATE USER CODESYNC IDENTIFIED BY CODESYNC;
-- GRANT CONNECT, RESOURCE TO CODESYNC;

DROP TABLE CAREER CASCADE CONSTRAINTS;
DROP TABLE SKILL CASCADE CONSTRAINTS;
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;
DROP TABLE SELF_INTRODUCTION CASCADE CONSTRAINTS;
DROP TABLE EMPLOYMENT_PREFERENCES CASCADE CONSTRAINTS;
DROP TABLE EXPERIENCE CASCADE CONSTRAINTS;
DROP TABLE QUALIFICATION CASCADE CONSTRAINTS;
DROP TABLE ACADEMIC_ABILITY CASCADE CONSTRAINTS;
DROP TABLE APPLICANTS CASCADE CONSTRAINTS;
DROP TABLE PERSON_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE JOB_REQUIREMENTS CASCADE CONSTRAINTS;
DROP TABLE JOB_POSTING CASCADE CONSTRAINTS;
DROP TABLE WORK_ENVIRONMENT_IMAGE CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BENEFIT CASCADE CONSTRAINTS;
DROP TABLE BUSINESS CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_POST_HASHTAG CASCADE CONSTRAINTS;
DROP TABLE COMMUNITY_POST_JOB_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE POSTING CASCADE CONSTRAINTS;
DROP TABLE RESUME CASCADE CONSTRAINTS;
DROP TABLE PERSON CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_PNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_JNO;
DROP SEQUENCE SEQ_JNO_R;
DROP SEQUENCE RESUME_SEQ;
DROP SEQUENCE BASICINFO_SEQ;
DROP SEQUENCE QUALIFICATION_SEQ;
DROP SEQUENCE ACADEMIC_ABILITY_SEQ;
DROP SEQUENCE EXPERIENCE_SEQ;
DROP SEQUENCE EMPLOYMENT_PREFERENCES_SEQ;
DROP SEQUENCE SKILL_SEQ;
DROP SEQUENCE CAREER_SEQ;
DROP SEQUENCE POSTING_SEQ;
DROP SEQUENCE REPLY_SEQ


--------------------------------------------------
-- 1. 독립 테이블 생성
--------------------------------------------------

-- BUSINESS 테이블 생성
CREATE TABLE BUSINESS (
    BUSINESS_NO NUMBER NOT NULL PRIMARY KEY,
    REGISTRATION_NUMBER VARCHAR2(12) NOT NULL,
    OWNER_NAME VARCHAR2(15) NOT NULL,
    COMPANY_NAME VARCHAR2(50) NOT NULL,
    COMPANY_CODE NUMBER NOT NULL,
    COMPANY_TEL VARCHAR2(15) NOT NULL,
    COMPANY_ADDR VARCHAR2(50) NOT NULL,
    COMPANY_FAX VARCHAR2(15) NULL,
    COMPANY_SITE VARCHAR2(50) NULL,
    LOGO VARCHAR2(500) NULL,
    INTRODUCTION CLOB NULL,
    VISION CLOB NULL,
    COMPANY_TYPE VARCHAR2(50) NULL,
    EMPLOYEE_COUNT NUMBER NULL,
    INDUSTRY VARCHAR2(100) NULL,
    BRAND_NAME VARCHAR2(100) NULL
);

-- PERSON 테이블 생성
CREATE TABLE PERSON (
    PERSON_NO NUMBER NOT NULL PRIMARY KEY,
    NAME VARCHAR2(15) NOT NULL,
    BIRTHDAY DATE NULL,
    GENDER VARCHAR2(3) NULL,
    PHONE VARCHAR2(13) NULL,
    ADDRESS VARCHAR2(100) NULL
);

--------------------------------------------------
-- 2. 의존 테이블 생성 (BUSINESS, PERSON을 참조)
--------------------------------------------------

-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
    USER_NO NUMBER NOT NULL PRIMARY KEY,
    USER_TYPE CHAR(1) NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    USER_PWD VARCHAR2(16) NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    EROLL_DATE DATE,
    MODIFY_DATE TIMESTAMP NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')),
    BUSINESS_NO NUMBER NULL,
    PERSON_NO NUMBER NULL,
    CONSTRAINT FK_MEMBER_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO),
    CONSTRAINT FK_MEMBER_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO)
);

--------------------------------------------------
-- 3. RESUME 테이블 생성 (PERSON을 참조)
--------------------------------------------------

-- RESUME 테이블 생성
CREATE TABLE RESUME (
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    MODIFIED_DATE DATE NOT NULL,
    DELETED CHAR(1) NOT NULL CHECK (DELETED IN ('Y', 'N')),
    PRIMARY KEY (RESUME_NO, PERSON_NO),
    CONSTRAINT FK_RESUME_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO)
);

--------------------------------------------------
-- 4. 기타 테이블 생성 (참조 순서에 맞게)
--------------------------------------------------

-- POSTING 테이블 생성
CREATE TABLE POSTING (
    POSTING_NO NUMBER NOT NULL PRIMARY KEY,
    CATEGORY VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(225) NOT NULL,
    CONTENT CLOB NOT NULL,
    IMAGE BLOB NULL,
    AUTHOR VARCHAR2(100) NOT NULL,
    USER_NO NUMBER NOT NULL,
    CREATED_TIME TIMESTAMP NOT NULL,
    UPDATED_TIME TIMESTAMP NULL,
    VIEW_COUNT NUMBER NOT NULL,
    LIKE_COUNT NUMBER NOT NULL,
    BUSINESS_NO NUMBER NULL,
    PERSON_NO NUMBER NULL,
    CONSTRAINT FK_POSTING_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    CONSTRAINT FK_POSTING_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO),
    CONSTRAINT FK_POSTING_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO)
);

-- REPLY 테이블 생성
CREATE TABLE REPLY (
    REPLY_NO NUMBER NOT NULL PRIMARY KEY,
    POSTING_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    CONTENT CLOB NOT NULL,
    CREATED_TIME TIMESTAMP DEFAULT SYSDATE,
    LIKE_COUNT NUMBER DEFAULT 0,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y','N')),
    CONSTRAINT FK_REPLY_POSTING FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO),
    CONSTRAINT FK_REPLY_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);

-- COMMUNITY_POST_JOB_CATEGORY 테이블 생성
CREATE TABLE COMMUNITY_POST_JOB_CATEGORY (
    POSTING_NO NUMBER NOT NULL,
    JOB_CATEGORY VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_COMMUNITY_JOB_CATEGORY FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO)
);

-- COMMUNITY_POST_HASHTAG 테이블 생성
CREATE TABLE COMMUNITY_POST_HASHTAG (
    POSTING_NO NUMBER NOT NULL,
    HASHTAG VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_COMMUNITY_HASHTAG FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO)
);

-- BUSINESS_BENEFIT 테이블 생성
CREATE TABLE BUSINESS_BENEFIT (
    BUSINESS_NO NUMBER NOT NULL,
    BENEFIT VARCHAR2(100) NULL,
    CONSTRAINT FK_BUSINESS_BENEFIT FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO)
);

-- WORK_ENVIRONMENT_IMAGE 테이블 생성
CREATE TABLE WORK_ENVIRONMENT_IMAGE (
    WORK_ENVIRONMENT_IMAGE_NO NUMBER NOT NULL PRIMARY KEY,
    BUSINESS_NO NUMBER NOT NULL,
    IMAGE_URL VARCHAR2(500) NULL,
    TITLE VARCHAR2(255) NULL,
    CONSTRAINT FK_WORK_ENVIRONMENT_IMAGE FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO)
);

-- JOB_POSTING 테이블 생성
CREATE TABLE JOB_POSTING (
    RECRUITMENT_NO NUMBER NOT NULL PRIMARY KEY,
    BUSINESS_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    REPRESENTATIVE_NAME VARCHAR2(15) NOT NULL,
    REPRESENTATIVE_DEPT VARCHAR2(30) NOT NULL,
    REPRESENTATIVE_EMAIL VARCHAR2(50) NOT NULL,
    METHOD CHAR(1) NOT NULL,
    START_DATE TIMESTAMP NOT NULL,
    DEADLINE TIMESTAMP NOT NULL,
    POSTING_DATE DATE NOT NULL,
    CONTENT_IMG VARCHAR2(100) NULL,
    CONTENT_TEXT VARCHAR2(3000) NULL,
    CONSTRAINT FK_JOB_POSTING_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO)
);

-- JOB_REQUIREMENTS 테이블 생성
CREATE TABLE JOB_REQUIREMENTS (
    POSITION_NO NUMBER NOT NULL PRIMARY KEY,
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
    MAX_CAREER NUMBER NOT NULL,
    CONSTRAINT FK_JOB_REQ_RECRUIT_NO FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO)
);

-- PERSON_BOOKMARK 테이블 생성
CREATE TABLE PERSON_BOOKMARK (
    PERSON_NO NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    FOLDER VARCHAR2(15) NULL,
    ADD_DATE TIMESTAMP NOT NULL,
    CONSTRAINT FK_PERSON_BOOKMARK_PERSON FOREIGN KEY (PERSON_NO) REFERENCES PERSON (PERSON_NO),
    CONSTRAINT FK_PERSON_BOOKMARK_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO)
);

-- APPLICANTS 테이블 생성
CREATE TABLE APPLICANTS (
    APPLICANTS_NO NUMBER NOT NULL PRIMARY KEY,
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    APPLICANTS_DATE DATE NOT NULL,
    RESUME_STATUS CHAR(1) NOT NULL,
    SCORE NUMBER NULL,
    MEMO VARCHAR2(200) NULL,
    APPLICATION_STATUS VARCHAR2(15) NOT NULL,
    PASS_STATUS CHAR(1) NOT NULL,
    CONSTRAINT FK_APPLICANTS_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_POSTING (RECRUITMENT_NO),
    CONSTRAINT FK_APPLICANTS_POSITION FOREIGN KEY (POSITION_NO) REFERENCES JOB_REQUIREMENTS (POSITION_NO),
    CONSTRAINT FK_APPLICANTS_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

-- ACADEMIC_ABILITY 테이블 생성
CREATE TABLE ACADEMIC_ABILITY (
    ACADEMIC_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    EDUCATION_LEVEL VARCHAR2(20) NOT NULL,
    ACADEMIC_NAME VARCHAR2(100) NOT NULL,
    MAJOR VARCHAR2(100) NULL,
    DEGREE VARCHAR2(50) NULL,
    GRADUATION_STATUS VARCHAR2(20) NOT NULL,
    ENTER_DATE DATE NULL,
    GRADUATION_DATE DATE NULL,
    LOCATION VARCHAR2(50) NOT NULL,
    EXAM_PASSED CHAR(1) NULL,
    CONSTRAINT FK_ACADEMIC_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

-- QUALIFICATION 테이블 생성 (수정됨)
CREATE TABLE QUALIFICATION (
    QUALIFICATION_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    CATEGORY VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(100) NOT NULL,
    ISSUING_AGENCY VARCHAR2(100),
    PROFICIENCY_LEVEL NUMBER,
    LANGUAGE_TYPE VARCHAR2(20),
    PASS_STATUS VARCHAR2(20),
    ISSUE_DATE DATE,
    CONSTRAINT FK_QUALIFICATION_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

-- EXPERIENCE 테이블 생성
CREATE TABLE EXPERIENCE (
    EXPERIENCE_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    ACTIVITY_TYPE VARCHAR2(50) NOT NULL,
    ORGANIZATION_NAME VARCHAR2(100) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    DESCRIPTION VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_EXPERIENCE_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

-- EMPLOYMENT_PREFERENCES 테이블 통합 생성
CREATE TABLE EMPLOYMENT_PREFERENCES (
    EMPLOYMENT_PREFERENCES_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    MARRIAGE_REASON VARCHAR2(200) NULL,  -- 보훈사유
    IS_MILITARY_TARGET VARCHAR2(10) NOT NULL CHECK (IS_MILITARY_TARGET IN ('not', 'unfulfilled', 'fulfilled', 'exempted', 'serving')),
    
    -- 병역 관련 컬럼
    SERVICE_STATUS VARCHAR2(20) NULL CHECK (SERVICE_STATUS IN ('unfulfilled', 'fulfilled', 'exempted', 'serving')),
    ENLISTMENT_DATE DATE NULL,         -- 입대일
    DISCHARGE_DATE DATE NULL,          -- 전역일
    MILITARY_BRANCH VARCHAR2(20) NULL, -- 군별 선택
    RANK VARCHAR2(20) NULL,            -- 계급 선택
    DISCHARGE_REASON VARCHAR2(20) NULL,-- 전역 사유 선택
    EXEMPTION_REASON VARCHAR2(225) NULL, -- 면제 사유
    UNFINISHED_REASON VARCHAR2(225) NULL, -- 미필 사유

    FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

-- SELF_INTRODUCTION 테이블 생성
CREATE TABLE SELF_INTRODUCTION (
    SELF_INTRODUCTION_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(500) NOT NULL,
    CREATED_DATE DATE NOT NULL,
    MODIFIED_DATE DATE NULL,
    DELETED CHAR(1) CHECK (DELETED IN ('Y', 'N')),
    CONSTRAINT FK_SELF_INTRO_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME(RESUME_NO, PERSON_NO)
);

-- PORTFOLIO 테이블 생성
CREATE TABLE PORTFOLIO (
    PORTFOLIO_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    TYPE VARCHAR2(10) NOT NULL CHECK (TYPE IN ('파일', 'URL')),
    FILE_URL VARCHAR2(200) NULL,
    CONSTRAINT FK_PORTFOLIO_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME(RESUME_NO, PERSON_NO)
);

-- SKILL 테이블 생성
CREATE TABLE SKILL (
    SKILL_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    SKILL_NAME VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_SKILL_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME(RESUME_NO, PERSON_NO)
);

-- CAREER 테이블 생성
CREATE TABLE CAREER (
    WORK_EX_NO NUMBER NOT NULL PRIMARY KEY,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    COMPANY_TITLE VARCHAR2(50) NOT NULL,
    WORK VARCHAR2(20) NOT NULL,
    DEPARTMENT VARCHAR2(20) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NULL,
    STATUS VARCHAR2(15) NOT NULL CHECK (STATUS IN ('working', 'retire', 'retire_plan')),
    JOB_CONTENT VARCHAR2(500) NOT NULL,
    POSITION VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_CAREER_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME(RESUME_NO, PERSON_NO)
);

-- BUSINESS_BOOKMARK 테이블 생성 (수정됨)
CREATE TABLE BUSINESS_BOOKMARK (
    BUSINESS_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    FOLDER VARCHAR2(15) NULL,
    ADD_DATE TIMESTAMP NULL,
    CONSTRAINT FK_BUSINESS_BOOKMARK_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO),
    CONSTRAINT FK_BUSINESS_BOOKMARK_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO)
);

--------------------------------------------------
-- 5. 시퀀스 생성
--------------------------------------------------

CREATE SEQUENCE SEQ_UNO NOCACHE;
CREATE SEQUENCE SEQ_PNO NOCACHE;
CREATE SEQUENCE SEQ_BNO NOCACHE;
CREATE SEQUENCE SEQ_JNO NOCACHE;
CREATE SEQUENCE SEQ_JNO_R NOCACHE;
CREATE SEQUENCE RESUME_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE BASICINFO_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE QUALIFICATION_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE ACADEMIC_ABILITY_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE EXPERIENCE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE EMPLOYMENT_PREFERENCES_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SKILL_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE CAREER_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE POSTING_SEQ NOCACHE;
CREATE SEQUENCE REPLY_SEQ NOCACHE;
