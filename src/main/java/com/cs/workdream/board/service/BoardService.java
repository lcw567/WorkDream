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
    List<Board> getFilteredPosts(String category, String filter, int offset, int limit);
    int countFilteredPosts(String category, String filter);
    List<String> getHashtags(int postingNo);
    int addHashtag(int postingNo, String hashtag);

    // 댓글 작업
    List<Reply> getReplies(int postingNo);
    Reply getReplyById(int replyNo);
    int addReply(Reply reply);
    int deleteReply(int replyNo);

    // 직무 카테고리 작업
    List<String> getJobCategories(int postingNo); // 추가
    Board getPostWithJobCategories(int postingNo); // 추가
}
