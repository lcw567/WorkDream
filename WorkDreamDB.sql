/* USER 占쏙옙占쏙옙 (占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙) */
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
DROP TABLE JOB_POSTING CASCADE CONSTRAINTS;
DROP TABLE JOB_REQUIREMENTS CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE PERSON_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE APPLICANTS CASCADE CONSTRAINTS;
DROP TABLE PERSON CASCADE CONSTRAINTS;
DROP TABLE RESUME CASCADE CONSTRAINTS;
DROP TABLE ACADEMIC_ABILITY CASCADE CONSTRAINTS;
DROP TABLE LICENSE CASCADE CONSTRAINTS;
DROP TABLE LANGUAGE CASCADE CONSTRAINTS;
DROP TABLE AWARD CASCADE CONSTRAINTS;
DROP TABLE EXPERIENCE CASCADE CONSTRAINTS;
DROP TABLE EMPLOYMENT_PREFERENCES1 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYMENTPREFERENCE CASCADE CONSTRAINTS;
DROP TABLE MILITARYSERVICE CASCADE CONSTRAINTS;
DROP TABLE SELF_INTRODUCTION CASCADE CONSTRAINTS;
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;
DROP TABLE SKILL CASCADE CONSTRAINTS;
DROP TABLE CAREER CASCADE CONSTRAINTS;

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
DROP SEQUENCE REPLY_SEQ;

