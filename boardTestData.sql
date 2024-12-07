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
-- 변수 대체 기능 비활성화
SET DEFINE OFF;

BEGIN
    -- =========================
    -- USER_NO = 1 (person1) 포트폴리오 1
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 대규모 전자상거래 플랫폼을 개발하여 사용자 경험을 극대화하고, 안정적인 트랜잭션 처리를 구현하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 실시간 재고 관리, 주문 처리 시스템, 사용자 리뷰 및 평점 시스템 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: React.js, Redux, TypeScript</span></li>
                <li><span style="font-size: 14px;">백엔드: Node.js, Express.js, GraphQL</span></li>
                <li><span style="font-size: 14px;">데이터베이스: PostgreSQL, Redis</span></li>
                <li><span style="font-size: 14px;">배포: AWS EC2, Kubernetes, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>React.js와 Redux를 활용하여 동적인 사용자 인터페이스를 구현하였고, TypeScript를 사용하여 코드의 안정성을 높였습니다.</p>
            <p>백엔드에서는 Node.js와 Express.js를 이용하여 RESTful API를 구축하였으며, GraphQL을 도입하여 클라이언트와의 효율적인 데이터 통신을 구현하였습니다.</p>
            <p>PostgreSQL을 사용하여 데이터의 신뢰성을 보장하고, Redis를 통해 캐싱 메커니즘을 구현하여 응답 속도를 향상시켰습니다.</p>
            <p>AWS EC2와 Kubernetes를 활용하여 애플리케이션을 컨테이너화하고, Docker를 이용하여 배포 자동화를 실현하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Express.js API 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">const express = require('express');</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">const app = express();</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app.use(express.json());</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app.get('/api/customers', (req, res) => {</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    // 고객 목록 조회 로직</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    res.json(customers);</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">});</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app.listen(5000, () => {</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    console.log('Server is running on port 5000');</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">});</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">본 프로젝트를 통해 대규모 애플리케이션의 풀스택 개발에 대한 깊은 이해를 얻게 되었으며, </span></p>
            <p><span style="font-size: 18px;">React.js와 Redux를 활용한 상태 관리의 중요성을 체감하였습니다. </span></p>
            <p><span style="font-size: 18px;">또한, AWS와 Kubernetes를 이용한 컨테이너화 및 배포 자동화 과정을 경험함으로써 클라우드 환경에서의 애플리케이션 운영에 대한 실무 지식을 습득하였습니다.</span></p>
        ]');
        
        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            1,
            '대규모 전자상거래 플랫폼 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;
    
    -- =========================
    -- USER_NO = 1 (person1) 포트폴리오 2
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 실시간 데이터 분석 및 시각화를 통해 기업의 의사결정을 지원하는 대시보드 시스템을 개발하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 실시간 데이터 스트리밍, 사용자 맞춤형 대시보드, 데이터 필터링 및 탐색 기능 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: React.js, D3.js, TypeScript</span></li>
                <li><span style="font-size: 14px;">백엔드: Python, Flask, WebSocket</span></li>
                <li><span style="font-size: 14px;">데이터베이스: MongoDB, InfluxDB</span></li>
                <li><span style="font-size: 14px;">배포: AWS Lambda, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>React.js와 D3.js를 활용하여 인터랙티브한 데이터 시각화 그래프를 구현하였으며, </p>
            <p>TypeScript를 사용하여 코드의 안정성과 유지보수성을 향상시켰습니다. </p>
            <p>백엔드에서는 Python과 Flask를 이용하여 실시간 데이터 스트리밍을 처리하였고, WebSocket을 통해 프론트엔드와의 실시간 통신을 구현하였습니다.</p>
            <p>MongoDB와 InfluxDB를 사용하여 다양한 형식의 데이터를 효율적으로 저장하고 관리하였으며, AWS Lambda와 Docker를 통해 서버리스 아키텍처로 배포하여 확장성을 확보하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Flask WebSocket 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from flask import Flask</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from flask_socketio import SocketIO, emit</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app = Flask(__name__)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app.config["SECRET_KEY"] = "secret!"</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">socketio = SocketIO(app)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">@socketio.on("connect")</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">def handle_connect():</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    emit("response", {"data": "Connected"})</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">if __name__ == "__main__":</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    socketio.run(app, host="0.0.0.0", port=5000)</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">본 프로젝트를 통해 실시간 데이터 처리 및 시각화의 중요성을 이해하게 되었으며, </span></p>
            <p><span style="font-size: 18px;">React.js와 D3.js를 활용한 복잡한 데이터 시각화 그래프를 효과적으로 구현하는 능력을 배양하였습니다. </span></p>
            <p><span style="font-size: 18px;">Flask와 WebSocket을 이용한 실시간 데이터 스트리밍 구현을 통해 백엔드와 프론트엔드 간의 효율적인 데이터 통신 방법을 익혔습니다.</span></p>
            <p><span style="font-size: 18px;">MongoDB와 InfluxDB를 활용한 다양한 데이터베이스 관리 경험을 쌓았으며, </span></p>
            <p><span style="font-size: 18px;">AWS Lambda와 Docker를 이용한 서버리스 아키텍처 배포를 통해 클라우드 환경에서의 애플리케이션 확장성을 확보하는 방법을 학습하였습니다.</span></p>
        ]');
    
        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            1,
            '실시간 데이터 분석 및 시각화 대시보드 개발',
            v_content,
            NULL
        );

        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;
    
    -- =========================
    -- USER_NO = 1 (person1) 포트폴리오 3
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 머신러닝 알고리즘을 활용하여 사용자 행동을 예측하고, 맞춤형 추천 시스템을 개발하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 사용자 데이터 분석, 예측 모델 개발, 실시간 추천 서비스 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: Angular, NgRx</span></li>
                <li><span style="font-size: 14px;">백엔드: Python, Django, TensorFlow</span></li>
                <li><span style="font-size: 14px;">데이터베이스: MySQL, Elasticsearch</span></li>
                <li><span style="font-size: 14px;">배포: Google Cloud Platform, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>Angular과 NgRx를 활용하여 복잡한 상태 관리를 효과적으로 처리하였고, </p>
            <p>Django와 TensorFlow를 이용하여 머신러닝 모델을 개발하였습니다. </p>
            <p>MySQL과 Elasticsearch를 사용하여 대용량 데이터를 효율적으로 저장하고 검색하는 시스템을 구축하였습니다.</p>
            <p>Google Cloud Platform과 Docker를 사용하여 애플리케이션을 컨테이너화하고, 클라우드 환경에서의 자동 배포를 구현하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// TensorFlow 모델 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import tensorflow as tf</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from tensorflow.keras.models import Sequential</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from tensorflow.keras.layers import Dense</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"># 모델 정의</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model = Sequential()</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model.add(Dense(64, activation='relu', input_shape=(input_dim,)))</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model.add(Dense(1, activation='sigmoid'))</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"># 모델 컴파일</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"># 모델 훈련</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_val, y_val))</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">머신러닝 알고리즘을 실제 비즈니스 문제에 적용하여, 사용자 행동 예측의 정확성을 향상시킬 수 있었습니다. </span></p>
            <p><span style="font-size: 18px;">React.js와 D3.js를 활용한 데이터 시각화 경험을 통해, 복잡한 데이터를 효과적으로 전달하는 방법을 익혔습니다. </span></p>
            <p><span style="font-size: 18px;">Django와 TensorFlow를 이용한 백엔드 개발을 통해, 머신러닝 모델의 통합 및 배포 과정을 경험하였으며, </span></p>
            <p><span style="font-size: 18px;">Google Cloud Platform과 Docker를 활용한 클라우드 배포 경험을 통해, 애플리케이션의 확장성과 안정성을 확보하는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            1,
            '머신러닝 기반 사용자 행동 예측 및 추천 시스템 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;

    -- =========================
    -- USER_NO = 1 (person1) 포트폴리오 4
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 IoT 디바이스를 활용하여 스마트 팩토리 솔루션을 개발하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 실시간 생산 모니터링, 예측 유지보수, 에너지 효율 최적화 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">IoT 플랫폼: AWS IoT Core, MQTT</span></li>
                <li><span style="font-size: 14px;">프로그래밍 언어: Python, C++</span></li>
                <li><span style="font-size: 14px;">데이터베이스: InfluxDB, TimescaleDB</span></li>
                <li><span style="font-size: 14px;">배포: Azure IoT Hub, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>Python과 C++을 사용하여 다양한 IoT 센서를 제어하고, 실시간 데이터를 수집 및 처리하는 시스템을 개발하였습니다. </p>
            <p>AWS IoT Core와 MQTT 프로토콜을 활용하여 IoT 디바이스와 클라우드 간의 안정적인 데이터 통신을 구현하였습니다.</p>
            <p>InfluxDB와 TimescaleDB를 이용하여 시계열 데이터를 효율적으로 저장하고, 실시간 데이터 분석을 통해 생산 공정의 상태를 모니터링하였습니다.</p>
            <p>Azure IoT Hub와 Docker를 사용하여 스마트 팩토리 솔루션을 컨테이너화하고, 클라우드 환경에 배포하여 높은 확장성과 안정성을 확보하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// MQTT 메시지 수신 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import paho.mqtt.client as mqtt</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">def on_connect(client, userdata, flags, rc):</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    print("Connected with result code "+str(rc))</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    client.subscribe("factory/sensors")</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">def on_message(client, userdata, msg):</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    print(msg.topic+" "+str(msg.payload))</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">머신러닝 알고리즘을 실제 비즈니스 문제에 적용하여, 사용자 행동 예측의 정확성을 향상시킬 수 있었습니다. </span></p>
            <p><span style="font-size: 18px;">React.js와 D3.js를 활용한 데이터 시각화 경험을 통해, 복잡한 데이터를 효과적으로 전달하는 방법을 익혔습니다. </span></p>
            <p><span style="font-size: 18px;">Django와 TensorFlow를 이용한 백엔드 개발을 통해, 머신러닝 모델의 통합 및 배포 과정을 경험하였으며, </span></p>
            <p><span style="font-size: 18px;">Google Cloud Platform과 Docker를 활용한 클라우드 배포 경험을 통해, 애플리케이션의 확장성과 안정성을 확보하는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            1,
            '블록체인 기반 탈중앙화 금융 플랫폼 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;

    -- =========================
    -- USER_NO = 2 (person2) 포트폴리오 1
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 모바일 애플리케이션을 개발하여 사용자에게 편리한 금융 서비스를 제공하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 실시간 계좌 조회, 송금, 지출 관리 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: React Native</span></li>
                <li><span style="font-size: 14px;">백엔드: Node.js, Express.js</span></li>
                <li><span style="font-size: 14px;">데이터베이스: PostgreSQL</span></li>
                <li><span style="font-size: 14px;">배포: Firebase, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>React Native를 활용하여 iOS와 Android에서 동작하는 크로스 플랫폼 모바일 애플리케이션을 개발하였으며, </p>
            <p>Node.js와 Express.js를 사용하여 RESTful API를 구축하였습니다. </p>
            <p>PostgreSQL을 이용하여 안정적인 데이터 저장을 보장하였으며, Firebase와 Docker를 활용하여 애플리케이션을 효율적으로 배포하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// React Native 컴포넌트 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import React from 'react';</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import { View, Text, StyleSheet } from 'react-native';</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">const AccountBalance = ({ balance }) => {</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    return (</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">        <View style={styles.container}>${balance}</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">            <Text style={styles.label}>계좌 잔액:</Text></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">            <Text style={styles.balance}>${balance}</Text></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">        </View></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    );</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">};</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">export default AccountBalance;</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">React Native를 활용한 크로스 플랫폼 모바일 애플리케이션 개발을 통해, </span></p>
            <p><span style="font-size: 18px;">모바일 사용자 인터페이스 설계 및 상태 관리에 대한 실무 경험을 쌓았습니다. </span></p>
            <p><span style="font-size: 18px;">Node.js와 Express.js를 이용한 백엔드 개발을 통해, RESTful API 구축 및 서버 측 로직 구현 능력을 향상시켰습니다.</span></p>
            <p><span style="font-size: 18px;">PostgreSQL을 사용한 데이터베이스 설계 및 최적화 경험을 통해, 데이터 관리의 중요성을 이해하게 되었습니다.</span></p>
            <p><span style="font-size: 18px;">Firebase와 Docker를 활용한 클라우드 배포를 통해, 애플리케이션의 확장성과 유지보수성을 높이는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            2,
            '모바일 금융 애플리케이션 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;

    -- =========================
    -- USER_NO = 2 (person2) 포트폴리오 2
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 소셜 미디어 플랫폼을 개발하여 사용자 간의 소통과 정보 공유를 촉진하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 게시물 작성, 댓글, 좋아요, 실시간 알림 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: Vue.js, Vuex</span></li>
                <li><span style="font-size: 14px;">백엔드: Ruby on Rails</span></li>
                <li><span style="font-size: 14px;">데이터베이스: MySQL</span></li>
                <li><span style="font-size: 14px;">배포: Heroku, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>Vue.js와 Vuex를 활용하여 반응형 사용자 인터페이스를 구현하였으며, </p>
            <p>Ruby on Rails를 사용하여 RESTful API를 구축하였습니다. </p>
            <p>MySQL을 이용하여 사용자 데이터 및 게시물 데이터를 효율적으로 관리하였으며, </p>
            <p>Heroku와 Docker를 사용하여 애플리케이션을 클라우드 환경에 배포하고, 지속적인 통합 및 배포(CI/CD)를 구현하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Ruby on Rails 컨트롤러 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">class PostsController < ApplicationController</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    def index</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">        @posts = Post.all</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">        render json: @posts</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    end</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">Vue.js와 Vuex를 활용한 반응형 사용자 인터페이스 개발을 통해, </span></p>
            <p><span style="font-size: 18px;">효율적인 상태 관리와 컴포넌트 재사용의 중요성을 체감하였습니다. </span></p>
            <p><span style="font-size: 18px;">Ruby on Rails를 이용한 백엔드 개발을 통해, RESTful API 설계 및 데이터베이스 연동 능력을 향상시켰습니다.</span></p>
            <p><span style="font-size: 18px;">Firebase와 Docker를 활용한 클라우드 배포를 통해, 애플리케이션의 확장성과 유지보수성을 높이는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            2,
            '소셜 미디어 플랫폼 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;

    -- =========================
    -- USER_NO = 2 (person2) 포트폴리오 2
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 데이터 분석 도구를 개발하여 기업의 비즈니스 인사이트를 도출하는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 데이터 시각화, 보고서 생성, 대시보드 커스터마이징 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: React.js, Chart.js</span></li>
                <li><span style="font-size: 14px;">백엔드: Python, Flask, Pandas</span></li>
                <li><span style="font-size: 14px;">데이터베이스: SQLite</span></li>
                <li><span style="font-size: 14px;">배포: AWS Elastic Beanstalk, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>React.js와 Chart.js를 활용하여 사용자 친화적인 데이터 시각화 인터페이스를 구현하였으며, </p>
            <p>Python과 Flask를 사용하여 데이터 분석 및 보고서 생성을 위한 백엔드 시스템을 개발하였습니다.</p>
            <p>SQLite를 이용하여 경량화된 데이터베이스를 구축하고, Pandas를 활용하여 효율적인 데이터 처리 및 분석을 수행하였습니다.</p>
            <p>AWS Elastic Beanstalk과 Docker를 활용하여 애플리케이션을 클라우드 환경에 배포하고, 지속적인 통합 및 배포(CI/CD) 파이프라인을 구현하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Flask API 엔드포인트 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from flask import Flask, jsonify</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app = Flask(__name__)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">@app.route('/api/posts', methods=['GET'])</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">def get_posts():</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    # 게시물 데이터 조회 로직</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    posts = [{'id': 1, 'title': '첫 번째 게시물'}, {'id': 2, 'title': '두 번째 게시물'}]</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    return jsonify(posts)</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">Vue.js와 Vuex를 활용한 사용자 인터페이스 개발을 통해, </span></p>
            <p><span style="font-size: 18px;">효율적인 상태 관리와 컴포넌트 재사용의 중요성을 체감하였습니다. </span></p>
            <p><span style="font-size: 18px;">Ruby on Rails를 이용한 백엔드 개발을 통해, RESTful API 설계 및 데이터베이스 연동 능력을 향상시켰습니다.</span></p>
            <p><span style="font-size: 18px;">Firebase와 Docker를 활용한 클라우드 배포를 통해, 애플리케이션의 확장성과 유지보수성을 높이는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            2,
            '데이터 분석 도구 개발',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;
    
    -- =========================
    -- USER_NO = 1 (person1) 포트폴리오 5
    -- =========================
    DECLARE
        v_content CLOB;
    BEGIN
        DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
        
        -- 프로젝트 개요
        DBMS_LOB.APPEND(v_content, q'[
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
            <p><span style="font-size: 14px;">본 프로젝트는 인공지능 기반 챗봇을 개발하여 고객 지원을 자동화하고, 사용자 만족도를 향상시키는 것을 목표로 하였습니다.</span></p>
            <p><span style="font-size: 14px;">주요 기능으로는 자연어 처리, 대화 관리, 학습 기능, 멀티 플랫폼 지원 등이 포함됩니다.</span></p>
            <p><br></p>

            <h2><span style="font-size: 14px;">기술 스택</span></h2>
            <ul>
                <li><span style="font-size: 14px;">프론트엔드: React.js</span></li>
                <li><span style="font-size: 14px;">백엔드: Python, Flask, TensorFlow</span></li>
                <li><span style="font-size: 14px;">NLP 라이브러리: NLTK, spaCy</span></li>
                <li><span style="font-size: 14px;">배포: AWS Lambda, Docker</span></li>
            </ul>
            <p><br></p>

            <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
            <p>Python과 Flask를 사용하여 챗봇의 백엔드를 개발하였으며, TensorFlow를 이용하여 딥러닝 기반의 자연어 처리 모델을 구축하였습니다. </p>
            <p>NLTK와 spaCy를 활용하여 사용자 입력을 전처리하고, 다양한 자연어 처리 기법을 적용하여 대화의 정확성을 향상시켰습니다.</p>
            <p>React.js를 사용하여 사용자 친화적인 웹 인터페이스를 구현하였으며, </p>
            <p>AWS Lambda와 Docker를 활용하여 챗봇을 서버리스 아키텍처로 배포하여 높은 확장성과 안정성을 확보하였습니다.</p>
            <p><br></p>

            <!-- 코드 블록 추가 -->
            <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
                <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td style="padding:6px;border-right:2px solid #e5e5e5">
                                <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                                <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                                <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                                <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                                <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                                <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                                <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                                <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                                <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                            </div>
                            </td>
                            <td style="padding:6px 0;text-align:left">
                                <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Flask 챗봇 API 예제</span></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">from flask import Flask, request, jsonify</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import tensorflow as tf</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">import numpy as np</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">app = Flask(__name__)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">model = tf.keras.models.load_model('chatbot_model.h5')</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">@app.route('/chat', methods=['POST'])</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">def chat():</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    user_input = request.json['message']</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    # 입력 전처리 로직</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    processed_input = preprocess(user_input)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    prediction = model.predict(np.array([processed_input]))</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    response = generate_response(prediction)</div>
                                    <div style="padding:0 6px; white-space:pre; line-height:130%">    return jsonify({'reply': response})</div>
                                </div>
                            </td>
                            <td style="vertical-align:bottom;padding:0 2px 4px 0">
                                <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                    <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
            <p><span style="font-size: 18px;">머신러닝 알고리즘을 실제 애플리케이션에 적용하여, </span></p>
            <p><span style="font-size: 18px;">사용자 행동 예측 및 맞춤형 추천 시스템의 정확성을 향상시킬 수 있었습니다. </span></p>
            <p><span style="font-size: 18px;">React Native를 사용한 크로스 플랫폼 모바일 애플리케이션 개발 경험을 통해, </span></p>
            <p><span style="font-size: 18px;">효율적인 사용자 인터페이스 설계 및 상태 관리 능력을 강화하였습니다.</span></p>
            <p><span style="font-size: 18px;">Flask와 TensorFlow를 이용한 백엔드 개발을 통해, </span></p>
            <p><span style="font-size: 18px;">딥러닝 모델의 통합 및 실시간 데이터 처리 능력을 향상시켰습니다.</span></p>
            <p><span style="font-size: 18px;">AWS Lambda와 Docker를 활용한 서버리스 아키텍처 배포를 통해, </span></p>
            <p><span style="font-size: 18px;">애플리케이션의 확장성과 유지보수성을 높이는 방법을 학습하였습니다.</span></p>
        ]');

        -- 포트폴리오 삽입
        INSERT INTO PORTFOLIO (
            PORTFOLIO_ID,
            USER_NO,
            TITLE,
            CONTENT,
            RESUME_NO
        ) VALUES (
            SEQ_PORTFOLIO_ID.NEXTVAL,
            1,
            '인공지능 챗봇 개발 프로젝트',
            v_content,
            NULL
        );
        
        -- 임시 CLOB 해제
        DBMS_LOB.FREETEMPORARY(v_content);
    END;
    
    -- =========================
