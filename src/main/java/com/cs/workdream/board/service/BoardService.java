package com.cs.workdream.board.service;

import java.util.List;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;

public interface BoardService {
    // 게시판 작업
    List<Board> getPosts(String category, int offset, int limit);
    Board getPost(int postingNo);
    int createPost(Board board);
    int updatePost(Board board);
    int deletePost(int postingNo);
    int countPosts(String category);
    List<Board> getPopularPosts();
    List<Board> getFilteredPosts(String category, String filter, String jobFilter, int offset, int limit);
    int countFilteredPosts(String category, String filter, String jobFilter);
    List<String> getHashtags(int postingNo);
    int addHashtag(int postingNo, String hashtag);
    
    void increaseViewCount(int postingNo);
    void increaseLikeCount(int postingNo); // 공감 수 증가 메서드
    void decreaseLikeCount(int postingNo); // 공감 수 감소 메서드
    
    // 댓글 작업
    List<Reply> getReplies(int postingNo);
    Reply getReplyById(int replyNo);
    int addReply(Reply reply);
    int deleteReply(int replyNo);

    // 직무 카테고리 작업
    List<String> getJobCategories(int postingNo); // 추가
    Board getPostWithJobCategories(int postingNo); // 추가
}