/* Member */
/* MEMBER 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE MEMBER (
    USER_NO NUMBER NOT NULL,
    USER_TYPE CHAR(1) NOT NULL,
    USER_ID VARCHAR(20) NOT NULL,
    USER_PWD VARCHAR(16) NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    EROLL_DATE DATE,
    MODIFY_DATE TIMESTAMP NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')),
    BUSINESS_NO NUMBER NULL,
    PERSON_NO NUMBER NULL
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회占쏙옙占쏙옙호';
COMMENT ON COLUMN MEMBER.USER_TYPE IS '회占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MEMBER.USER_ID IS '회占쏙옙占쏙옙占싱듸옙';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회占쏙옙占쏙옙橘占싫';
COMMENT ON COLUMN MEMBER.EMAIL IS '占싱몌옙占쏙옙';
COMMENT ON COLUMN MEMBER.EROLL_DATE IS '회占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MEMBER.STATUS IS '회占쏙옙占쏙옙占쏙옙(Y/N)';
COMMENT ON COLUMN MEMBER.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN MEMBER.PERSON_NO IS '占쏙옙占싸뱄옙호';

/* POSTING 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE POSTING (
    POSTING_NO NUMBER NOT NULL,
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

COMMENT ON COLUMN POSTING.POSTING_NO IS '占쌉시글뱄옙호';
COMMENT ON COLUMN POSTING.CATEGORY IS '카占쌓곤옙';
COMMENT ON COLUMN POSTING.TITLE IS '占쌉시글놂옙占쏙옙';
COMMENT ON COLUMN POSTING.CONTENT IS '占쏙옙占쏙옙';
COMMENT ON COLUMN POSTING.IMAGE IS '占싱뱄옙占쏙옙';
COMMENT ON COLUMN POSTING.AUTHOR IS '占쌜쇽옙占쏙옙';
COMMENT ON COLUMN POSTING.USER_NO IS '회占쏙옙占쏙옙호';
COMMENT ON COLUMN POSTING.CREATED_TIME IS '占쌜쇽옙占시곤옙';
COMMENT ON COLUMN POSTING.UPDATED_TIME IS '占쏙옙占쏙옙占시곤옙';
COMMENT ON COLUMN POSTING.VIEW_COUNT IS '占쏙옙회占쏙옙';
COMMENT ON COLUMN POSTING.LIKE_COUNT IS '占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN POSTING.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN POSTING.STATUS IS '占쏙옙占쏙옙 (Y/N)';
COMMENT ON COLUMN POSTING.PERSON_NO IS '占쏙옙占싸뱄옙호';

/* REPLY 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE REPLY (
    REPLY_NO NUMBER NOT NULL,
    POSTING_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    CONTENT CLOB NOT NULL,
    CREATED_TIME TIMESTAMP DEFAULT SYSDATE,
    LIKE_COUNT NUMBER DEFAULT 0,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK (STATUS IN ('Y','N')),
    PRIMARY KEY (REPLY_NO)
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '占쏙옙占 占쏙옙호';
COMMENT ON COLUMN REPLY.POSTING_NO IS '占쌉시깍옙 占쏙옙호';
COMMENT ON COLUMN REPLY.USER_NO IS '회占쏙옙 占쏙옙호';
COMMENT ON COLUMN REPLY.CONTENT IS '占쏙옙占 占쏙옙占쏙옙';
COMMENT ON COLUMN REPLY.CREATED_TIME IS '占쌜쇽옙 占시곤옙';
COMMENT ON COLUMN REPLY.LIKE_COUNT IS '占쏙옙占싣울옙 占쏙옙';
COMMENT ON COLUMN REPLY.STATUS IS '占쏙옙占쏙옙 (Y/N)';

/* COMMUNITY_POST_JOB_CATEGORY 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE COMMUNITY_POST_JOB_CATEGORY (
    POSTING_NO NUMBER NOT NULL,
    JOB_CATEGORY VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN COMMUNITY_POST_JOB_CATEGORY.POSTING_NO IS '占쌉시글뱄옙호';
COMMENT ON COLUMN COMMUNITY_POST_JOB_CATEGORY.JOB_CATEGORY IS '占쏙옙占쏙옙카占쌓곤옙';

/* COMMUNITY_POST_HASHTAG 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE COMMUNITY_POST_HASHTAG (
    POSTING_NO NUMBER NOT NULL,
    HASHTAG VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN COMMUNITY_POST_HASHTAG.POSTING_NO IS '占쌉시글뱄옙호';
COMMENT ON COLUMN COMMUNITY_POST_HASHTAG.HASHTAG IS '占쌔쏙옙占승깍옙';

/* BUSINESS 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE BUSINESS (
    BUSINESS_NO NUMBER NOT NULL,
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
    COMPANY_TYPE VARCHAR(50) NULL,
    EMPLOYEE_COUNT NUMBER NULL,
    INDUSTRY VARCHAR(100) NULL,
    BRAND_NAME VARCHAR(100) NULL
);

COMMENT ON COLUMN BUSINESS.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN BUSINESS.REGISTRATION_NUMBER IS '占쏙옙占쏙옙湄占싹뱄옙호';
COMMENT ON COLUMN BUSINESS.OWNER_NAME IS '占쏙옙표占쌘몌옙';
COMMENT ON COLUMN BUSINESS.COMPANY_NAME IS '占쏙옙호占쏙옙';
COMMENT ON COLUMN BUSINESS.COMPANY_CODE IS '占쏙옙占쏙옙';
COMMENT ON COLUMN BUSINESS.COMPANY_TEL IS '占쏙옙占쏙옙占 占쏙옙화占쏙옙호';
COMMENT ON COLUMN BUSINESS.COMPANY_ADDR IS '占쏙옙占쏙옙占쏙옙玲占';
COMMENT ON COLUMN BUSINESS.COMPANY_FAX IS '占싼쏙옙占쏙옙호';
COMMENT ON COLUMN BUSINESS.COMPANY_SITE IS '홈占쏙옙占쏙옙占쏙옙占쌍쇽옙';
COMMENT ON COLUMN BUSINESS.LOGO IS '占싸곤옙占싱뱄옙占쏙옙';
COMMENT ON COLUMN BUSINESS.INTRODUCTION IS '占쏙옙占쏙옙柰占';
COMMENT ON COLUMN BUSINESS.VISION IS '占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN BUSINESS.COMPANY_TYPE IS '占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN BUSINESS.EMPLOYEE_COUNT IS '占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN BUSINESS.INDUSTRY IS '占쏙옙占쏙옙';
COMMENT ON COLUMN BUSINESS.BRAND_NAME IS '占쎄랜占쏙옙占';

/* BUSINESS_BENEFIT 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE BUSINESS_BENEFIT (
    BUSINESS_NO NUMBER NOT NULL,
    BENEFIT VARCHAR2(100) NULL
);

COMMENT ON COLUMN BUSINESS_BENEFIT.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN BUSINESS_BENEFIT.BENEFIT IS '占쏙옙占쏙옙占식삼옙 占쌓몌옙';

/* WORK_ENVIRONMENT_IMAGE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE WORK_ENVIRONMENT_IMAGE (
    WORK_ENVIRONMENT_IMAGE_NO NUMBER NOT NULL,
    BUSINESS_NO NUMBER NOT NULL,
    IMAGE_URL VARCHAR2(500) NULL,
    TITLE VARCHAR2(255) NULL
);

COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.WORK_ENVIRONMENT_IMAGE_NO IS '占쌕뱄옙 환占쏙옙占싱뱄옙占쏙옙占쏙옙占쏙옙키';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.IMAGE_URL IS '占싱뱄옙占쏙옙URL';
COMMENT ON COLUMN WORK_ENVIRONMENT_IMAGE.TITLE IS '占싱뱄옙占쏙옙占쏙옙占쏙옙';

/* BUSINESS_BOOKMARK 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE BUSINESS_BOOKMARK (
    BUSINESS_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    FLOER VARCHAR(15) NULL,
    ADD_DATE TIMESTAMP NULL
);

COMMENT ON COLUMN BUSINESS_BOOKMARK.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN BUSINESS_BOOKMARK.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN BUSINESS_BOOKMARK.FLOER IS '占싻뤄옙占쏙옙占쏙옙';
COMMENT ON COLUMN BUSINESS_BOOKMARK.ADD_DATE IS '占쌩곤옙占쏙옙占쏙옙';

/* JOB_POSTING 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE JOB_POSTING (
    RECRUITMENT_NO NUMBER NOT NULL,
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
    CONTENT_TEXT VARCHAR2(3000) NULL
);

COMMENT ON COLUMN JOB_POSTING.RECRUITMENT_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN JOB_POSTING.BUSINESS_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN JOB_POSTING.TITLE IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN JOB_POSTING.REPRESENTATIVE_NAME IS '占쏙옙占쏙옙占쏙옙見占';
COMMENT ON COLUMN JOB_POSTING.REPRESENTATIVE_DEPT IS '占쏙옙占쏙옙謎關占';
COMMENT ON COLUMN JOB_POSTING.REPRESENTATIVE_EMAIL IS '占쏙옙占쏙옙占쏙옙見占쏙옙占';
COMMENT ON COLUMN JOB_POSTING.METHOD IS '占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN JOB_POSTING.START_DATE IS '占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN JOB_POSTING.DEADLINE IS '占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN JOB_POSTING.POSTING_DATE IS '占쏙옙占쏙옙督占쏙옙占';
COMMENT ON COLUMN JOB_POSTING.CONTENT_IMG IS '占쏙옙占쏙옙柰占쏙옙譴占쏙옙占';
COMMENT ON COLUMN JOB_POSTING.CONTENT_TEXT IS '占쏙옙占쏙옙柰占쏙옙占';

/* JOB_REQUIREMENTS 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE JOB_REQUIREMENTS (
    POSITION_NO NUMBER NOT NULL,
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

COMMENT ON COLUMN JOB_REQUIREMENTS.POSITION_NO IS '占쏙옙占시션뱄옙호';
COMMENT ON COLUMN JOB_REQUIREMENTS.RECRUITMENT_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN JOB_REQUIREMENTS.POSITION_NAME IS '占쏙옙占쏙옙占싻야몌옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.POSITION_RANK IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.EMPLOYMENT_FORM IS '占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN JOB_REQUIREMENTS.RECRUITED_PEOPLE IS '占쏙옙占쏙옙 占싸울옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.WORKING_DAY IS '占쌕뱄옙占쏙옙占쏙옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.WORKING_TIME_START IS '占쌕뱄옙占시곤옙(占쏙옙占쏙옙)';
COMMENT ON COLUMN JOB_REQUIREMENTS.WORKING_TIME_END IS '占쌕뱄옙占시곤옙(占쏙옙占쏙옙)';
COMMENT ON COLUMN JOB_REQUIREMENTS.WORKING_PLACE IS '占쌕뱄옙占쏙옙 占쌍쇽옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.MIN_SALARY IS '占쏙옙占쏢연븝옙(占쌍쇽옙)';
COMMENT ON COLUMN JOB_REQUIREMENTS.MAX_SALARY IS '占쏙옙占쏢연븝옙(占쌍댐옙)';
COMMENT ON COLUMN JOB_REQUIREMENTS.ACADEMIC_ABILITY IS '占쌍소요구占싻뤄옙';
COMMENT ON COLUMN JOB_REQUIREMENTS.MIN_CAREER IS '占쌍소곤옙占';
COMMENT ON COLUMN JOB_REQUIREMENTS.MAX_CAREER IS '占쌍댐옙占쏙옙';

/* APPLICANTS 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE APPLICANTS (
    APPLICANTS_NO NUMBER NOT NULL,
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

COMMENT ON COLUMN APPLICANTS.APPLICANTS_NO IS '占쏙옙占쏙옙占쌘뱄옙호';
COMMENT ON COLUMN APPLICANTS.RECRUITMENT_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN APPLICANTS.POSITION_NO IS '占쏙옙占쏙옙占실뱄옙호';
COMMENT ON COLUMN APPLICANTS.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN APPLICANTS.APPLICANTS_DATE IS '占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN APPLICANTS.RESUME_STATUS IS '占싱력쇽옙占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN APPLICANTS.SCORE IS '占쏙옙';
COMMENT ON COLUMN APPLICANTS.MEMO IS '占쌨몌옙';
COMMENT ON COLUMN APPLICANTS.APPLICATION_STATUS IS '占쏙옙占쏙옙占쌤곤옙';
COMMENT ON COLUMN APPLICANTS.PASS_STATUS IS '占쌌격울옙占쏙옙';

/* PERSON_BOOKMARK 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE PERSON_BOOKMARK (
    PERSON_NO NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    FOLDER VARCHAR2(15) NULL,
    ADD_DATE TIMESTAMP NOT NULL
);

COMMENT ON COLUMN PERSON_BOOKMARK.PERSON_NO IS '占쏙옙占싸뱄옙호';
COMMENT ON COLUMN PERSON_BOOKMARK.RECRUITMENT_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN PERSON_BOOKMARK.FOLDER IS '占싻뤄옙占쏙옙占쏙옙';
COMMENT ON COLUMN PERSON_BOOKMARK.ADD_DATE IS '占쌩곤옙占쏙옙占쏙옙';

/* PERSON 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE PERSON (
    PERSON_NO NUMBER NOT NULL,
    NAME VARCHAR2(15) NOT NULL,
    BIRTHDAY DATE NULL,
    GENDER VARCHAR2(3) NULL,
    PHONE VARCHAR2(13) NULL,
    ADDRESS VARCHAR2(100) NULL
);

COMMENT ON COLUMN PERSON.PERSON_NO IS '占쏙옙占싸뱄옙호';
COMMENT ON COLUMN PERSON.NAME IS '회占쏙옙占싱몌옙';
COMMENT ON COLUMN PERSON.BIRTHDAY IS '占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN PERSON.GENDER IS '占쏙옙占쏙옙';
COMMENT ON COLUMN PERSON.PHONE IS '占쏙옙占쏙옙처';
COMMENT ON COLUMN PERSON.ADDRESS IS '占쌍쇽옙';

/* RESUME 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE RESUME (
    RESUME_NO NUMBER NOT NULL,
    PERSON_NO NUMBER NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    CREATE_DATE DATE NOT NULL,
    MODIFIED_DATE DATE NOT NULL,
    DELETED CHAR(1) NOT NULL CHECK (DELETED IN ('Y', 'N'))
);

COMMENT ON COLUMN RESUME.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN RESUME.PERSON_NO IS '占쏙옙占싸뱄옙호';
COMMENT ON COLUMN RESUME.TITLE IS '占싱력쇽옙占쏙옙占쏙옙';
COMMENT ON COLUMN RESUME.CREATE_DATE IS '占쌜쇽옙占쏙옙占쏙옙';
COMMENT ON COLUMN RESUME.MODIFIED_DATE IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN RESUME.DELETED IS '占쏙옙占쏙옙占쏙옙占쏙옙';

/* ACADEMIC_ABILITY 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE ACADEMIC_ABILITY (
    ACADEMIC_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    ACADEMIC_NAME VARCHAR2(30) NOT NULL,
    ACADEMIC_TYPE CHAR(2) NOT NULL,
    DEGREE CHAR(1) NULL,
    ENTER_DATE DATE NULL,
    GRADUATION_DATE DATE NULL,
    STATUS CHAR(1) NOT NULL,
    LOCATION VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN ACADEMIC_ABILITY.ACADEMIC_NO IS '占싻력뱄옙호';
COMMENT ON COLUMN ACADEMIC_ABILITY.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN ACADEMIC_ABILITY.ACADEMIC_NAME IS '占쏙옙占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN ACADEMIC_ABILITY.ACADEMIC_TYPE IS '占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占';
COMMENT ON COLUMN ACADEMIC_ABILITY.DEGREE IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN ACADEMIC_ABILITY.ENTER_DATE IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN ACADEMIC_ABILITY.GRADUATION_DATE IS '占쏙옙占쏙옙(占쏙옙占쏙옙)占쏙옙占쏙옙';
COMMENT ON COLUMN ACADEMIC_ABILITY.STATUS IS '占쏙옙占쏙옙';
COMMENT ON COLUMN ACADEMIC_ABILITY.LOCATION IS '占쏙옙占쏙옙';

/* LICENSE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE LICENSE (
    LICENSE_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    LICENSE_NAME VARCHAR2(30) NULL,
    ISSUED_BY VARCHAR2(30) NULL,
    ISSUE_DATE DATE NULL,
    PASSING_CATEGORY VARCHAR2(30) NULL
);

COMMENT ON COLUMN LICENSE.LICENSE_NO IS '占쌘곤옙占쏙옙占쏙옙호';
COMMENT ON COLUMN LICENSE.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN LICENSE.LICENSE_NAME IS '占쌘곤옙占쏙옙占싱몌옙';
COMMENT ON COLUMN LICENSE.ISSUED_BY IS '占쌩급깍옙占';
COMMENT ON COLUMN LICENSE.ISSUE_DATE IS '占쌩깍옙占쏙옙占쏙옙';
COMMENT ON COLUMN LICENSE.PASSING_CATEGORY IS '占쌌격깍옙占쏙옙';

/* LANGUAGE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE LANGUAGE (
    LANGUAGE_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    LANGUAGE_NAME VARCHAR2(30) NULL,
    PROFICIENCY_LEVEL VARCHAR2(30) NULL,
    ACQUISITION_DATE DATE NULL,
    KIND_OF_LANGUAGE VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN LANGUAGE.LANGUAGE_NO IS '占쏙옙占싻뱄옙호';
COMMENT ON COLUMN LANGUAGE.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN LANGUAGE.LANGUAGE_NAME IS '占쏙옙占쏙옙見占';
COMMENT ON COLUMN LANGUAGE.PROFICIENCY_LEVEL IS '占쌨쇽옙';
COMMENT ON COLUMN LANGUAGE.ACQUISITION_DATE IS '占쏙옙占쏙옙占';
COMMENT ON COLUMN LANGUAGE.KIND_OF_LANGUAGE IS '占쏙옙占쏙옙占쏙옙占';

/* AWARD 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE AWARD (
    AWARD_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    AWARD_NAME VARCHAR2(50) NULL,
    ORGANIZER VARCHAR2(50) NULL,
    AWARD_DATE DATE NULL
);

COMMENT ON COLUMN AWARD.AWARD_NO IS '占쏙옙占쏙옙占싫';
COMMENT ON COLUMN AWARD.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN AWARD.AWARD_NAME IS '占쏙옙占쏙옙/占쏙옙占쏙옙占쏙옙占쏙옙칭';
COMMENT ON COLUMN AWARD.ORGANIZER IS '占쏙옙占쌍깍옙占';
COMMENT ON COLUMN AWARD.AWARD_DATE IS '占쏙옙占쏙옙占쏙옙占쏙옙';

/* EXPERIENCE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE EXPERIENCE (
    EXPERIENCE_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    ACTICITY_TYPE VARCHAR2(50) NULL,
    ORGANIZATION_NAME VARCHAR2(100) NULL,
    START_DATE DATE NULL,
    END_DATE DATE NULL,
    DESCRIPTION VARCHAR2(300) NULL
);

COMMENT ON COLUMN EXPERIENCE.EXPERIENCE_NO IS '占쏙옙占쏙옙/활占쏙옙/占쏙옙占쏙옙占쏙옙호';
COMMENT ON COLUMN EXPERIENCE.RESUME_NO IS '占싱력쇽옙占쏙옙占쏙옙키';
COMMENT ON COLUMN EXPERIENCE.ACTICITY_TYPE IS '활占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN EXPERIENCE.ORGANIZATION_NAME IS '占쏙옙占/占쏙옙恬占';
COMMENT ON COLUMN EXPERIENCE.START_DATE IS '占쏙옙占쌜울옙占쏙옙';
COMMENT ON COLUMN EXPERIENCE.END_DATE IS '占쏙옙占써연占쏙옙';
COMMENT ON COLUMN EXPERIENCE.DESCRIPTION IS '활占쏙옙占쏙옙占쏙옙';

/* EMPLOYMENT_PREFERENCES1 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE EMPLOYMENT_PREFERENCES1 (
    EMPLOYMENT_PREFERENCES_NO1 NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    MARRIAGE_REASON VARCHAR2(200) NULL,
    IS_MILITARY_TARGET VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN EMPLOYMENT_PREFERENCES1.EMPLOYMENT_PREFERENCES_NO1 IS '占쏙옙占쏙옙占쏙옙占쏙옙占 占쏙옙占쏙옙키1';
COMMENT ON COLUMN EMPLOYMENT_PREFERENCES1.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN EMPLOYMENT_PREFERENCES1.MARRIAGE_REASON IS '占쏙옙占싣삼옙占쏙옙';
COMMENT ON COLUMN EMPLOYMENT_PREFERENCES1.IS_MILITARY_TARGET IS '占쏙옙占쏙옙占쏙옙璨㈉占';

/* EMPLOYMENTPREFERENCE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE EMPLOYMENTPREFERENCE (
    EMPLOYMENT_PREFERENCES_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    MARRIAGE_REASON VARCHAR2(255) NULL,
    IS_MILITARY_TARGET VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN EMPLOYMENTPREFERENCE.EMPLOYMENT_PREFERENCES_NO IS '占쏙옙占쏙옙占쏙옙占쏙옙占 占쏙옙占쏙옙키';
COMMENT ON COLUMN EMPLOYMENTPREFERENCE.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN EMPLOYMENTPREFERENCE.MARRIAGE_REASON IS '占쏙옙占싣삼옙占쏙옙';
COMMENT ON COLUMN EMPLOYMENTPREFERENCE.IS_MILITARY_TARGET IS '占쏙옙占쏙옙占쏙옙璨㈉占';

/* MILITARYSERVICE 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE MILITARYSERVICE (
    EMPLOYMENT_PREFERENCES_NO NUMBER NOT NULL,
    ENLISTMENT_DATE DATE NULL,
    ENTIRE_DATE DATE NULL,
    MILITARY_SELECTION VARCHAR2(10) NULL,
    CLASS_SELECTION VARCHAR2(10) NULL,
    ENTRIE_REASON VARCHAR2(20) NULL,
    EXEMPTION_REASON VARCHAR2(225) NULL,
    UNFINISHED_REASON VARCHAR2(225) NULL
);

COMMENT ON COLUMN MILITARYSERVICE.EMPLOYMENT_PREFERENCES_NO IS '占쌉댐옙占싫';
COMMENT ON COLUMN MILITARYSERVICE.ENLISTMENT_DATE IS '占쌉댐옙占쏙옙';
COMMENT ON COLUMN MILITARYSERVICE.ENTIRE_DATE IS '占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MILITARYSERVICE.MILITARY_SELECTION IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MILITARYSERVICE.CLASS_SELECTION IS '占쏙옙氷占쏙옙占';
COMMENT ON COLUMN MILITARYSERVICE.ENTRIE_REASON IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MILITARYSERVICE.EXEMPTION_REASON IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN MILITARYSERVICE.UNFINISHED_REASON IS '占쏙옙占십삼옙占쏙옙';

/* SELF_INTRODUCTION 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE SELF_INTRODUCTION (
    SELF_INTRODUCTION_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(500) NOT NULL,
    CREATED_DATE DATE NOT NULL,
    MODIFIED_DATE DATE NULL,
    DELETED CHAR(1) NULL CHECK (DELETED IN ('Y', 'N'))
);

COMMENT ON COLUMN SELF_INTRODUCTION.SELF_INTRODUCTION_NO IS '占쌘깍옙柰占쏙옙占 占쏙옙호';
COMMENT ON COLUMN SELF_INTRODUCTION.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN SELF_INTRODUCTION.USER_ID IS '占쌜쇽옙占쌘뱄옙호';
COMMENT ON COLUMN SELF_INTRODUCTION.TITLE IS '占쌘깍옙柰占쏙옙占 占쏙옙占쏙옙';
COMMENT ON COLUMN SELF_INTRODUCTION.CONTENT IS '占쌘깍옙柰占쏙옙占 占쏙옙占쏙옙';
COMMENT ON COLUMN SELF_INTRODUCTION.CREATED_DATE IS '占쌜쇽옙占쏙옙占쏙옙';
COMMENT ON COLUMN SELF_INTRODUCTION.MODIFIED_DATE IS '占쏙옙占쏙옙占쏙옙占쏙옙';
COMMENT ON COLUMN SELF_INTRODUCTION.DELETED IS '占쏙옙占쏙옙占쏙옙占쏙옙';

/* PORTFOLIO 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE PORTFOLIO (
    PORTFOLIO_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    TYPE VARCHAR2(10) NOT NULL CHECK (TYPE IN ('占쏙옙占쏙옙', 'URL')),
    FILE_URL VARCHAR2(200) NULL
);

COMMENT ON COLUMN PORTFOLIO.PORTFOLIO_NO IS '占쏙옙트占쏙옙占쏙옙占쏙옙 占쏙옙호';
COMMENT ON COLUMN PORTFOLIO.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN PORTFOLIO.TITLE IS '占쏙옙트占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙';
COMMENT ON COLUMN PORTFOLIO.TYPE IS '占쏙옙트占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙';
COMMENT ON COLUMN PORTFOLIO.FILE_URL IS '占쏙옙占싹곤옙占 占실댐옙 URL占쌍쇽옙';

/* SKILL 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE SKILL (
    SKILL_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    SKILL VARCHAR2(1000) NULL
);

COMMENT ON COLUMN SKILL.SKILL_NO IS '占쏙옙킬占쏙옙호';
COMMENT ON COLUMN SKILL.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN SKILL.SKILL IS '占쏙옙킬';

/* CAREER 占쏙옙占싱븝옙 占쏙옙占쏙옙 */
CREATE TABLE CAREER (
    WORK_EX_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    COMPANY_TITLE VARCHAR2(50) NOT NULL,
    WORK VARCHAR2(20) NOT NULL,
    DEPARTMENT VARCHAR2(20) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NULL,
    STATUS CHAR(1) NOT NULL CHECK (STATUS IN ('Y', 'N')),
    JOB_CONTENT VARCHAR2(100) NOT NULL,
    POSITION VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN CAREER.WORK_EX_NO IS '占쏙옙쨔占싫';
COMMENT ON COLUMN CAREER.RESUME_NO IS '占싱력쇽옙占쏙옙호';
COMMENT ON COLUMN CAREER.COMPANY_TITLE IS '회占쏙옙占';
COMMENT ON COLUMN CAREER.WORK IS '占쏙옙占쏙옙';
COMMENT ON COLUMN CAREER.DEPARTMENT IS '占쌕뱄옙占싸쇽옙';
COMMENT ON COLUMN CAREER.START_DATE IS '占쌉삼옙竪';
COMMENT ON COLUMN CAREER.END_DATE IS '占쏙옙占썩도';
COMMENT ON COLUMN CAREER.STATUS IS '占쌕뱄옙占쏙옙황';
COMMENT ON COLUMN CAREER.JOB_CONTENT IS '占쌍울옙 占쏙옙占쏙옙 占쏙옙占쏙옙';
COMMENT ON COLUMN CAREER.POSITION IS '占쏙옙占쏙옙/占쏙옙책';

/* 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌩곤옙 */
ALTER TABLE MEMBER
    ADD CONSTRAINT PK_MEMBER PRIMARY KEY (USER_NO);
ALTER TABLE BUSINESS
    ADD CONSTRAINT PK_BUSINESS PRIMARY KEY (BUSINESS_NO);
ALTER TABLE MEMBER
    ADD CONSTRAINT FK_MEMBER_BUSINESS FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS (BUSINESS_NO);
ALTER TABLE PERSON
    ADD CONSTRAINT PK_PERSON PRIMARY KEY (PERSON_NO);
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
ALTER TABLE ACADEMIC_ABILITY
    ADD (PERSON_NO NUMBER);
ALTER TABLE ACADEMIC_ABILITY
    ADD CONSTRAINT PK_ACADEMIC_ABILITY PRIMARY KEY (ACADEMIC_NO, RESUME_NO);
ALTER TABLE ACADEMIC_ABILITY
    ADD CONSTRAINT FK_ACADEMIC_ABILITY_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);
