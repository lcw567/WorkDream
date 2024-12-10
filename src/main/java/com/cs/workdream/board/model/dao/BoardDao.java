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
    
 // 게시글 공감 기록 존재 여부 확인
    public boolean existsPostLike(SqlSessionTemplate sqlSession, int postingNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        params.put("userNo", userNo);
        Integer count = sqlSession.selectOne("boardMapper.existsPostLike", params);
        return count != null && count > 0;
    }

    // 게시글 공감 기록 삽입
    public int insertPostLike(SqlSessionTemplate sqlSession, int postingNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        params.put("userNo", userNo);
        return sqlSession.insert("boardMapper.insertPostLike", params);
    }

    // 게시글 공감 기록 삭제
    public int deletePostLike(SqlSessionTemplate sqlSession, int postingNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("postingNo", postingNo);
        params.put("userNo", userNo);
        return sqlSession.delete("boardMapper.deletePostLike", params);
    }

    // 게시글 공감 수 증가
    public int increasePostLikeCount(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.increasePostLikeCount", postingNo);
    }

    // 게시글 공감 수 감소
    public int decreasePostLikeCount(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.update("boardMapper.decreasePostLikeCount", postingNo);
    }

    /* 댓글 공감 관련 메서드 */

    // 댓글 공감 기록 존재 여부 확인
    public boolean existsReplyLike(SqlSessionTemplate sqlSession, int replyNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("replyNo", replyNo);
        params.put("userNo", userNo);
        Integer count = sqlSession.selectOne("boardMapper.existsReplyLike", params);
        return count != null && count > 0;
    }

    // 댓글 공감 기록 삽입
    public int insertReplyLike(SqlSessionTemplate sqlSession, int replyNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("replyNo", replyNo);
        params.put("userNo", userNo);
        return sqlSession.insert("boardMapper.insertReplyLike", params);
    }

    // 댓글 공감 기록 삭제
    public int deleteReplyLike(SqlSessionTemplate sqlSession, int replyNo, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("replyNo", replyNo);
        params.put("userNo", userNo);
        return sqlSession.delete("boardMapper.deleteReplyLike", params);
    }

    // 댓글 공감 수 증가
    public int increaseReplyLikeCount(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.update("boardMapper.increaseReplyLikeCount", replyNo);
    }

    // 댓글 공감 수 감소
    public int decreaseReplyLikeCount(SqlSessionTemplate sqlSession, int replyNo) {
        return sqlSession.update("boardMapper.decreaseReplyLikeCount", replyNo);
    }
    
    /**
     * 제목으로 게시글 검색
     */
    public List<Board> searchPostsByTitle(SqlSessionTemplate sqlSession, String title, int offset, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("title", "%" + title + "%"); // SQL의 LIKE 절을 위한 패턴 추가
        params.put("offset", offset);
        params.put("endRow", offset + limit); // endRow 계산 및 추가
        return sqlSession.selectList("boardMapper.searchPostsByTitle", params);
    }


    /**
     * 제목으로 검색된 게시글 수 조회
     */
    public int countSearchPostsByTitle(SqlSessionTemplate sqlSession, String title) {
        String searchTitle = "%" + title + "%";
        return sqlSession.selectOne("boardMapper.countSearchPostsByTitle", searchTitle);
    }
    
    // BoardDao.java
    public int deleteHashtagsByPost(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.delete("boardMapper.deleteHashtagsByPost", postingNo);
    }
    
    public int deleteJobCategoriesByPost(SqlSessionTemplate sqlSession, int postingNo) {
        return sqlSession.delete("boardMapper.deleteJobCategoriesByPost", postingNo);
    }


}