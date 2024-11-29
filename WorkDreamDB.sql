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
DROP TABLE BUSINESS_FOLDER CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE PERSON_BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE PERSON CASCADE CONSTRAINTS;
DROP TABLE RESUME CASCADE CONSTRAINTS;
DROP TABLE certificates CASCADE CONSTRAINTS;
DROP TABLE language_tests CASCADE CONSTRAINTS;
DROP TABLE awards CASCADE CONSTRAINTS;
DROP TABLE SELF_INTRODUCTION CASCADE CONSTRAINTS;
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;
DROP TABLE POST_LIKE CASCADE CONSTRAINTS;
DROP TABLE REPLY_LIKE CASCADE CONSTRAINTS;
DROP TABLE USER_TAGS CASCADE CONSTRAINTS;
DROP TABLE PLANNER CASCADE CONSTRAINTS;


DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_PNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_JOB;
DROP SEQUENCE SEQ_APP;
DROP SEQUENCE RESUME_SEQ;
DROP SEQUENCE certificates_seq;
DROP SEQUENCE language_tests_seq;
DROP SEQUENCE awards_seq;
DROP SEQUENCE POSTING_SEQ;
DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE SELF_INTRO_SEQ;
DROP SEQUENCE POST_LIKE_SEQ;
DROP SEQUENCE REPLY_LIKE_SEQ;
DROP SEQUENCE SEQ_TAG_ID;
DROP SEQUENCE BUSINESS_SEQ;
DROP SEQUENCE WORK_ENVIRONMENT_IMAGE_SEQ;
DROP SEQUENCE SEQ_PLANNER_EVENT_ID;


--==============================================================================


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


-- JOB_RECRUITMENT (채용공고)
CREATE TABLE JOB_RECRUITMENT (
    RECRUITMENT_NO NUMBER PRIMARY KEY NOT NULL, -- SEQ_JOB
    BUSINESS_NO NUMBER NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    MANAGER_NAME VARCHAR2(15) NOT NULL,
    MANAGER_DEPT VARCHAR2(30) NOT NULL,
    MANAGER_EMAIL VARCHAR2(50) NOT NULL,
    METHOD CHAR(1) NOT NULL,
    START_DATE TIMESTAMP NOT NULL,
    DEADLINE TIMESTAMP NOT NULL,
    POSTING_DATE DATE NOT NULL,
    CONTENT_IMG VARCHAR2(100) NULL,
    CONTENT_TEXT CLOB NULL
);

COMMENT ON COLUMN JOB_RECRUITMENT.RECRUITMENT_NO IS '채용공고 번호';
COMMENT ON COLUMN JOB_RECRUITMENT.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN JOB_RECRUITMENT.TITLE IS '공고 제목';
COMMENT ON COLUMN JOB_RECRUITMENT.MANAGER_NAME IS '담당자 이름';
COMMENT ON COLUMN JOB_RECRUITMENT.MANAGER_DEPT IS '담당자 부서';
COMMENT ON COLUMN JOB_RECRUITMENT.MANAGER_EMAIL IS '담당자 이메일(연락처)';
COMMENT ON COLUMN JOB_RECRUITMENT.METHOD IS '모집 방식(워크드림 이력서: W / 자사 홈페이지 지원: H)';
COMMENT ON COLUMN JOB_RECRUITMENT.START_DATE IS '채용 시작일';
COMMENT ON COLUMN JOB_RECRUITMENT.DEADLINE IS '채용 마감일';
COMMENT ON COLUMN JOB_RECRUITMENT.POSTING_DATE IS '공고 게시일';
COMMENT ON COLUMN JOB_RECRUITMENT.CONTENT_IMG IS '내용 이미지';
COMMENT ON COLUMN JOB_RECRUITMENT.CONTENT_TEXT IS '내용 텍스트';


-- JOB_POSITION (채용 포지션)
CREATE TABLE JOB_POSITION (
    POSITION_NO NUMBER NOT NULL,              -- 자동 증가 번호
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NAME VARCHAR2(100) NOT NULL,
    POSITION_RANK VARCHAR2(100) NOT NULL,
    EMPLOYMENT_FORM CHAR(1) NOT NULL,
    RECRUITED_PEOPLE NUMBER NOT NULL,
    WORKING_DAY NUMBER NULL,
    WORKING_TIME_START TIMESTAMP NULL,
    WORKING_TIME_END TIMESTAMP NULL,
    WORKING_PLACE VARCHAR2(50) NULL,
    MIN_SALARY NUMBER NULL,
    MAX_SALARY NUMBER NULL,
    ACADEMIC_ABILITY CHAR(2) NULL,
    MIN_CAREER NUMBER NULL,
    MAX_CAREER NUMBER NULL,
    CONSTRAINT PK_JOB_POSITION PRIMARY KEY (RECRUITMENT_NO, POSITION_NO),   -- 복합 PRIMARY KEY
    CONSTRAINT FK_JOB_POSITION_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_RECRUITMENT(RECRUITMENT_NO)
);

