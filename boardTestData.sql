SET DEFINE OFF;

-- 커뮤니티 테스트 데이터 생성(멤버 테스트 데이터 실행 한 다음 실행)

-- 신입 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '신입', '첫 직장 생활을 시작하며 느낀 점', 
'안녕하세요! 저는 이번에 첫 직장으로 도화엔지니어링에 입사하게 되었습니다. 새로운 환경에 적응하는 과정에서 느낀 점들과 함께 여러분의 첫 직장 경험담을 듣고 싶습니다.', 
NULL, 'person1', 1, SYSDATE, 150, 25, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '신입', '신입사원으로서 알아두면 좋은 회사 문화', 
'새로운 회사에 적응하기 위해 꼭 알아야 할 회사 문화와 예절에 대해 이야기해보려 합니다. 경험이 있으신 분들의 조언 부탁드립니다!', 
NULL, 'person2', 2, SYSDATE, 250, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '신입', '첫 출근날 준비 체크리스트', 
'첫 출근날에 준비해야 할 것들에 대한 체크리스트를 공유합니다. 여러분이 준비했던 것들과 추가로 필요한 것들을 알려주세요.', 
NULL, 'person3', 3, SYSDATE, 300, 75, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '신입', '신입사원의 커리어 성장 전략', 
'신입사원으로서 커리어를 어떻게 발전시켜 나갈지에 대한 전략을 공유합니다. 성공적인 커리어를 쌓기 위한 팁을 알려주세요!', 
NULL, 'person4', 4, SYSDATE, 400, 100, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '신입', '직장 내 인간관계 형성하기', 
'직장 생활에서 중요한 인간관계 형성에 대해 이야기해보고 싶습니다. 좋은 동료 관계를 맺기 위한 팁이 있다면 공유해주세요.', 
NULL, 'person5', 5, SYSDATE, 500, 125, 'Y');

-- 채용공고 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '채용공고', '새로운 프로젝트 팀원 모집', 
'저희 팀에서는 새로운 프로젝트를 위해 열정적이고 창의적인 팀원을 모집하고 있습니다. 관심 있으신 분들은 댓글로 지원 의사를 밝혀주세요!', 
NULL, 'business1', 6, SYSDATE, 200, 40, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '채용공고', '마케팅 부서 인턴십 기회', 
'다가오는 여름 방학을 맞아 마케팅 부서에서 인턴을 모집합니다. 관련 경험이 있거나 관심 있는 학생들의 많은 지원 바랍니다.', 
NULL, 'business2', 7, SYSDATE, 350, 60, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '채용공고', '개발팀 정규직 채용 안내', 
'우리 회사 개발팀에서 정규직 개발자를 채용합니다. 최신 기술을 다루는 환경에서 함께 성장할 인재를 찾고 있습니다.', 
NULL, 'business3', 8, SYSDATE, 450, 80, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '채용공고', '디자인 팀 신규 포지션 오픈', 
'창의적인 디자인을 추구하는 저희 디자인 팀에서 새로운 포지션을 오픈했습니다. 포트폴리오 제출 필수!', 
NULL, 'business4', 9, SYSDATE, 550, 100, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '채용공고', '인사팀 리더 채용 공고', 
'인사팀의 리더로서 팀을 이끌어 갈 경험 많은 분을 모집합니다. 리더십과 인사 관리에 자신 있는 분들의 많은 지원 바랍니다.', 
NULL, 'business5', 10, SYSDATE, 650, 120, 'Y');

