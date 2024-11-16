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
        
        // postingNo 확인 로그
        System.out.println("After insertPost, postingNo: " + board.getPostingNo());
        
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
    public int updatePost(Board board) {
        return boardDao.updatePost(sqlSession, board);
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
    public List<Board> getFilteredPosts(String category, String filter, int offset, int limit) {
        return boardDao.selectFilteredPosts(sqlSession, category, filter, offset, limit);
    }

    @Override
    public int countFilteredPosts(String category, String filter) {
        return boardDao.countFilteredPosts(sqlSession, category, filter);
    }

    @Override
    public List<String> getHashtags(int postingNo) {
        return boardDao.selectHashtags(sqlSession, postingNo);
    }

    @Override
    public int addHashtag(int postingNo, String hashtag) {
        Map<String, Object> params = new HashMap<>(); // HashMap 사용
        params.put("postingNo", postingNo);
        params.put("hashtag", hashtag);
        return boardDao.insertHashtag(sqlSession, params);
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

    // 직무 카테고리 조회 메서드 추가
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

            // 로그 출력
            System.out.println("Retrieved Job Categories for postId=" + postingNo + ": " + jobCategories);
        }
        return post;
    }
}