-- POSITION_NO 값을 RECRUITMENT_NO 별로 자동 생성하는 트리거
CREATE OR REPLACE TRIGGER trg_position_no
BEFORE INSERT ON JOB_POSITION
FOR EACH ROW
DECLARE
    v_position_no NUMBER;
BEGIN
    -- RECRUITMENT_NO별로 POSITION_NO 값을 계산 (최대 POSITION_NO + 1)
    SELECT NVL(MAX(POSITION_NO), 0) + 1
    INTO v_position_no
    FROM JOB_POSITION
    WHERE RECRUITMENT_NO = :NEW.RECRUITMENT_NO;

     -- 새 POSITION_NO 값 설정
    :NEW.POSITION_NO := v_position_no;
END;
/


COMMENT ON COLUMN JOB_POSITION.POSITION_NO IS '포지션 고유키(채용공고 고유키와 복합)';
COMMENT ON COLUMN JOB_POSITION.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN JOB_POSITION.POSITION_NAME IS '직위 이름';
COMMENT ON COLUMN JOB_POSITION.POSITION_RANK IS '직위 등급';
COMMENT ON COLUMN JOB_POSITION.EMPLOYMENT_FORM IS '고용 형태(정규직: R / 계약직: C)';
COMMENT ON COLUMN JOB_POSITION.RECRUITED_PEOPLE IS '채용 인원(=합격자 수 / 0명: 0)';
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
    STAGY_NO NUMBER NOT NULL,   -- 자동 증가
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NO NUMBER NOT NULL,
    STAGY_NAME VARCHAR(100) NOT NULL,
    STAGY_START TIMESTAMP NOT NULL,
    STAGY_END TIMESTAMP NOT NULL,
    STATUS CHAR(1) NOT NULL,
    CONSTRAINT PK_JOB_STAGY PRIMARY KEY (STAGY_NO, RECRUITMENT_NO),
    CONSTRAINT FK_JOB_STAGY_RECRUITMENT FOREIGN KEY (RECRUITMENT_NO) REFERENCES JOB_RECRUITMENT(RECRUITMENT_NO)
);

-- STAGY_NO 자동 증가 트리거 (RECRUITMENT_NO별로 최대값 + 1)
CREATE OR REPLACE TRIGGER trg_stagy_no
BEFORE INSERT ON JOB_STAGY
FOR EACH ROW
DECLARE
    v_stagy_no NUMBER;
BEGIN
    -- RECRUITMENT_NO별로 STAGY_NO 값 계산 (최대 STAGY_NO + 1)
    SELECT NVL(MAX(STAGY_NO), 0) + 1
    INTO v_stagy_no
    FROM JOB_STAGY
    WHERE RECRUITMENT_NO = :NEW.RECRUITMENT_NO;

    -- STAGY_NO 값 설정
    :NEW.STAGY_NO := v_stagy_no;
END;
/

COMMENT ON COLUMN JOB_STAGY.STAGY_NO IS '전형 단계 고유키(채용공고 고유키와 복합)';
COMMENT ON COLUMN JOB_STAGY.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN JOB_STAGY.POSITION_NO IS '포지션 고유키';
COMMENT ON COLUMN JOB_STAGY.STAGY_NAME IS '전형 단계 이름';
COMMENT ON COLUMN JOB_STAGY.STAGY_START IS '전형 시작일';
COMMENT ON COLUMN JOB_STAGY.STAGY_END IS '전형 종료일';
COMMENT ON COLUMN JOB_STAGY.STATUS IS '전형 미진행: N / 전형 진행중: P / 전형 종료: E)';


-- APPLICANTS (지원자 정보)
CREATE TABLE APPLICANTS (
    APPLICANTS_NO NUMBER PRIMARY KEY NOT NULL,  -- SEQ_APP
    RECRUITMENT_NO NUMBER NOT NULL,
    POSITION_NO NUMBER NOT NULL,
    STAGY_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    APPLICANTS_DATE DATE NOT NULL,
    RESUME_STATUS CHAR(1) NOT NULL,
    SCORE NUMBER NULL,
    MEMO VARCHAR2(200) NULL,
    PASS_STATUS CHAR(1) NOT NULL
);