-- 취준 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '취준', '효과적인 취업 준비 방법', 
'취업을 준비하면서 어떤 방법들이 효과적인지 공유하고 싶습니다. 각자의 경험과 팁을 나눠주세요!', 
NULL, 'person6', 6, SYSDATE, 180, 30, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '취준', '취업박람회 참가 후기', 
'최근 참가한 취업박람회에 대한 후기를 공유합니다. 유익했던 점과 개선되었으면 하는 점을 이야기해보아요.', 
NULL, 'person7', 7, SYSDATE, 280, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '취준', '효과적인 자기소개서 작성법', 
'자기소개서를 어떻게 작성하면 좋은지에 대한 팁을 공유합니다. 좋은 자기소개서 작성에 도움이 되는 정보가 있다면 알려주세요!', 
NULL, 'person8', 8, SYSDATE, 380, 70, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '취준', '면접 대비 전략', 
'면접에서 좋은 인상을 남기기 위한 전략과 준비 방법을 공유합니다. 면접 경험이 있으신 분들의 조언 부탁드립니다.', 
NULL, 'person9', 9, SYSDATE, 480, 90, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '취준', '네트워킹의 중요성', 
'취업 준비 과정에서 네트워킹이 얼마나 중요한지에 대해 이야기해보고 싶습니다. 효과적인 네트워킹 방법이 있다면 공유해주세요.', 
NULL, 'person10', 10, SYSDATE, 580, 110, 'Y');

-- 자소서 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자소서', '자기소개서 작성 팁 공유', 
'자기소개서를 작성할 때 유용한 팁이나 방법을 공유합니다. 각자의 경험을 나눠주세요!', 
NULL, 'person1', 1, SYSDATE, 220, 40, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자소서', '성공적인 자소서 사례', 
'성공적으로 채용된 자소서 사례를 공유합니다. 어떤 내용이 좋았는지 함께 분석해봐요.', 
NULL, 'person2', 2, SYSDATE, 320, 60, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자소서', '자기소개서 오류 피하기', 
'자기소개서 작성 시 흔히 범하는 오류들과 이를 피하는 방법에 대해 이야기해봅시다.', 
NULL, 'person3', 3, SYSDATE, 420, 80, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자소서', '자기소개서 첨삭 요청', 
'작성한 자기소개서를 첨삭받고 싶습니다. 의견을 주신다면 감사하겠습니다.', 
NULL, 'person4', 4, SYSDATE, 520, 100, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자소서', '자기소개서 예제 공유', 
'다양한 자기소개서 예제를 공유합니다. 참고하셔서 좋은 자소서 작성하시길 바랍니다.', 
NULL, 'person5', 5, SYSDATE, 620, 120, 'Y');

-- 자격증 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자격증', '유용한 자격증 추천', 
'취업 준비에 도움이 되는 자격증을 추천해드립니다. 여러분이 취득한 자격증도 공유해주세요!', 
NULL, 'person6', 6, SYSDATE, 120, 20, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자격증', '자격증 공부 방법', 
'효과적으로 자격증을 공부하는 방법에 대해 이야기해보고 싶습니다. 공부 팁이 있으신 분들은 공유해주세요.', 
NULL, 'person7', 7, SYSDATE, 220, 40, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자격증', '자격증 취득 후기', 
'최근에 취득한 자격증에 대한 후기를 공유합니다. 취득 과정과 느낀 점을 이야기해주세요.', 
NULL, 'person8', 8, SYSDATE, 320, 60, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자격증', '자격증 관련 자료 공유', 
'자격증 공부에 도움이 되는 자료나 사이트를 공유합니다. 유용한 자료가 있다면 알려주세요!', 
NULL, 'person9', 9, SYSDATE, 420, 80, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '자격증', '자격증 시험 일정 안내', 
'다가오는 자격증 시험 일정과 준비 방법에 대해 공유합니다. 시험을 준비 중인 분들의 정보도 함께 나눠주세요.', 
NULL, 'person10', 10, SYSDATE, 520, 100, 'Y');

