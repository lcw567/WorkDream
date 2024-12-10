package com.cs.workdream.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.board.model.dao.BoardDao;
import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    // 게시판 작업
    @Override
    public List<Board> getPosts(String category, int offset, int limit) {
        return boardDao.selectPosts(sqlSession, category, offset, limit);
    }

    @Override
    public Board getPost(int postingNo) {
        return boardDao.selectPost(sqlSession, postingNo);
    }

    @Transactional
    @Override
    public int createPost(Board board) {
        // 게시글 삽입
        int result = boardDao.insertPost(sqlSession, board);
        
        if(result > 0 && board.getHashtags() != null) {
            for(String hashtag : board.getHashtags()) {
                Map<String, Object> params = new HashMap<>();
                params.put("postingNo", board.getPostingNo());
                params.put("hashtag", hashtag);
                boardDao.insertHashtag(sqlSession, params);
            }
        }
        
        // 직무 카테고리 삽입
        if(board.getJobCategories() != null) {
            for(String job : board.getJobCategories()) {
                if(!"선택 안 함".equals(job)) { 
                    boardDao.insertJobCategory(sqlSession, board.getPostingNo(), job);
                }
            }
        }
    
        return result;
    }

    @Override
    @Transactional
    public int updatePost(Board board) {
        // 게시글 기본 정보 업데이트
        int result = boardDao.updatePost(sqlSession, board);
        
        if (result > 0) {
            // 기존 해시태그 삭제
            boardDao.deleteHashtagsByPost(sqlSession, board.getPostingNo());
            
            // 새로운 해시태그 삽입
            if (board.getHashtags() != null && !board.getHashtags().isEmpty()) {
                for (String hashtag : board.getHashtags()) {
                    Map<String, Object> params = new HashMap<>();
                    params.put("postingNo", board.getPostingNo());
                    params.put("hashtag", hashtag);
                    boardDao.insertHashtag(sqlSession, params);
                }
            }
            
            // 기존 직무 카테고리 삭제
            boardDao.deleteJobCategoriesByPost(sqlSession, board.getPostingNo());

            // 새로운 직무 카테고리 삽입
            if (board.getJobCategories() != null && !board.getJobCategories().isEmpty()) {
                for (String job : board.getJobCategories()) {
                    if (!"선택 안 함".equals(job)) {
                        boardDao.insertJobCategory(sqlSession, board.getPostingNo(), job);
                    }
                }
            }
        }

        return result;
    }

    @Override
    public int deletePost(int postingNo) {
        return boardDao.deletePost(sqlSession, postingNo);
    }

    @Override
    public int countPosts(String category) {
        return boardDao.countPosts(sqlSession, category);
    }

    @Override
    public List<Board> getPopularPosts() {
        return boardDao.selectPopularPosts(sqlSession);
    }

    @Override
    public List<Board> getFilteredPosts(String category, String filter, String jobFilter, int offset, int limit) {
        List<Board> posts = boardDao.selectFilteredPosts(sqlSession, category, filter, jobFilter, offset, limit);
        // 각 게시글에 대해 직무 카테고리 설정
        for (Board post : posts) {
            List<String> jobCategories = boardDao.selectJobCategoriesByPostId(sqlSession, post.getPostingNo());
            post.setJobCategories(jobCategories);
        }
        return posts;
    }

    @Override
    public int countFilteredPosts(String category, String filter, String jobFilter) {
        return boardDao.countFilteredPosts(sqlSession, category, filter, jobFilter);
    }

    @Override
    public List<String> getHashtags(int postingNo) {
        return boardDao.selectHashtags(sqlSession, postingNo);
    }

    @Override
    public int addHashtag(int postingNo, String hashtag) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        params.put("hashtag", hashtag);
        return boardDao.insertHashtag(sqlSession, params);
    }
    
    @Override
    @Transactional
    public void increaseViewCount(int postingNo) {
        boardDao.increaseViewCount(sqlSession, postingNo);
    }
    
    /* 게시글 공감 메서드 */
    @Override
    @Transactional
    public boolean likePost(int postingNo, int userNo) {
        // 이미 공감했는지 확인
        if(boardDao.existsPostLike(sqlSession, postingNo, userNo)) {
            return false; // 이미 공감한 경우
        }
        // 공감 기록 삽입
        int insertResult = boardDao.insertPostLike(sqlSession, postingNo, userNo);
        if(insertResult > 0) {
            // LIKE_COUNT 증가
            boardDao.increasePostLikeCount(sqlSession, postingNo);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean unlikePost(int postingNo, int userNo) {
        // 공감 기록이 있는지 확인
        if(!boardDao.existsPostLike(sqlSession, postingNo, userNo)) {
            return false; // 공감하지 않은 경우
        }
        // 공감 기록 삭제
        int deleteResult = boardDao.deletePostLike(sqlSession, postingNo, userNo);
        if(deleteResult > 0) {
            // LIKE_COUNT 감소
            boardDao.decreasePostLikeCount(sqlSession, postingNo);
            return true;
        }
        return false;
    }

    /* 댓글 공감 메서드 */
    @Override
    @Transactional
    public boolean likeReply(int replyNo, int userNo) {
        // 이미 공감했는지 확인
        if(boardDao.existsReplyLike(sqlSession, replyNo, userNo)) {
            return false; // 이미 공감한 경우
        }
        // 공감 기록 삽입
        int insertResult = boardDao.insertReplyLike(sqlSession, replyNo, userNo);
        if(insertResult > 0) {
            // LIKE_COUNT 증가
            boardDao.increaseReplyLikeCount(sqlSession, replyNo);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public boolean unlikeReply(int replyNo, int userNo) {
        // 공감 기록이 있는지 확인
        if(!boardDao.existsReplyLike(sqlSession, replyNo, userNo)) {
            return false; // 공감하지 않은 경우
        }
        // 공감 기록 삭제
        int deleteResult = boardDao.deleteReplyLike(sqlSession, replyNo, userNo);
        if(deleteResult > 0) {
            // LIKE_COUNT 감소
            boardDao.decreaseReplyLikeCount(sqlSession, replyNo);
            return true;
        }
        return false;
    }


    // 댓글 작업
    @Override
    public List<Reply> getReplies(int postingNo) {
        return boardDao.selectReplies(sqlSession, postingNo);
    }

    @Override
    public Reply getReplyById(int replyNo) {
        return boardDao.selectReplyById(sqlSession, replyNo);
    }

    @Override
    public int addReply(Reply reply) {
        return boardDao.insertReply(sqlSession, reply);
    }

    @Override
    public int deleteReply(int replyNo) {
        return boardDao.deleteReply(sqlSession, replyNo);
    }

    // 직무 카테고리 작업
    @Override
    public List<String> getJobCategories(int postingNo) {
        return boardDao.selectJobCategoriesByPostId(sqlSession, postingNo);
    }

    // 게시글 조회 시 직무 카테고리 포함 메서드 추가
    @Override
    public Board getPostWithJobCategories(int postingNo) {
        Board post = boardDao.selectPost(sqlSession, postingNo);
        if(post != null) {
            // 해시태그 조회
            List<String> hashtags = boardDao.selectHashtags(sqlSession, postingNo);
            post.setHashtags(hashtags);

            // 직무 카테고리 조회
            List<String> jobCategories = boardDao.selectJobCategoriesByPostId(sqlSession, postingNo);
            
            // 데이터 정제: null 값 제거 및 공백 제거
            if(jobCategories != null) {
                jobCategories = jobCategories.stream()
                    .filter(Objects::nonNull)
                    .map(String::trim)
                    .filter(job -> !job.isEmpty())
                    .collect(Collectors.toList());
            }

            post.setJobCategories(jobCategories);
        }
        return post;
    }
    
    @Override
    public List<Board> searchPostsByTitle(String title, int offset, int limit) {
        List<Board> posts = boardDao.searchPostsByTitle(sqlSession, title, offset, limit);
        // 각 게시글에 대해 직무 카테고리 설정
        for (Board post : posts) {
            List<String> jobCategories = boardDao.selectJobCategoriesByPostId(sqlSession, post.getPostingNo());
            post.setJobCategories(jobCategories);
        }
        return posts;
    }

    @Override
    public int countSearchPostsByTitle(String title) {
        return boardDao.countSearchPostsByTitle(sqlSession, title);
    }
}