COMMENT ON COLUMN APPLICANTS.APPLICANTS_NO IS '지원자 고유키';
COMMENT ON COLUMN APPLICANTS.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN APPLICANTS.POSITION_NO IS '포지션 고유키';
COMMENT ON COLUMN APPLICANTS.STAGY_NO IS '전형 단계 번호';
COMMENT ON COLUMN APPLICANTS.RESUME_NO IS '이력서 고유키';
COMMENT ON COLUMN APPLICANTS.APPLICANTS_DATE IS '지원일자';
COMMENT ON COLUMN APPLICANTS.RESUME_STATUS IS '이력서 상태(열람완료: Y / 미열람: N)';
COMMENT ON COLUMN APPLICANTS.SCORE IS '평가 점수';
COMMENT ON COLUMN APPLICANTS.MEMO IS '평가 관련 메모';
COMMENT ON COLUMN APPLICANTS.PASS_STATUS IS '합격 상태(미분류: N / 합격: P / 불합격: F)';


-- BUSINESS_FOLDER (기업용_즐겨찾기 분류 폴더 목록)
CREATE TABLE BUSINESS_FOLDER (
    FOLDER_NO NUMBER NOT NULL,
    BUSINESS_NO NUMBER NOT NULL,
    FOLDER_NAME VARCHAR(15) NOT NULL,
    FOLDER_ORDER NUMBER NOT NULL,
    CONSTRAINT PK_BUSINESS_FOLDER PRIMARY KEY (BUSINESS_NO, FOLDER_NO),
    CONSTRAINT FK_BUSINESS_FOLDER FOREIGN KEY (BUSINESS_NO) REFERENCES BUSINESS(BUSINESS_NO)
    ON DELETE CASCADE
);

-- FOLDER_NO와 FOLDER_ORDER 자동 증가 트리거 (BUSINESS_NO별로 최대값 + 1)
CREATE OR REPLACE TRIGGER trg_folder_no
BEFORE INSERT ON BUSINESS_FOLDER
FOR EACH ROW
DECLARE
    v_folder_no NUMBER;
    v_folder_order NUMBER;
BEGIN
    -- FOLDER_NO는 BUSINESS_NO별로 최대값 + 1
    SELECT NVL(MAX(FOLDER_NO), 0) + 1
    INTO v_folder_no
    FROM BUSINESS_FOLDER
    WHERE BUSINESS_NO = :NEW.BUSINESS_NO;

    -- FOLDER_ORDER는 BUSINESS_NO별로 최대값 + 1
    SELECT NVL(MAX(FOLDER_ORDER), 0) + 1
    INTO v_folder_order
    FROM BUSINESS_FOLDER
    WHERE BUSINESS_NO = :NEW.BUSINESS_NO;

    -- 새 FOLDER_NO와 FOLDER_ORDER 값 설정
    :NEW.FOLDER_NO := v_folder_no;
    :NEW.FOLDER_ORDER := v_folder_order;
END;
/

CREATE OR REPLACE TRIGGER trg_folder_order
AFTER UPDATE ON BUSINESS_FOLDER
FOR EACH ROW
BEGIN
    -- FOLDER_ORDER 값이 바뀔 때
    IF :NEW.FOLDER_ORDER != :OLD.FOLDER_ORDER THEN
        -- 기존 FOLDER_ORDER가 변경될 경우 순서를 재조정
        UPDATE BUSINESS_FOLDER
        SET FOLDER_ORDER = FOLDER_ORDER + 1
        WHERE BUSINESS_NO = :NEW.BUSINESS_NO  -- 동일한 BUSINESS_NO만 업데이트
        AND FOLDER_ORDER >= :NEW.FOLDER_ORDER  -- 변경된 FOLDER_ORDER보다 크거나 같은 값들만
        AND FOLDER_ORDER < :OLD.FOLDER_ORDER;  -- 변경된 FOLDER_ORDER보다 작은 값들만
    END IF;
END;
/

COMMENT ON COLUMN BUSINESS_FOLDER.FOLDER_NO IS '분류 폴더 고유키(기업 고유키와 복합)';
COMMENT ON COLUMN BUSINESS_FOLDER.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN BUSINESS_FOLDER.FOLDER_NAME IS '분류 폴더명';
COMMENT ON COLUMN BUSINESS_FOLDER.FOLDER_ORDER IS '분류 폴더 타입(즐겨찾기: B)';


