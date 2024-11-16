package com.cs.workdream.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;
import com.cs.workdream.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 커뮤니티 홈 페이지 표시
    @GetMapping("/communityHome")
    public String showCommunityHome() {
        return "board/communityHome"; // communityHome.jsp
    }

    // 게시글 작성 페이지 표시
    @GetMapping("/communityPost")
    public String showCommunityPost() {
        return "board/communityPost"; // communityPost.jsp
    }

    // 게시글 보기 페이지 표시
    @GetMapping("/communityView")
    public String showCommunityView(@RequestParam("postId") int postId, Model model, HttpSession session) {
        // 게시글 조회 (직무 카테고리 포함)
        Board post = boardService.getPostWithJobCategories(postId);
        if(post != null && "Y".equals(post.getStatus())) {
            // 조회수 증가
            post.setViewCount(post.getViewCount() + 1);
            boardService.updatePost(post);

            // 모델에 게시글 추가
            model.addAttribute("post", post);

            // 직무 카테고리 로그 출력
            System.out.println("Job Categories for postId=" + postId + ": " + post.getJobCategories());

            // 현재 사용자 정보 (로그인 사용자 정보)
            Object currentUserObj = session.getAttribute("currentUser");
            if(currentUserObj != null) {
                // currentUser 객체를 모델에 추가
                model.addAttribute("currentUser", currentUserObj);
            }

            return "board/communityView"; // communityView.jsp
        } else {
            model.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
            return "common/errorPage"; // 에러 페이지
        }
    }
    
    // 커뮤니티 게시판 목록 페이지 표시
    @GetMapping("/communityList")
    public String showCommunityList(@RequestParam(value="category", defaultValue="인기글") String category, Model model) {
        model.addAttribute("category", category);
        return "board/communityList"; // communityList.jsp
    }
  
  // RESTful API 엔드포인트

    // 게시글 수 조회
    @GetMapping("/api/postCount")
    @ResponseBody
    public Map<String, Object> getPostCount() {
        int count = boardService.countPosts("전체글");
        Map<String, Object> response = new HashMap<>();
        response.put("count", count);
        return response;
    }

    // 인기 게시글 조회
    @GetMapping("/api/popularPosts")
    @ResponseBody
    public Map<String, Object> getPopularPosts() {
        List<Board> posts = boardService.getPopularPosts();
        Map<String, Object> response = new HashMap<>();
        response.put("posts", posts);
        return response;
    }

    // 카테고리 및 필터에 따른 게시글 조회
    @GetMapping("/api/posts")
    @ResponseBody
    public Map<String, Object> getPosts(
            @RequestParam(value="category", defaultValue="전체글") String category,
            @RequestParam(value="filter", defaultValue="최신순") String filter,
            @RequestParam(value="offset", defaultValue="0") int offset,
            @RequestParam(value="limit", defaultValue="10") int limit) {
        
        List<Board> posts;
        int totalCount;

        if("최신순".equals(filter)) {
            posts = boardService.getFilteredPosts(category, filter, offset, limit);
            totalCount = boardService.countFilteredPosts(category, filter);
        } else if("조회순".equals(filter) || "공감 많은 순".equals(filter)) {
            posts = boardService.getFilteredPosts(category, filter, offset, limit);
            totalCount = boardService.countFilteredPosts(category, filter);
        } else {
            // 기본적으로 최신순으로 설정
            posts = boardService.getFilteredPosts(category, "최신순", offset, limit);
            totalCount = boardService.countFilteredPosts(category, "최신순");
        }

        Map<String, Object> response = new HashMap<>();
        response.put("posts", posts);
        response.put("totalCount", totalCount);
        return response;
    }

    // 새로운 게시글 생성
    @PostMapping("/api/posts")
    @ResponseBody
    public Map<String, Object> createPost(
            @RequestParam("category") String category,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value="image", required=false) MultipartFile image,
            @RequestParam(value="jobs", required=false) List<String> jobs,
            @RequestParam(value="hashtags", required=false) List<String> hashtags,
            HttpSession session) {
        
        Map<String, Object> response = new HashMap<>();
        try {
            // 이미지 업로드 처리
            String imagePath = null;
            if(image != null && !image.isEmpty()) {
                String uploadDir = session.getServletContext().getRealPath("/uploads/");
                String originalFilename = image.getOriginalFilename();
                String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;
                File dest = new File(uploadDir + uniqueFilename);
                image.transferTo(dest);
                imagePath = "uploads/" + uniqueFilename;
            }

            // 세션에서 현재 사용자 정보 가져오기
            // 실제 사용자 조회 로직으로 대체 필요
            Map<String, Object> currentUser = (Map<String, Object>) session.getAttribute("currentUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            int userNo = (int) currentUser.get("userNo");
            String author = (String) currentUser.get("userName");

            // Board 객체 생성
            Board board = new Board();
            board.setCategory(category);
            board.setTitle(title);
            board.setContent(content);
            board.setImagePath(imagePath);
            board.setAuthor(author);
            board.setUserNo(userNo);
            board.setCreatedTime(new java.sql.Timestamp(System.currentTimeMillis()));
            board.setViewCount(0);
            board.setLikeCount(0);
            board.setHashtags(hashtags);
            board.setJobCategories(jobs);

            // 게시글 삽입
            int result = boardService.createPost(board);
            if(result > 0) {
                response.put("status", "success");
                response.put("postId", board.getPostingNo());
            } else {
                response.put("status", "fail");
                response.put("message", "게시글 등록에 실패했습니다.");
            }
        } catch(IOException e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "이미지 업로드 중 오류가 발생했습니다.");
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }

        return response;
    }

    // 특정 게시글의 댓글 조회
    @GetMapping("/api/replies")
    @ResponseBody
    public Map<String, Object> getReplies(@RequestParam("postId") int postId) {
        List<Reply> replies = boardService.getReplies(postId);
        Map<String, Object> response = new HashMap<>();
        response.put("replies", replies);
        return response;
    }

    // 댓글 추가
    @PostMapping("/api/replies")
    @ResponseBody
    public Map<String, Object> addReply(@RequestBody Reply reply, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 현재 사용자 정보 가져오기
            // 실제 사용자 조회 로직으로 대체 필요
            Map<String, Object> currentUser = (Map<String, Object>) session.getAttribute("currentUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            int userNo = (int) currentUser.get("userNo");
            reply.setUserNo(userNo);

            int result = boardService.addReply(reply);
            if(result > 0) {
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "댓글 등록에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }

    // 댓글 삭제
    @DeleteMapping("/api/replies/{replyNo}")
    @ResponseBody
    public Map<String, Object> deleteReply(@PathVariable("replyNo") int replyNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 현재 사용자 정보 가져오기
            // 권한 검증 로직 필요
            Map<String, Object> currentUser = (Map<String, Object>) session.getAttribute("currentUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 댓글 소유자 확인
            Reply existingReply = boardService.getReplyById(replyNo);
            if(existingReply == null || existingReply.getUserNo() != (int) currentUser.get("userNo")) {
                response.put("status", "fail");
                response.put("message", "권한이 없습니다.");
                return response;
            }

            int result = boardService.deleteReply(replyNo);
            if(result > 0) {
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "댓글 삭제에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }
    
	
		
		 // 임시 로그인 엔드포인트 (개발용)
		 @GetMapping("/testLogin")
		 public String testLogin(HttpSession session) {
		     Map<String, Object> mockUser = new HashMap<>();
		     mockUser.put("userNo", 1); // 실제 사용자 번호로 변경
		     mockUser.put("userName", "테스트 사용자");
		     session.setAttribute("currentUser", mockUser);
		     return "redirect:/board/communityPost"; // 로그인 후 리다이렉트할 페이지
		 }
  
    // 채용공고목록 맵핑
    @GetMapping("/listOfJobOpening")
    public String showjobOpeningList() {
        return "board/listOfJobOpening"; // listOfJobOpening.jsp
    }
    
}