ALTER TABLE LICENSE
    ADD (PERSON_NO NUMBER);
ALTER TABLE LICENSE
    ADD CONSTRAINT PK_LICENSE PRIMARY KEY (LICENSE_NO, RESUME_NO);
ALTER TABLE LICENSE
    ADD CONSTRAINT FK_LICENSE_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);
ALTER TABLE LANGUAGE
    ADD (PERSON_NO NUMBER);
ALTER TABLE LANGUAGE
    ADD CONSTRAINT PK_LANGUAGE PRIMARY KEY (LANGUAGE_NO, RESUME_NO);
ALTER TABLE LANGUAGE
    ADD CONSTRAINT FK_LANGUAGE_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE AWARD
    ADD (PERSON_NO NUMBER);
ALTER TABLE AWARD
    ADD CONSTRAINT PK_AWARD PRIMARY KEY (AWARD_NO, RESUME_NO);
ALTER TABLE AWARD
    ADD CONSTRAINT FK_AWARD_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE EXPERIENCE
    ADD (PERSON_NO NUMBER);
ALTER TABLE EXPERIENCE
    ADD CONSTRAINT PK_EXPERIENCE PRIMARY KEY (EXPERIENCE_NO, RESUME_NO);
ALTER TABLE EXPERIENCE
    ADD CONSTRAINT FK_EXPERIENCE_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE EMPLOYMENT_PREFERENCES1
    ADD (PERSON_NO NUMBER);