-- Q&A 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', '취업 준비 관련 질문', 
'취업 준비 과정에서 겪고 있는 어려움이나 궁금한 점이 있습니다. 자유롭게 질문해주세요!', 
NULL, 'person1', 1, SYSDATE, 140, 30, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', '자기소개서 작성법에 대한 질문', 
'자기소개서를 작성할 때 어떤 점을 중점적으로 작성해야 하는지 궁금합니다. 조언 부탁드립니다.', 
NULL, 'person2', 2, SYSDATE, 240, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', '면접 대비 전략', 
'면접에서 좋은 인상을 남기기 위한 전략에 대해 알고 싶습니다. 경험이 있으신 분들의 조언 부탁드립니다.', 
NULL, 'person3', 3, SYSDATE, 340, 70, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', '효과적인 네트워킹 방법', 
'취업 준비 중 네트워킹을 효과적으로 하는 방법에 대해 질문드립니다. 팁이나 경험을 공유해주세요.', 
NULL, 'person4', 4, SYSDATE, 440, 90, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, 'Q&A', '자격증 선택에 대한 조언', 
'어떤 자격증을 취득하는 것이 취업에 도움이 될지 고민 중입니다. 추천해주실 자격증이 있나요?', 
NULL, 'person5', 5, SYSDATE, 540, 110, 'Y');

-- 커리어 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '커리어', '커리어 전환을 위한 조언', 
'현재 직장에서 다른 분야로 커리어를 전환하고 싶습니다. 성공적으로 전환한 분들의 경험을 듣고 싶어요.', 
NULL, 'person6', 6, SYSDATE, 160, 30, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '커리어', '직장에서의 성장 전략', 
'직장에서 지속적으로 성장하기 위한 전략에 대해 이야기해보고 싶습니다. 여러분의 성공적인 성장 방법을 공유해주세요.', 
NULL, 'person7', 7, SYSDATE, 260, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '커리어', '리더십 개발 방법', 
'효과적인 리더가 되기 위한 리더십 개발 방법에 대해 논의해봅시다. 유용한 리더십 스킬이 있다면 공유해주세요.', 
NULL, 'person8', 8, SYSDATE, 360, 70, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '커리어', '워크라이프 밸런스 유지하기', 
'직장 생활과 개인 생활의 균형을 어떻게 유지할 수 있을지에 대해 이야기해보고 싶습니다. 팁이나 경험을 공유해주세요.', 
NULL, 'person9', 9, SYSDATE, 460, 90, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '커리어', '효과적인 시간 관리 방법', 
'업무 효율성을 높이기 위한 시간 관리 방법에 대해 논의해봅시다. 여러분의 시간 관리 팁을 공유해주세요.', 
NULL, 'person10', 10, SYSDATE, 560, 110, 'Y');

-- 이직 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '이직', '이직을 결심하게 된 이유', 
'최근에 이직을 결심하게 된 이유와 과정에 대해 공유하고 싶습니다. 비슷한 고민을 하고 있는 분들에게 도움이 되었으면 좋겠어요.', 
NULL, 'person1', 1, SYSDATE, 170, 30, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '이직', '이직 준비 과정 공유', 
'이직을 준비하면서 어떤 과정을 거쳤는지 공유합니다. 이직을 고려 중인 분들에게 도움이 되었으면 좋겠어요.', 
NULL, 'person2', 2, SYSDATE, 270, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '이직', '이직 시 고려해야 할 사항', 
'이직을 결정하기 전에 고려해야 할 중요한 사항들에 대해 이야기해봅시다. 여러분의 경험을 공유해주세요.', 
NULL, 'person3', 3, SYSDATE, 370, 70, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '이직', '성공적인 이직을 위한 전략', 
'성공적으로 이직하기 위한 전략과 팁을 공유합니다. 효과적인 이직을 위해 어떤 노력을 하셨는지 알려주세요.', 
NULL, 'person4', 4, SYSDATE, 470, 90, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '이직', '이직 후 적응하기', 
'이직한 후 새로운 환경에 어떻게 적응했는지에 대해 공유합니다. 이직 후 겪은 어려움과 극복 방법을 알려주세요.', 
NULL, 'person5', 5, SYSDATE, 570, 110, 'Y');