-- BUSINESS_BOOKMARK (기업용_구직자 즐겨찾기 목록)
CREATE TABLE BUSINESS_BOOKMARK (
    BUSINESS_NO NUMBER NOT NULL,
    RESUME_NO NUMBER NOT NULL,
    FOLDER_NO NUMBER,
    ADD_DATE TIMESTAMP NULL,
    CONSTRAINT FK_BOOKMARK_FOLDER FOREIGN KEY (BUSINESS_NO, FOLDER_NO) 
        REFERENCES BUSINESS_FOLDER (BUSINESS_NO, FOLDER_NO)
        ON DELETE SET NULL
);

COMMENT ON COLUMN BUSINESS_BOOKMARK.BUSINESS_NO IS '기업 고유키';
COMMENT ON COLUMN BUSINESS_BOOKMARK.RESUME_NO IS '이력서 고유키';
COMMENT ON COLUMN BUSINESS_BOOKMARK.FOLDER_NO IS '분류 폴더 고유키';
COMMENT ON COLUMN BUSINESS_BOOKMARK.ADD_DATE IS '즐겨찾기 추가 날짜';


--==============================================================================


/* PERSON 관련 */
-- PERSON (개인 정보 테이블)
CREATE TABLE PERSON (
    PERSON_NO NUMBER PRIMARY KEY NOT NULL,  -- SEQ_PNO
    NAME VARCHAR2(15) NULL,
    BIRTHDAY DATE NULL,
    GENDER CHAR(1) NULL,
    ADDRESS VARCHAR2(100) NULL
);

COMMENT ON COLUMN PERSON.PERSON_NO IS '개인 고유키';
COMMENT ON COLUMN PERSON.NAME IS '회원 이름';
COMMENT ON COLUMN PERSON.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN PERSON.GENDER IS '성별(남자: M / 여자: W / 그외: E)';
COMMENT ON COLUMN PERSON.ADDRESS IS '주소';


-- PERSON_BOOKMARK (개인용 공고 스크랩)
CREATE TABLE PERSON_BOOKMARK (
    PERSON_NO NUMBER NOT NULL,
    RECRUITMENT_NO NUMBER NOT NULL,
    FOLDER VARCHAR2(15) NULL,
    ADD_DATE TIMESTAMP NOT NULL
);

COMMENT ON COLUMN PERSON_BOOKMARK.PERSON_NO IS '개인 고유키';
COMMENT ON COLUMN PERSON_BOOKMARK.RECRUITMENT_NO IS '채용공고 고유키';
COMMENT ON COLUMN PERSON_BOOKMARK.FOLDER IS '분류 폴더명';
COMMENT ON COLUMN PERSON_BOOKMARK.ADD_DATE IS '스크랩 추가 날짜';