-- USER_NO = 1 (person1) 포트폴리오 6
-- =========================
DECLARE
    v_content CLOB;
BEGIN
    DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
    
    -- 프로젝트 개요
    DBMS_LOB.APPEND(v_content, q'[
        <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
        <p><span style="font-size: 14px;">본 프로젝트는 인공지능 기반 챗봇을 개발하여 고객 지원을 자동화하고, 사용자 만족도를 향상시키는 것을 목표로 하였습니다.</span></p>
        <p><span style="font-size: 14px;">주요 기능으로는 자연어 처리, 대화 관리, 학습 기능, 멀티 플랫폼 지원 등이 포함됩니다.</span></p>
        <p><br></p>

        <h2><span style="font-size: 14px;">기술 스택</span></h2>
        <ul>
            <li><span style="font-size: 14px;">프론트엔드: React.js</span></li>
            <li><span style="font-size: 14px;">백엔드: Python, Flask, TensorFlow</span></li>
            <li><span style="font-size: 14px;">NLP 라이브러리: NLTK, spaCy</span></li>
            <li><span style="font-size: 14px;">배포: AWS Lambda, Docker</span></li>
        </ul>
        <p><br></p>

        <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
        <p>Python과 Flask를 사용하여 챗봇의 백엔드를 개발하였으며, TensorFlow를 이용하여 딥러닝 기반의 자연어 처리 모델을 구축하였습니다.</p>
        <p>NLTK와 spaCy를 활용하여 사용자 입력을 전처리하고, 다양한 자연어 처리 기법을 적용하여 대화의 정확성을 향상시켰습니다.</p>
        <p>React.js를 사용하여 사용자 친화적인 웹 인터페이스를 구현하였으며, </p>
        <p>AWS Lambda와 Docker를 활용하여 챗봇을 서버리스 아키텍처로 배포하여 높은 확장성과 안정성을 확보하였습니다.</p>
        <p><br></p>

        <!-- 코드 블록 추가 -->
        <div class="colorscripter-code" style="color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important; position:relative !important;overflow:auto">
            <table class="colorscripter-code-table" style="margin:0;padding:0;border:none;background-color:#fafafa;border-radius:4px;" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td style="padding:6px;border-right:2px solid #e5e5e5">
                            <div style="line-height:130%">1</div><div style="line-height:130%">2</div><div style="line-height:130%">3</div><div style="line-height:130%">4</div>
                            <div style="line-height:130%">5</div><div style="line-height:130%">6</div><div style="line-height:130%">7</div><div style="line-height:130%">8</div>
                            <div style="line-height:130%">9</div><div style="line-height:130%">10</div><div style="line-height:130%">11</div><div style="line-height:130%">12</div>
                            <div style="line-height:130%">13</div><div style="line-height:130%">14</div><div style="line-height:130%">15</div><div style="line-height:130%">16</div>
                            <div style="line-height:130%">17</div><div style="line-height:130%">18</div><div style="line-height:130%">19</div><div style="line-height:130%">20</div>
                            <div style="line-height:130%">21</div><div style="line-height:130%">22</div><div style="line-height:130%">23</div><div style="line-height:130%">24</div>
                            <div style="line-height:130%">25</div><div style="line-height:130%">26</div><div style="line-height:130%">27</div><div style="line-height:130%">28</div>
                            <div style="line-height:130%">29</div><div style="line-height:130%">30</div><div style="line-height:130%">31</div><div style="line-height:130%">32</div>
                            <div style="line-height:130%">33</div><div style="line-height:130%">34</div>
                        </div>
                        </td>
                        <td style="padding:6px 0;text-align:left">
                            <div style="margin:0;padding:0;color:#010101;font-family:Consolas, 'Liberation Mono', Menlo, Courier, monospace !important;line-height:130%">
                                <div style="padding:0 6px; white-space:pre; line-height:130%"><span style="color:#999999">// Flask 챗봇 API 예제</span></div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">from flask import Flask, request, jsonify</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">import tensorflow as tf</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">import numpy as np</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">app = Flask(__name__)</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">model = tf.keras.models.load_model('chatbot_model.h5')</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%"></div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">@app.route('/chat', methods=['POST'])</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">def chat():</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    user_input = request.json['message']</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    # 입력 전처리 로직</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    processed_input = preprocess(user_input)</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    prediction = model.predict(np.array([processed_input]))</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    response = generate_response(prediction)</div>
                                <div style="padding:0 6px; white-space:pre; line-height:130%">    return jsonify({'reply': response})</div>
                            </div>
                        </td>
                        <td style="vertical-align:bottom;padding:0 2px 4px 0">
                            <a href="http://colorscripter.com/info#e" target="_blank" style="text-decoration:none;color:white">
                                <span style="font-size:9px;word-break:normal;background-color:#e5e5e5;color:white;border-radius:10px;padding:1px">cs</span>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
        <p><span style="font-size: 18px;">머신러닝 알고리즘을 실제 애플리케이션에 적용하여, </span></p>
        <p><span style="font-size: 18px;">사용자 행동 예측 및 맞춤형 추천 시스템의 정확성을 향상시킬 수 있었습니다. </span></p>
        <p><span style="font-size: 18px;">React Native를 사용한 크로스 플랫폼 모바일 애플리케이션 개발 경험을 통해, </span></p>
        <p><span style="font-size: 18px;">효율적인 사용자 인터페이스 설계 및 상태 관리 능력을 강화하였습니다.</span></p>
        <p><span style="font-size: 18px;">Flask와 TensorFlow를 이용한 백엔드 개발을 통해, </span></p>
        <p><span style="font-size: 18px;">딥러닝 모델의 통합 및 실시간 데이터 처리 능력을 향상시켰습니다.</span></p>
        <p><span style="font-size: 18px;">AWS Lambda와 Docker를 활용한 서버리스 아키텍처 배포를 통해, </span></p>
        <p><span style="font-size: 18px;">애플리케이션의 확장성과 유지보수성을 높이는 방법을 학습하였습니다.</span></p>
    ]');

    -- 포트폴리오 삽입
    INSERT INTO PORTFOLIO (
        PORTFOLIO_ID,
        USER_NO,
        TITLE,
        CONTENT,
        RESUME_NO
    ) VALUES (
        SEQ_PORTFOLIO_ID.NEXTVAL,
        1,
        '인공지능 챗봇 개발 프로젝트',
        v_content,
        NULL
    );
    
    -- 임시 CLOB 해제
    DBMS_LOB.FREETEMPORARY(v_content);
