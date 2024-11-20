package com.cs.workdream.board.service;

import java.util.List;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;

public interface BoardService {

    // 게시물 관련 메서드
    List<Board> getPosts(String category, int offset, int limit);
    Board getPost(int postingNo);
    int createPost(Board board);
    int updatePost(Board board);
    int deletePost(int postingNo);
    int countPosts(String category);
    List<Board> getPopularPosts(); // 인기 게시물 조회 메서드 추가

    // 필터링된 게시물 관련 메서드
    List<Board> getFilteredPosts(String category, String filter, String jobFilter, int offset, int limit);
    int countFilteredPosts(String category, String filter, String jobFilter);

    // 해시태그 관련 메서드
    List<String> getHashtags(int postingNo);
    int addHashtag(int postingNo, String hashtag);

    // 조회수 및 공감 수 관련 메서드
    void increaseViewCount(int postingNo);

    /* 게시글 공감 관련 메서드 */
    boolean likePost(int postingNo, int userNo);
    boolean unlikePost(int postingNo, int userNo);

    /* 댓글 공감 관련 메서드 */
    boolean likeReply(int replyNo, int userNo);
    boolean unlikeReply(int replyNo, int userNo);

    // 댓글 관련 메서드
    List<Reply> getReplies(int postingNo);
    Reply getReplyById(int replyNo);
    int addReply(Reply reply);
    int deleteReply(int replyNo);

    // 직무 카테고리 관련 메서드
    List<String> getJobCategories(int postingNo);
    Board getPostWithJobCategories(int postingNo); // 직무 카테고리 포함 게시글 조회 메서드 추가
}