-- RESUME (이력서)
CREATE TABLE RESUME(        
    RESUME_NO NUMBER NOT NULL PRIMARY KEY,                       -- 이력서 번호
    PERSON_NO NUMBER NOT NULL,                                   -- 사람 번호
    RESUME_TITLE VARCHAR2(100) NOT NULL,                          -- 이력서 제목
    USER_NAME VARCHAR2(50) NOT NULL,                              -- 사용자 이름
    USER_GENDER CHAR(1) NOT NULL CHECK (USER_GENDER IN ('M', 'F')), -- 성별
    USER_BIRTH DATE NOT NULL,                                     -- 생년월일
    USER_EMAIL VARCHAR2(100) NOT NULL,                            -- 이메일
    USER_PHONE VARCHAR2(20) NOT NULL,                             -- 전화번호
    USER_ADDRESS VARCHAR2(255) NOT NULL,                          -- 주소
    USER_ROAD_ADDRESS VARCHAR2(255),                              -- 도로명 주소
    USER_DETAIL_ADDRESS VARCHAR2(255),                            -- 상세 주소
    USER_PIC VARCHAR2(500),                                       -- 사용자 사진
    EDUCATION_LEVEL VARCHAR2(50) DEFAULT '기본값',                -- 학력 수준 (educationLevel)
    ACADEMIC_NAME_EL VARCHAR2(30),                                -- 학력 이름 (academicName)
    ACADEMIC_NAME_MI VARCHAR2(30),                                -- 학력 이름 (academicName)
    ACADEMIC_NAME_HI VARCHAR2(30),                                -- 학력 이름 (academicName)
    ACADEMIC_NAME VARCHAR2(30),
    ACADEMIC_STATUS VARCHAR(20),
    MAJOR VARCHAR2(100),                                          -- 전공 (majorName)
    DEGREE VARCHAR2(10),                                          -- 학위 (degree)
    STATUS VARCHAR2(20) NULL,
    STATUS_EL VARCHAR2(20),                                       -- 상태 (graduationStatus)
    STATUS_MI VARCHAR2(20),                                       -- 상태 (graduationStatus)
    STATUS_HI VARCHAR2(20),                                       -- 상태 (graduationStatus)
    ENTER_DATE_EL DATE,                                           -- 입학 날짜 (enterDate)
    GRADUATION_DATE_EL DATE,                                      -- 졸업 날짜 (graduationDate)
    ENTER_DATE_MI DATE,                                           -- 입학 날짜 (enterDate)
    GRADUATION_DATE_MI DATE,                                      -- 졸업 날짜 (graduationDate)
    ENTER_DATE_HI DATE,                                           -- 입학 날짜 (enterDate)
    GRADUATION_DATE_HI DATE,                                      -- 졸업 날짜 (graduationDate)
    ENTER_DATE_COL DATE,                                          -- 입학 날짜 (enterDate)
    GRADUATION_DATE_COL DATE,                                     -- 졸업 날짜 (graduationDate)
    LOCATION_EL VARCHAR2(10),                                     -- 위치 (location)
    LOCATION_MI VARCHAR2(10),                                     -- 위치 (location)
    LOCATION_HI VARCHAR2(10),                                     -- 위치 (location)
    LOCATION VARCHAR2(10),                                        -- 위치 (location)
    EXAM_PASSED_EL CHAR(1),                                       -- 시험 합격 여부 (examPassed)
    EXAM_PASSED_MI CHAR(1),                                       -- 시험 합격 여부 (examPassed)
    EXAM_PASSED_HI CHAR(1),                                       -- 시험 합격 여부 (examPassed)
    SKILL VARCHAR2(1000),                                         -- 스킬 (skillName)
    ACTIVITY_TYPE VARCHAR2(50),                                   -- 활동 유형 (activityType)
    ORGANIZATION_NAME VARCHAR2(100),                              -- 기관 이름 (organizationName)
    START_DATE_ACT DATE,                                          -- 활동 시작 날짜 (startDateAct)
    END_DATE_ACT DATE,                                            -- 활동 종료 날짜 (endDateAct)
    DESCRIPTION VARCHAR2(300),                                    -- 설명 (description)
    CATEGORY VARCHAR2(50) NULL,                                    -- 카테고리 (category)
    VETERAN_REASON VARCHAR2(100),                                  -- 보훈 사유 (veteranReason)
    SERVICE_STATE VARCHAR2(20) NULL,                               -- 병역 상태 (serviceStatus)
    UNFULFILLED_REASON VARCHAR2(50),                               -- 미필 사유 (unfulfilledReason)
    EXEMPTED_REASON VARCHAR2(50),                                 -- 면제 사유 (exemptionReason)
    ENLISTMENT_DATE_FUL DATE,                                          -- 입대일(군필) (enlistmentDate)
    ENLISTMENT_DATE_SER DATE,                                          -- 입대일(복무중) (enlistmentDate)
    DISCHARGE_DATE_FUL DATE,                                           -- 전역일(군필) (dischargeDate)
    DISCHARGE_DATE_SER DATE,                                           -- 전역일(복무중) (dischargeDate)
    MILITARY_SELECTION_FUL VARCHAR2(10),                               -- 군별 선택(군필) (militaryBranch)
    MILITARY_SELECTION_SER VARCHAR2(10),                               -- 군별 선택(복무중) (militaryBranch)
    CLASS_SELECTION_FUL VARCHAR2(10),                                  -- 계급 선택(군필) (rank)
    CLASS_SELECTION_SER VARCHAR2(10),                                  -- 계급 선택(복무중) (rank)
    DISCHARGE_REASON_FUL VARCHAR2(50),                                 -- 전역 사유(군필) (dischargeReason)
    WORK VARCHAR2(20) NULL,                                        -- 직무 (work)
    DEPARTMENT VARCHAR2(20) NULL,                                  -- 부서 (department)
    COMPANY_TITLE VARCHAR2(50) NULL,                               -- 회사명 (companyTitle)
    START_DATE_WORK DATE NULL,                                     -- 업무 시작 날짜 (startDateWork)
    END_DATE_WORK DATE,                                            -- 업무 종료 날짜 (endDateWork)
    STATUS_WORK CHAR(1) NULL CHECK (STATUS_WORK IN ('Y', 'N', 'P')), -- 업무 상태 (careerStatus)
    JOB_CONTENT VARCHAR2(100) NULL,                                -- 업무 내용 (jobContent)
    POSITION VARCHAR2(20) NULL,                                    -- 직급/직책 (position)
    CREATE_DATE DATE DEFAULT SYSDATE,                              -- 생성일자
    MODIFIED_DATE DATE DEFAULT SYSDATE,                            -- 수정일자
    RESUME_STATUS CHAR(1) DEFAULT 'Y',                             -- 이력서 상태
    DELETED CHAR(1) DEFAULT 'N'                                     -- 삭제 여부
);


