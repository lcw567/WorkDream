package com.cs.workdream.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;

@Repository
public class BoardDao {

    // 카테고리별 게시물 조회 및 페이징 처리
    public List<Board> selectPosts(SqlSessionTemplate sqlSession, String category, int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList("boardMapper.selectPosts", params);
    }

    // 새로운 게시글 삽입
    public int insertPost(SqlSessionTemplate sqlSession, Board board) {
        int result = sqlSession.insert("boardMapper.insertPost", board);
        return result;
    }

    // 게시글 조회 메서드
    public Board selectPost(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.selectOne("boardMapper.selectPost", postingNo);
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

    // 필터링된 게시물 조회 (카테고리, 정렬 기준, 직무 필터) 및 페이징 처리
    public List<Board> selectFilteredPosts(SqlSessionTemplate sqlSession, String category, String filter, String jobFilter, int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("filter", filter);
        params.put("jobFilter", jobFilter);
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList("boardMapper.selectFilteredPosts", params);
    }

    public int countFilteredPosts(SqlSessionTemplate sqlSession, String category, String filter, String jobFilter) {
        Map<String, Object> params = new HashMap<>();
        params.put("category", category);
        params.put("filter", filter);
        params.put("jobFilter", jobFilter);
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

    // 직무 카테고리 조회
    public List<String> selectJobCategoriesByPostId(SqlSessionTemplate sqlSession, int postingNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        return sqlSession.selectList("boardMapper.selectJobCategoriesByPostId", params);
    }

    public int insertJobCategory(SqlSessionTemplate sqlSession, int postingNo, String jobCategory) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        params.put("jobCategory", jobCategory);
        return sqlSession.insert("boardMapper.insertJobCategory", params);
    }
    
    // 조회수 증가 메서드 추가
    public int increaseViewCount(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.increaseViewCount", postingNo);
    }
    
    // 특정 게시글의 댓글 조회
    public List<Reply> selectReplies(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.selectList("boardMapper.selectReplies", postingNo);
    }

    // 댓글 ID로 댓글 조회
    public Reply selectReplyById(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.selectOne("boardMapper.selectReplyById", replyNo);
    }  

    // 댓글 삽입
    public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
        return sqlSession.insert("boardMapper.insertReply", reply);
    }

    // 댓글 소프트 삭제 (상태 변경)
    public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.update("boardMapper.deleteReply", replyNo);
    }
    
    // 공감 수 증가 메서드
    public int increaseLikeCount(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.increaseLikeCount", postingNo);
    }

    // 공감 수 감소 메서드
    public int decreaseLikeCount(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.decreaseLikeCount", postingNo);
    }
}
