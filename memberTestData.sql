/*
    [테스트용 유저 데이터]
    - 테스트 계정 생성 전에 시퀀스 초기화부터 진행할 것
    - 비밀번호는 암호화된 상태 > 주석 확인
    
    DROP SEQUENCE SEQ_UNO;
    DROP SEQUENCE SEQ_PNO;
    DROP SEQUENCE SEQ_BNO;
    
    CREATE SEQUENCE SEQ_UNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
    CREATE SEQUENCE SEQ_PNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
    CREATE SEQUENCE SEQ_BNO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
*/

/* 개인 회원 */
-- 비밀번호: test1Person.

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '홍길동', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person1', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person1@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '팥쥐', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person2', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person2@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '김철수', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person3', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person3@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '이영희', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person4', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person4@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '박지민', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person5', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person5@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '최동호', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person6', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person6@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '김민지', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person7', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person7@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '황영민', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person8', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person8@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '최지영', 'W');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person9', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person9@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);

INSERT INTO PERSON (PERSON_NO, NAME, GENDER) VALUES (SEQ_PNO.NEXTVAL, '송태영', 'M');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'P', 'person10', '$2a$10$n6sDIVjEmPozCHfL6mxwmuRvcqX65US43b/2.rUxU20yqrPRCVxIK', 'person10@workdream.co.kr', NULL, SYSDATE, 'Y', NULL, SEQ_PNO.CURRVAL);


/* 기업 회원 */
-- 비밀번호: test2Business.

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700622', '놀부');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business1', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business1@workdream.co.kr', '01000000000', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700622', '변사또');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business2', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business2@workdream.co.kr', NULL, SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700623', '김상철');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business3', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business3@workdream.co.kr', '01000000001', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700624', '박대성');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business4', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business4@workdream.co.kr', '01000000002', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700625', '정은미');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business5', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business5@workdream.co.kr', '01000000003', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700626', '이상훈');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business6', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business6@workdream.co.kr', '01000000004', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700627', '최유나');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business7', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business7@workdream.co.kr', '01000000005', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700628', '한예진');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business8', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business8@workdream.co.kr', '01000000006', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700629', '송재희');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business9', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business9@workdream.co.kr', '01000000007', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

INSERT INTO BUSINESS (BUSINESS_NO, REGISTRATION_NUMBER, OWNER_NAME) VALUES (SEQ_BNO.NEXTVAL, '8518700630', '윤호성');
INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, PHONE, EROLL_DATE, STATUS, BUSINESS_NO, PERSON_NO)
VALUES (SEQ_UNO.NEXTVAL, 'B', 'business10', '$2a$10$5rDJxmVELPdZIEYvyaudse01mJ1bScr7kf.sppeoRh2bXK4Lz5N.K', 'business10@workdream.co.kr', '01000000008', SYSDATE, 'Y', SEQ_BNO.CURRVAL, NULL);

COMMIT;