END;

-- =========================
-- USER_NO = 1 (person1) 포트폴리오 6
-- =========================
DECLARE
    v_content CLOB;
BEGIN
    DBMS_LOB.CREATETEMPORARY(v_content, TRUE);
    
    -- 프로젝트 개요
    DBMS_LOB.APPEND(v_content, q'[
        <h2><span style="font-size: 24px; color: rgb(0, 0, 255);">프로젝트 개요</span></h2>
        <p><span style="font-size: 14px;">본 프로젝트는 인공지능 기반 예측 유지보수 시스템을 개발하여 제조 공정의 효율성을 극대화하는 것을 목표로 하였습니다.</span></p>
        <p><span style="font-size: 14px;">주요 기능으로는 장비 상태 모니터링, 고장 예측, 자동 알림 시스템 등이 포함됩니다.</span></p>
        <p><br></p>

        <h2><span style="font-size: 14px;">기술 스택</span></h2>
        <ul>
            <li><span style="font-size: 14px;">프론트엔드: Angular, NgRx</span></li>
            <li><span style="font-size: 14px;">백엔드: Python, Django, Scikit-learn</span></li>
            <li><span style="font-size: 14px;">데이터베이스: PostgreSQL, Redis</span></li>
            <li><span style="font-size: 14px;">배포: AWS EC2, Docker</span></li>
        </ul>
        <p><br></p>

        <h2><span style="font-size: 18px;">주요 구현 사항</span></h2>
        <p>Angular과 NgRx를 활용하여 실시간 데이터 시각화 대시보드를 구현하였으며, </p>
        <p>Python과 Django를 사용하여 예측 모델을 개발하고, RESTful API를 구축하였습니다.</p>
        <p>Scikit-learn을 이용하여 장비 고장을 예측하는 머신러닝 모델을 훈련시켰으며, PostgreSQL과 Redis를 활용하여 대용량 데이터를 효율적으로 관리하였습니다.</p>
        <p>AWS EC2와 Docker를 사용하여 애플리케이션을 컨테이너화하고, 클라우드 환경에 배포하여 높은 확장성과 안정성을 확보하였습니다.</p>
        <p><br></p>

        <h2><span style="font-size: 24px; color: rgb(0, 0, 255); background-color: rgb(255, 255, 0);">성과 및 배운 점</span></h2>
        <p><span style="font-size: 18px;">머신러닝 모델을 실제 제조 공정에 적용하여 고장 예측의 정확성을 크게 향상시킬 수 있었습니다.</span></p>
        <p><span style="font-size: 18px;">Angular과 NgRx를 활용한 상태 관리 및 실시간 데이터 시각화 경험을 통해, 복잡한 사용자 인터페이스를 효과적으로 구현하는 방법을 익혔습니다.</span></p>
        <p><span style="font-size: 18px;">Python과 Django를 이용한 백엔드 개발을 통해, 데이터 처리 및 API 설계 능력을 향상시켰으며, </span></p>
        <p><span style="font-size: 18px;">AWS와 Docker를 활용한 클라우드 배포 경험을 통해, 애플리케이션의 확장성과 유지보수성을 확보하는 방법을 학습하였습니다.</span></p>
    ]');

    -- 포트폴리오 삽입
    INSERT INTO PORTFOLIO (
        PORTFOLIO_ID,
        USER_NO,
        TITLE,
        CONTENT,
        RESUME_NO
    ) VALUES (
        SEQ_PORTFOLIO_ID.NEXTVAL,
        1,
        '인공지능 기반 예측 유지보수 시스템 개발',
        v_content,
        NULL
    );
    
    -- 임시 CLOB 해제
    DBMS_LOB.FREETEMPORARY(v_content);
END;


    
    
    -- 전체 트랜잭션 커밋
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/