ALTER TABLE EMPLOYMENT_PREFERENCES1
    ADD CONSTRAINT PK_EMPLOYMENT_PREFERENCES1 PRIMARY KEY (EMPLOYMENT_PREFERENCES_NO1, RESUME_NO);
ALTER TABLE EMPLOYMENT_PREFERENCES1
    ADD CONSTRAINT FK_EMP_PREF1_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE EMPLOYMENTPREFERENCE
    ADD (PERSON_NO NUMBER);
ALTER TABLE EMPLOYMENTPREFERENCE
    ADD CONSTRAINT PK_EMPLOYMENTPREFERENCE PRIMARY KEY (EMPLOYMENT_PREFERENCES_NO, RESUME_NO);
ALTER TABLE EMPLOYMENTPREFERENCE
    ADD CONSTRAINT FK_EMP_PREF_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

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

ALTER TABLE SKILL
    ADD (PERSON_NO NUMBER);
ALTER TABLE SKILL
    ADD CONSTRAINT PK_SKILL PRIMARY KEY (SKILL_NO, RESUME_NO);
ALTER TABLE SKILL
    ADD CONSTRAINT FK_SKILL_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

ALTER TABLE CAREER
    ADD (PERSON_NO NUMBER);
ALTER TABLE CAREER
    ADD CONSTRAINT PK_CAREER PRIMARY KEY (WORK_EX_NO, RESUME_NO);
ALTER TABLE CAREER
    ADD CONSTRAINT FK_CAREER_RESUME FOREIGN KEY (RESUME_NO, PERSON_NO) REFERENCES RESUME (RESUME_NO, PERSON_NO);

/* REPLY 占쏙옙占싱븝옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌩곤옙 */
ALTER TABLE REPLY
    ADD CONSTRAINT FK_REPLY_POSTING FOREIGN KEY (POSTING_NO) REFERENCES POSTING (POSTING_NO);

ALTER TABLE REPLY
    ADD CONSTRAINT FK_REPLY_USER FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO);

-- COMMUNITY_POST_JOB_CATEGORY 테이블에 기본 키 추가
ALTER TABLE COMMUNITY_POST_JOB_CATEGORY
ADD CONSTRAINT PK_COMMUNITY_POST_JOB_CATEGORY PRIMARY KEY (POSTING_NO, JOB_CATEGORY);

-- COMMUNITY_POST_HASHTAG 테이블에 기본 키 추가
ALTER TABLE COMMUNITY_POST_HASHTAG
ADD CONSTRAINT PK_COMMUNITY_POST_HASHTAG PRIMARY KEY (POSTING_NO, HASHTAG);

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

commit;