COMMENT ON COLUMN RESUME.RESUME_NO IS '이력서 고유키';
COMMENT ON COLUMN RESUME.PERSON_NO IS '개인 고유키';
COMMENT ON COLUMN RESUME.RESUME_TITLE IS '이력서 제목';
COMMENT ON COLUMN RESUME.USER_NAME IS '사용자 이름';
COMMENT ON COLUMN RESUME.USER_GENDER IS '사용자 성별 (M: 남성, F: 여성)';
COMMENT ON COLUMN RESUME.USER_BIRTH IS '사용자 생년월일';
COMMENT ON COLUMN RESUME.USER_EMAIL IS '사용자 이메일';
COMMENT ON COLUMN RESUME.USER_PHONE IS '사용자 전화번호';
COMMENT ON COLUMN RESUME.USER_ADDRESS IS '사용자 주소';
COMMENT ON COLUMN RESUME.USER_ROAD_ADDRESS IS '사용자 도로명 주소';
COMMENT ON COLUMN RESUME.USER_DETAIL_ADDRESS IS '사용자 상세 주소';
COMMENT ON COLUMN RESUME.USER_PIC IS '사용자 사진 URL';
COMMENT ON COLUMN RESUME.EDUCATION_LEVEL IS '사용자 학력 수준';
COMMENT ON COLUMN RESUME.ACADEMIC_NAME_EL IS '초등학교 이름';
COMMENT ON COLUMN RESUME.ACADEMIC_NAME_MI IS '중학교 이름';
COMMENT ON COLUMN RESUME.ACADEMIC_NAME_HI IS '고등학교 이름';
COMMENT ON COLUMN RESUME.ACADEMIC_NAME IS '대학교 이름';
COMMENT ON COLUMN RESUME.MAJOR IS '전공명';
COMMENT ON COLUMN RESUME.DEGREE IS '학위';
COMMENT ON COLUMN RESUME.ACADEMIC_STATUS IS '학력 졸업 상태';
COMMENT ON COLUMN RESUME.STATUS IS '전체 졸업 상태';
COMMENT ON COLUMN RESUME.STATUS_EL IS '초등학교 졸업 상태';
COMMENT ON COLUMN RESUME.STATUS_MI IS '중학교 졸업 상태';
COMMENT ON COLUMN RESUME.STATUS_HI IS '고등학교 졸업 상태';
COMMENT ON COLUMN RESUME.ENTER_DATE_EL IS '초등학교 입학 날짜';
COMMENT ON COLUMN RESUME.GRADUATION_DATE_EL IS '초등학교 졸업 날짜';
COMMENT ON COLUMN RESUME.ENTER_DATE_MI IS '중학교 입학 날짜';
COMMENT ON COLUMN RESUME.GRADUATION_DATE_MI IS '중학교 졸업 날짜';
COMMENT ON COLUMN RESUME.ENTER_DATE_HI IS '고등학교 입학 날짜';
COMMENT ON COLUMN RESUME.GRADUATION_DATE_HI IS '고등학교 졸업 날짜';
COMMENT ON COLUMN RESUME.ENTER_DATE_COL IS '대학교 입학 날짜';
COMMENT ON COLUMN RESUME.GRADUATION_DATE_COL IS '대학교 졸업 날짜';
COMMENT ON COLUMN RESUME.LOCATION_EL IS '초등학교 위치';
COMMENT ON COLUMN RESUME.LOCATION_MI IS '중학교 위치';
COMMENT ON COLUMN RESUME.LOCATION_HI IS '고등학교 위치';
COMMENT ON COLUMN RESUME.LOCATION IS '대학교 위치';
COMMENT ON COLUMN RESUME.EXAM_PASSED_EL IS '초등학교 시험 합격 여부';
COMMENT ON COLUMN RESUME.EXAM_PASSED_MI IS '중학교 시험 합격 여부';
COMMENT ON COLUMN RESUME.EXAM_PASSED_HI IS '고등학교 시험 합격 여부';
COMMENT ON COLUMN RESUME.SKILL IS '사용자 보유 기술';
COMMENT ON COLUMN RESUME.ACTIVITY_TYPE IS '활동 유형';
COMMENT ON COLUMN RESUME.ORGANIZATION_NAME IS '활동 기관명';
COMMENT ON COLUMN RESUME.START_DATE_ACT IS '활동 시작 날짜';
COMMENT ON COLUMN RESUME.END_DATE_ACT IS '활동 종료 날짜';
COMMENT ON COLUMN RESUME.DESCRIPTION IS '활동 설명';
COMMENT ON COLUMN RESUME.CATEGORY IS '활동 카테고리';
COMMENT ON COLUMN RESUME.VETERAN_REASON IS '보훈 사유';
COMMENT ON COLUMN RESUME.SERVICE_STATE IS '병역 상태';
COMMENT ON COLUMN RESUME.UNFULFILLED_REASON IS '미필 사유';
COMMENT ON COLUMN RESUME.EXEMPTED_REASON IS '면제 사유';
COMMENT ON COLUMN RESUME.ENLISTMENT_DATE_FUL IS '입대일(군필)';
COMMENT ON COLUMN RESUME.ENLISTMENT_DATE_SER IS '입대일(복무중)';
COMMENT ON COLUMN RESUME.DISCHARGE_DATE_FUL IS '전역일(군필)';
COMMENT ON COLUMN RESUME.DISCHARGE_DATE_SER IS '전역일(복무중)';
COMMENT ON COLUMN RESUME.MILITARY_SELECTION_FUL IS '군별 선택(군필)';
COMMENT ON COLUMN RESUME.MILITARY_SELECTION_SER IS '군별 선택(복무중)';
COMMENT ON COLUMN RESUME.CLASS_SELECTION_FUL IS '계급 선택(군필)';
COMMENT ON COLUMN RESUME.CLASS_SELECTION_SER IS '계급 선택(복무중)';
COMMENT ON COLUMN RESUME.DISCHARGE_REASON_FUL IS '전역 사유(군필)';
COMMENT ON COLUMN RESUME.WORK IS '직무';
COMMENT ON COLUMN RESUME.DEPARTMENT IS '부서';
COMMENT ON COLUMN RESUME.COMPANY_TITLE IS '회사명';
COMMENT ON COLUMN RESUME.START_DATE_WORK IS '업무 시작 날짜';
COMMENT ON COLUMN RESUME.END_DATE_WORK IS '업무 종료 날짜';
COMMENT ON COLUMN RESUME.STATUS_WORK IS '업무 상태 (Y: 재직, N: 퇴사, P: 프리랜서)';
COMMENT ON COLUMN RESUME.JOB_CONTENT IS '업무 내용';
COMMENT ON COLUMN RESUME.POSITION IS '직급/직책';
COMMENT ON COLUMN RESUME.CREATE_DATE IS '생성일자';
COMMENT ON COLUMN RESUME.MODIFIED_DATE IS '수정일자';
COMMENT ON COLUMN RESUME.RESUME_STATUS IS '공개 여부(공개: Y / 미공개: N)';
COMMENT ON COLUMN RESUME.DELETED IS '삭제 여부';