-- 잡담 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '잡담', '주말에 뭐 하세요?', 
'이번 주말에 특별한 계획이 있나요? 자유롭게 이야기해봐요!', 
NULL, 'person6', 6, SYSDATE, 130, 20, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '잡담', '최근 본 영화 추천', 
'최근에 본 영화 중에 추천할 만한 영화가 있나요? 여러분의 영화 후기를 공유해주세요.', 
NULL, 'person7', 7, SYSDATE, 230, 40, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '잡담', '취미 생활 이야기', 
'여러분의 취미 생활에 대해 이야기해봅시다. 새로운 취미를 찾고 있는 분들에게 도움이 되었으면 좋겠어요.', 
NULL, 'person8', 8, SYSDATE, 330, 60, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '잡담', '최근에 읽은 책', 
'최근에 읽은 책 중에 추천할 만한 책이 있나요? 책 리뷰를 공유해주세요.', 
NULL, 'person9', 9, SYSDATE, 430, 80, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '잡담', '여행 경험 공유', 
'최근 다녀온 여행지에 대한 경험을 공유합니다. 아름다웠던 장소나 재미있었던 이야기를 들려주세요!', 
NULL, 'person10', 10, SYSDATE, 530, 100, 'Y');

-- 면접 카테고리 게시글
INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '면접', '면접 질문 준비하기', 
'면접에서 자주 나오는 질문들을 어떻게 준비하면 좋을지 이야기해봅시다. 효과적인 답변 방법을 공유해주세요.', 
NULL, 'person1', 1, SYSDATE, 190, 30, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '면접', '스트레스 관리 방법', 
'면접 준비 중 느끼는 스트레스를 어떻게 관리하고 있나요? 효과적인 스트레스 해소법을 공유해주세요.', 
NULL, 'person2', 2, SYSDATE, 290, 50, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '면접', '면접장에서의 첫인상', 
'면접장에서 좋은 첫인상을 남기기 위한 방법에 대해 이야기해봅시다. 복장부터 태도까지 다양한 팁을 공유해주세요.', 
NULL, 'person3', 3, SYSDATE, 390, 70, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '면접', '면접 후 감사 이메일 작성법', 
'면접 후 감사 이메일을 작성할 때 유의할 점과 좋은 예시에 대해 공유합니다.', 
NULL, 'person4', 4, SYSDATE, 490, 90, 'Y');

INSERT INTO POSTING (POSTING_NO, CATEGORY, TITLE, CONTENT, IMAGE, AUTHOR, USER_NO, CREATED_TIME, VIEW_COUNT, LIKE_COUNT, STATUS)
VALUES (POSTING_SEQ.NEXTVAL, '면접', '가상 면접 연습하기', 
'가상 면접을 효과적으로 연습하는 방법에 대해 이야기해봅시다. 연습 파트너가 필요한 분들도 있으니 함께 연습해보아요.', 
NULL, 'person5', 5, SYSDATE, 590, 110, 'Y');

-- 직무 카테고리 및 해시태그 추가
DECLARE
    TYPE JobCategoryArray IS TABLE OF VARCHAR2(100);
    TYPE HashtagArray IS TABLE OF VARCHAR2(100);
    
    jobCategories JobCategoryArray := JobCategoryArray(
        '기획·전략', '마케팅·홍보·조사', '회계·세무·재무', '인사·노무·HRD', '총무·법무·사무',
        'IT개발·데이터', '디자인', '영업·판매·무역', '고객상담·TM', '구매·자재·물류',
        '상품기획·MD', '운전·운송·배송', '서비스', '생산', '건설·건축',
        '의료', '연구·R&D', '교육', '미디어·문화·스포츠', '금융·보험', '공공·복지'
    );
    
    hashtags HashtagArray := HashtagArray(
        '#취업준비', '#첫직장', '#커리어', '#자기소개서', '#면접팁',
        '#인간관계', '#네트워킹', '#자격증', '#이직', '#스트레스관리',
        '#시간관리', '#성장전략', '#리더십', '#워크라이프밸런스', '#취미생활',
        '#영화추천', '#책리뷰', '#여행후기', '#스트레스해소', '#자기개발'
    );

    v_posting_no NUMBER;
    v_random_job VARCHAR2(100);
    v_random_hashtag1 VARCHAR2(100);
    v_random_hashtag2 VARCHAR2(100);
    v_random_hashtag3 VARCHAR2(100);
