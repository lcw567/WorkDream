package com.cs.workdream.board.service;

import java.util.HashMap; // HashMap import 추가
import java.util.List;
import java.util.Map;

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
    private org.mybatis.spring.SqlSessionTemplate sqlSession;

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
        
        // logging to verify postingNo
        System.out.println("After insertPost, postingNo: " + board.getPostingNo());
        
        if(result > 0 && board.getHashtags() != null) {
            for(String hashtag : board.getHashtags()) {
                Map<String, Object> params = new HashMap<>();
                params.put("postingNo", board.getPostingNo());
                params.put("hashtag", hashtag);
                boardDao.insertHashtag(sqlSession, params);
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
}
