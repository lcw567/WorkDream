package com.cs.workdream.board.model.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;


@Repository
public class BoardDao {

    // 카테고리별 게시물 조회 및 페이징 처리
    public List<Board> selectPosts(SqlSessionTemplate sqlSession, String category, int offset, int limit) {
        Map<String, Object> params = new HashMap<>(); // Map.of 대신 HashMap 사용
        params.put("category", category);
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList("boardMapper.selectPosts", params, new org.apache.ibatis.session.RowBounds(offset, limit));
    }

    // 게시글 ID로 단일 게시글 조회
    public Board selectPost(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.selectOne("boardMapper.selectPost", postingNo);
    }

    // 새로운 게시글 삽입
    public int insertPost(SqlSessionTemplate sqlSession, Board board) {
        System.out.println("Inserting post with USER_NO: " + board.getUserNo());
        System.out.println("Inserting post with POSTING_NO: " + board.getPostingNo());
        return sqlSession.insert("boardMapper.insertPost", board);
    }

    // 기존 게시글 업데이트
    public int updatePost(SqlSessionTemplate sqlSession, Board board) {
        return sqlSession.update("boardMapper.updatePost", board);
    }

    // 게시글 소프트 삭제 (상태 변경)
    public int deletePost(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.deletePost", postingNo);
    }

    // 카테고리별 게시물 수 조회
    public int countPosts(SqlSessionTemplate sqlSession, String category) {
        if ("전체글".equals(category)) {
            return sqlSession.selectOne("boardMapper.countAllPosts");
        } else {
            return sqlSession.selectOne("boardMapper.countPostsByCategory", category);
        }
    }

    // 조회수 기준 상위 게시물 조회 (예: 상위 5개)
    public List<Board> selectPopularPosts(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("boardMapper.selectPopularPosts");
    }

    // 필터링된 게시물 조회 (카테고리 및 정렬 기준)
    public List<Board> selectFilteredPosts(SqlSessionTemplate sqlSession, String category, String filter, int offset, int limit) {
        Map<String, Object> params = new HashMap<>(); // HashMap 사용
        params.put("category", category);
        params.put("filter", filter);
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList("boardMapper.selectFilteredPosts", params, new org.apache.ibatis.session.RowBounds(offset, limit));
    }

    // 필터링된 게시물 수 조회
    public int countFilteredPosts(SqlSessionTemplate sqlSession, String category, String filter) {
        Map<String, Object> params = new HashMap<>(); // HashMap 사용
        params.put("category", category);
        params.put("filter", filter);
        return sqlSession.selectOne("boardMapper.countFilteredPosts", params);
    }

    // 특정 게시글의 해시태그 조회
    public List<String> selectHashtags(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.selectList("boardMapper.selectHashtags", postingNo);
    }

    // 게시글에 해시태그 삽입
    public int insertHashtag(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
        return sqlSession.insert("boardMapper.insertHashtag", paramMap);
    }

    // 특정 게시글의 댓글 조회
    public List<Reply> selectReplies(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.selectList("boardMapper.selectReplies", postingNo);
    }

    // 댓글 삽입
    public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
        return sqlSession.insert("boardMapper.insertReply", reply);
    }

    // 댓글 ID로 댓글 조회
    public Reply selectReplyById(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.selectOne("boardMapper.selectReplyById", replyNo);
    }

    // 댓글 소프트 삭제 (상태 변경)
    public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.update("boardMapper.deleteReply", replyNo);
    }
}