BEGIN
    FOR rec IN (SELECT POSTING_NO, CATEGORY FROM POSTING) LOOP
        v_posting_no := rec.POSTING_NO;

        -- 직무 카테고리 랜덤 할당 (카테고리에 맞는 직무 선택 가능하도록 조정)
        IF rec.CATEGORY = '신입' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 6))); -- 기획~IT개발
        ELSIF rec.CATEGORY = '채용공고' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(6, 11))); -- 디자인~구매
        ELSIF rec.CATEGORY = '취준' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(11, 16))); -- 운송~의료
        ELSIF rec.CATEGORY = '자소서' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(16, 21))); -- 연구~공공
        ELSIF rec.CATEGORY = '자격증' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        ELSIF rec.CATEGORY = 'Q&A' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        ELSIF rec.CATEGORY = '커리어' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        ELSIF rec.CATEGORY = '이직' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        ELSIF rec.CATEGORY = '잡담' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        ELSIF rec.CATEGORY = '면접' THEN
            v_random_job := jobCategories(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        END IF;

        -- COMMUNITY_POST_JOB_CATEGORY 테이블에 직무 카테고리 삽입
        INSERT INTO COMMUNITY_POST_JOB_CATEGORY (POSTING_NO, JOB_CATEGORY)
        VALUES (v_posting_no, v_random_job);

        -- 해시태그 랜덤 선택
        v_random_hashtag1 := hashtags(TRUNC(DBMS_RANDOM.VALUE(1, hashtags.COUNT + 1)));
        v_random_hashtag2 := hashtags(TRUNC(DBMS_RANDOM.VALUE(1, hashtags.COUNT + 1)));
        v_random_hashtag3 := hashtags(TRUNC(DBMS_RANDOM.VALUE(1, hashtags.COUNT + 1)));

        -- 중복 방지를 위해 다른 해시태그인지 확인
        IF v_random_hashtag1 != v_random_hashtag2 AND v_random_hashtag1 != v_random_hashtag3 AND v_random_hashtag2 != v_random_hashtag3 THEN
            -- 해시태그 삽입
            INSERT INTO COMMUNITY_POST_HASHTAG (POSTING_NO, HASHTAG)
            VALUES (v_posting_no, v_random_hashtag1);

            INSERT INTO COMMUNITY_POST_HASHTAG (POSTING_NO, HASHTAG)
            VALUES (v_posting_no, v_random_hashtag2);

            INSERT INTO COMMUNITY_POST_HASHTAG (POSTING_NO, HASHTAG)
            VALUES (v_posting_no, v_random_hashtag3);
        END IF;
    END LOOP;

    COMMIT;
END;
/
    
-- 댓글 추가
-- 각 게시글에 최소 2개의 댓글을 추가합니다.

DECLARE
    CURSOR posting_cursor IS
        SELECT POSTING_NO FROM POSTING;
    v_reply_no NUMBER;
BEGIN
    FOR post IN posting_cursor LOOP
        -- 첫 번째 댓글
        INSERT INTO REPLY (REPLY_NO, POSTING_NO, USER_NO, CONTENT, CREATED_TIME, STATUS)
        VALUES (REPLY_SEQ.NEXTVAL, post.POSTING_NO, TRUNC(DBMS_RANDOM.VALUE(1, 11)), 
                '이 게시글 정말 유익합니다! 감사합니다.', SYSDATE, 'Y');

        -- 두 번째 댓글
        INSERT INTO REPLY (REPLY_NO, POSTING_NO, USER_NO, CONTENT, CREATED_TIME, STATUS)
        VALUES (REPLY_SEQ.NEXTVAL, post.POSTING_NO, TRUNC(DBMS_RANDOM.VALUE(1, 11)), 
                '공감합니다. 저도 비슷한 경험이 있어요.', SYSDATE, 'Y');
    END LOOP;

    COMMIT;
END;
/

-- 커밋
COMMIT;
