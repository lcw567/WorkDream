INSERT INTO MEMBER (USER_NO, USER_TYPE, USER_ID, USER_PWD, EMAIL, EROLL_DATE, MODIFY_DATE, STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'U', 'user1', 'user1234', 'user1@example.com', SYSDATE, SYSTIMESTAMP, 'Y');


set define off;
-- ���� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 1', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 15, 2, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 2', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 25, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 3', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 30, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 4', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 40, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 5', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 50, 9, 'Y');

-- ä����� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'ä�����', 'ä����� �Խñ� ���� 1', 'ä����� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 20, 4, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'ä�����', 'ä����� �Խñ� ���� 2', 'ä����� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 35, 6, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'ä�����', 'ä����� �Խñ� ���� 3', 'ä����� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 45, 8, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'ä�����', 'ä����� �Խñ� ���� 4', 'ä����� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 55, 10, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'ä�����', 'ä����� �Խñ� ���� 5', 'ä����� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 65, 12, 'Y');


-- ���� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 1', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 18, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 2', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 28, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 3', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 38, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 4', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 48, 9, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 5', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 58, 11, 'Y');

-- �ڼҼ� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڼҼ�', '�ڼҼ� �Խñ� ���� 1', '�ڼҼ� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 22, 4, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڼҼ�', '�ڼҼ� �Խñ� ���� 2', '�ڼҼ� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 32, 6, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڼҼ�', '�ڼҼ� �Խñ� ���� 3', '�ڼҼ� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 42, 8, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڼҼ�', '�ڼҼ� �Խñ� ���� 4', '�ڼҼ� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 52, 10, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڼҼ�', '�ڼҼ� �Խñ� ���� 5', '�ڼҼ� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 62, 12, 'Y');

-- �ڰ��� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڰ���', '�ڰ��� �Խñ� ���� 1', '�ڰ��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 12, 2, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڰ���', '�ڰ��� �Խñ� ���� 2', '�ڰ��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 22, 4, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڰ���', '�ڰ��� �Խñ� ���� 3', '�ڰ��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 32, 6, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڰ���', '�ڰ��� �Խñ� ���� 4', '�ڰ��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 42, 8, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '�ڰ���', '�ڰ��� �Խñ� ���� 5', '�ڰ��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 52, 10, 'Y');

-- Q&A ī�װ��� �Խñ� A��ü &A�Է�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', 'Q&A �Խñ� ���� 1', 'Q&A ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 14, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', 'Q&A �Խñ� ���� 2', 'Q&A ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 24, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', 'Q&A �Խñ� ���� 3', 'Q&A ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 34, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', 'Q&A �Խñ� ���� 4', 'Q&A ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 44, 9, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', 'Q&A �Խñ� ���� 5', 'Q&A ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 54, 11, 'Y');
-- Ŀ���� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Ŀ����', 'Ŀ���� �Խñ� ���� 1', 'Ŀ���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 16, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Ŀ����', 'Ŀ���� �Խñ� ���� 2', 'Ŀ���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 26, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Ŀ����', 'Ŀ���� �Խñ� ���� 3', 'Ŀ���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 36, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Ŀ����', 'Ŀ���� �Խñ� ���� 4', 'Ŀ���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 46, 9, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Ŀ����', 'Ŀ���� �Խñ� ���� 5', 'Ŀ���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 56, 11, 'Y');
-- ���� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 1', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 17, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 2', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 27, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 3', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 37, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 4', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 47, 9, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 5', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 57, 11, 'Y');
-- ��� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '���', '��� �Խñ� ���� 1', '��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 13, 2, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '���', '��� �Խñ� ���� 2', '��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 23, 4, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '���', '��� �Խñ� ���� 3', '��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 33, 6, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '���', '��� �Խñ� ���� 4', '��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 43, 8, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '���', '��� �Խñ� ���� 5', '��� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 53, 10, 'Y');
-- ���� ī�װ��� �Խñ�

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 1', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 19, 3, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 2', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 29, 5, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 3', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 39, 7, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 4', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 49, 9, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '����', '���� �Խñ� ���� 5', '���� ī�װ����� �����Դϴ�.', NULL, 'admin', 1, SYSDATE, 59, 11, 'Y');

DECLARE
    TYPE JobCategoryArray IS TABLE OF VARCHAR2(100);
    TYPE HashtagArray IS TABLE OF VARCHAR2(100);
    
    jobCategories JobCategoryArray := JobCategoryArray(
        '��ȹ������', '�����á�ȫ��������', 'ȸ�衤�������繫', '�λ硤�빫��HRD', '�ѹ����������繫',
        'IT���ߡ�������', '������', '�������Ǹš�����', '������㡤TM', '���š����硤����',
        '��ǰ��ȹ��MD', '��������ۡ����', '����', '����', '�Ǽ�������',
        '�Ƿ�', '������R&D', '����', '�̵���ȭ��������', '����������', '����������'
    );
    
    hashtags HashtagArray := HashtagArray(
        '#�ؽ��±�1', '#�ؽ��±�2', '#�ؽ��±�3', '#�ؽ��±�4', '#�ؽ��±�5',
        '#�ؽ��±�6', '#�ؽ��±�7', '#�ؽ��±�8', '#�ؽ��±�9', '#�ؽ��±�10',
        '#�ؽ��±�11', '#�ؽ��±�12', '#�ؽ��±�13', '#�ؽ��±�14', '#�ؽ��±�15',
        '#�ؽ��±�16', '#�ؽ��±�17', '#�ؽ��±�18', '#�ؽ��±�19', '#�ؽ��±�20',
        '#�ؽ��±�21', '#�ؽ��±�22', '#�ؽ��±�23', '#�ؽ��±�24', '#�ؽ��±�25',
        '#�ؽ��±�26', '#�ؽ��±�27', '#�ؽ��±�28', '#�ؽ��±�29', '#�ؽ��±�30'
    );

    v_posting_no NUMBER;
    v_random_job VARCHAR2(100);
    v_random_hashtag VARCHAR2(100);
BEGIN
    -- ��� �Խñۿ� ���� ���� ī�װ����� �������� �߰�
    FOR rec IN (SELECT POSTING_NO FROM POSTING) LOOP
        -- �Խñ� ��ȣ ����
        v_posting_no := rec.POSTING_NO;

        -- ���� ī�װ��� �� �������� ����
        v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, jobCategories.COUNT + 1)));

        -- COMMUNITY_POST_JOB_CATEGORY ���̺��� ���� ī�װ��� ����
        INSERT INTO COMMUNITY_POST_JOB_CATEGORY (POSTING_NO, JOB_CATEGORY)
        VALUES (v_posting_no, v_random_job);

        -- �ؽ��±׸� �������� ����
        v_random_hashtag := hashtags(TRUNC(DBMS_RANDOM.VALUE(1, hashtags.COUNT + 1)));

        -- COMMUNITY_POST_HASHTAG ���̺��� �ؽ��±� ����
        INSERT INTO COMMUNITY_POST_HASHTAG (POSTING_NO, HASHTAG)
        VALUES (v_posting_no, v_random_hashtag);
    END LOOP;

    -- Ŀ��
    COMMIT;
END;