-- CERTIFICATES (자격증)
CREATE TABLE CERTIFICATES (
    certificate_id NUMBER PRIMARY KEY,
    resume_no NUMBER NOT NULL,
    qualification_name VARCHAR2(255),
    issuing_agency VARCHAR2(255),
    pass_status VARCHAR2(50),
    issue_date DATE,
    FOREIGN KEY (resume_no) REFERENCES resume(resume_no)
);

COMMENT ON COLUMN CERTIFICATES.certificate_id IS '자격증 고유키';
COMMENT ON COLUMN CERTIFICATES.resume_no IS '이력서 고유키 (RESUME 테이블 참조)';
COMMENT ON COLUMN CERTIFICATES.qualification_name IS '자격증 이름';
COMMENT ON COLUMN CERTIFICATES.issuing_agency IS '발급 기관';
COMMENT ON COLUMN CERTIFICATES.pass_status IS '자격증 합격 상태';
COMMENT ON COLUMN CERTIFICATES.issue_date IS '자격증 발급 날짜';

-- language_tests (어학시험)
CREATE TABLE language_tests (
    language_test_id NUMBER PRIMARY KEY,
    resume_no NUMBER NOT NULL,
    language_name VARCHAR2(255),
    proficiency_level VARCHAR2(50),
    language_type VARCHAR2(50),
    issue_date DATE,
    FOREIGN KEY (resume_no) REFERENCES resume(resume_no)
);

COMMENT ON COLUMN language_tests.language_test_id IS '어학 시험 고유키';
COMMENT ON COLUMN language_tests.resume_no IS '이력서 고유키 (RESUME 테이블 참조)';
COMMENT ON COLUMN language_tests.language_name IS '어학 시험 이름';
COMMENT ON COLUMN language_tests.proficiency_level IS '어학 능력 수준';
COMMENT ON COLUMN language_tests.language_type IS '어학 시험 유형';
COMMENT ON COLUMN language_tests.issue_date IS '어학 시험 발급 날짜';

-- awards (수상내역)
CREATE TABLE awards (
    award_id NUMBER PRIMARY KEY,
    resume_no NUMBER NOT NULL,
    award_name VARCHAR2(255),
    organizer VARCHAR2(255),
    award_date DATE,
    FOREIGN KEY (resume_no) REFERENCES resume(resume_no)
);

COMMENT ON COLUMN awards.award_id IS '수상 고유키';
COMMENT ON COLUMN awards.resume_no IS '이력서 고유키 (RESUME 테이블 참조)';
COMMENT ON COLUMN awards.award_name IS '수상 이름';
COMMENT ON COLUMN awards.organizer IS '수상 주최 기관';
COMMENT ON COLUMN awards.award_date IS '수상 날짜';


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

-- PLANNER 테이블 생성
CREATE TABLE PLANNER (
    EVENT_ID NUMBER PRIMARY KEY NOT NULL,                 -- 이벤트 고유 ID
    USER_NO NUMBER NOT NULL,                              -- 이벤트를 생성한 사용자 번호
    TITLE VARCHAR2(100) NOT NULL,                         -- 이벤트 제목
    DESCRIPTION VARCHAR2(1000),                           -- 이벤트 상세 설명
    START_DATE DATE NOT NULL,                             -- 이벤트 시작 날짜
    END_DATE DATE NULL,                                   -- 이벤트 종료 날짜 (선택 사항)
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')), -- 이벤트 상태 (Y: 활성, N: 비활성/삭제)
    CONSTRAINT FK_PLANNER_USER FOREIGN KEY (USER_NO)      -- 외래 키 제약 조건
        REFERENCES MEMBER (USER_NO)                       -- MEMBER 테이블의 USER_NO 참조
);

-- 컬럼 설명 추가
COMMENT ON COLUMN PLANNER.EVENT_ID IS '이벤트 고유 식별자';
COMMENT ON COLUMN PLANNER.USER_NO IS '이벤트를 생성한 사용자 번호 (MEMBER 테이블 참조)';
COMMENT ON COLUMN PLANNER.TITLE IS '이벤트 제목 (100자 이내)';
COMMENT ON COLUMN PLANNER.DESCRIPTION IS '이벤트에 대한 상세 설명';
COMMENT ON COLUMN PLANNER.START_DATE IS '이벤트 시작 날짜';
COMMENT ON COLUMN PLANNER.END_DATE IS '이벤트 종료 날짜 (선택 사항)';
COMMENT ON COLUMN PLANNER.STATUS IS '이벤트 상태 (Y: 활성, N: 비활성/삭제)';


--=======================================================================================================================


CREATE SEQUENCE SEQ_PLANNER_EVENT_ID START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;  -- 플래너 시퀀스 생성

CREATE SEQUENCE SEQ_UNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 유저 고유키
CREATE SEQUENCE SEQ_PNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 개인 고유키
CREATE SEQUENCE SEQ_BNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 기업 고유키
CREATE SEQUENCE SEQ_JOB START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 채용공고 고유키
CREATE SEQUENCE SEQ_APP START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;    -- 지원자 고유키
CREATE SEQUENCE SEQ_TAG_ID START WITH 1 INCREMENT BY 1 NOCACHE;         -- 관심태그 고유키

CREATE SEQUENCE RESUME_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE POSTING_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE REPLY_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SELF_INTRO_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE BUSINESS_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE WORK_ENVIRONMENT_IMAGE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE certificates_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE language_tests_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE awards_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


commit;