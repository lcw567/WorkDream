package com.cs.workdream.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.board.model.vo.Board;
import com.cs.workdream.board.model.vo.Reply;
import com.cs.workdream.board.service.BoardService;
import com.cs.workdream.member.model.vo.Member;

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
        if(post != null && "Y".equals(post.getStatus())) { // getStatus() 메서드 존재 확인
            // 조회수 증가
            boardService.increaseViewCount(postId);

            // 모델에 게시글 추가
            model.addAttribute("post", post);

            // 현재 사용자 정보 (로그인 사용자 정보)
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser != null) {
                model.addAttribute("currentUser", currentUser);

                // 사용자가 이 게시글에 공감했는지 여부 판단 로직 추가 가능
                boolean userLikedPost = false; // 실제 공감 여부 판단 로직 구현 필요
                model.addAttribute("userLikedPost", userLikedPost);
            } else {
                model.addAttribute("userLikedPost", false);
            }

            return "board/communityView"; // communityView.jsp
        } else {
            model.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
            return "common/errorPage"; // 에러 페이지
        }
    }
    
    // 게시글 수정 페이지 표시
    @GetMapping("/editPost")
    public String showEditPost(@RequestParam("postId") int postId, Model model, HttpSession session) {
        // 게시글 조회
        Board post = boardService.getPostWithJobCategories(postId);
        if(post != null && "Y".equals(post.getStatus())) {
            // 현재 사용자 정보
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser != null && post.getUserNo() == currentUser.getUserNo()) {
                model.addAttribute("post", post);
                return "board/editPost"; // editPost.jsp
            } else {
                model.addAttribute("errorMsg", "게시글을 수정할 권한이 없습니다.");
                return "common/errorPage";
            }
        } else {
            model.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
            return "common/errorPage"; // 에러 페이지
        }
    }

    // 커뮤니티 게시판 목록 페이지 표시
    @GetMapping("/communityList")
    public String showCommunityList(@RequestParam(value="category", defaultValue="전체글") String category, Model model) {
        model.addAttribute("category", category);
        return "board/communityList"; // communityList.jsp
    }

    // 임시 로그인 엔드포인트 (개발용)
    @GetMapping("/testLogin")
    public String testLogin(HttpSession session) {
        Member mockUser = new Member();
        mockUser.setUserNo(1); // 실제 사용자 번호로 변경
        mockUser.setUserId("testuser123"); // userId 설정
        // 필요한 다른 필드도 설정
        session.setAttribute("loginUser", mockUser);
        return "redirect:/board/communityPost"; // 로그인 후 리다이렉트할 페이지
    }
    
    // 채용공고목록 맵핑
    @GetMapping("/listOfJobOpening")
    public String showJobOpeningList() {
        return "board/listOfJobOpening"; // listOfJobOpening.jsp
    }
    
    // -------------------
    // REST API 관련 메서드
    // -------------------

    // 게시글 수 조회 (REST API)
    @GetMapping("/api/postCount")
    @ResponseBody
    public Map<String, Object> getPostCount() {
        int count = boardService.countPosts("전체글");
        Map<String, Object> response = new HashMap<>();
        response.put("count", count);
        return response;
    }

    // 인기 게시글 조회 (REST API)
    @GetMapping("/api/popularPosts")
    @ResponseBody
    public Map<String, Object> getPopularPosts() {
        List<Board> posts = boardService.getPopularPosts();
        Map<String, Object> response = new HashMap<>();
        response.put("posts", posts);
        return response;
    }

    // 카테고리 및 필터에 따른 게시글 조회 (REST API)
    @GetMapping("/api/posts")
    @ResponseBody
    public Map<String, Object> getPosts(
            @RequestParam(value="category", defaultValue="전체글") String category,
            @RequestParam(value="filter", defaultValue="최신순") String filter,
            @RequestParam(value="jobFilter", required=false) String jobFilter,
            @RequestParam(value="offset", defaultValue="0") int offset,
            @RequestParam(value="limit", defaultValue="10") int limit) {

        List<Board> posts = boardService.getFilteredPosts(category, filter, jobFilter, offset, limit);
        int totalCount = boardService.countFilteredPosts(category, filter, jobFilter);

        Map<String, Object> response = new HashMap<>();
        response.put("posts", posts);
        response.put("totalCount", totalCount);
        return response;
    }

    // 새로운 게시글 생성 (REST API)
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
            // 현재 로그인한 사용자 정보 가져오기
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            int userNo = currentUser.getUserNo();
            String author = currentUser.getUserId(); // 필요에 따라 변경

            // 이미지 업로드 처리
            String imagePath = null;
            if(image != null && !image.isEmpty()) {
                // 고정된 업로드 디렉토리 설정
                String uploadDir = "C:/uploads/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // 디렉토리 생성
                }
                String originalFilename = image.getOriginalFilename();
                String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;
                File dest = new File(dir, uniqueFilename);
                image.transferTo(dest);
                imagePath = uniqueFilename; // 이미지 파일명만 저장

                // 업로드 경로 로그 출력
                System.out.println("Image uploaded to: " + dest.getAbsolutePath());
            }

            // Board 객체 생성
            Board board = new Board();
            board.setCategory(category);
            board.setTitle(title);
            board.setContent(content);
            board.setImagePath(imagePath);
            board.setAuthor(author);
            board.setUserNo(userNo);
            board.setCreatedTime(Timestamp.valueOf(LocalDateTime.now()));
            board.setViewCount(0);
            board.setLikeCount(0);
            board.setHashtags(hashtags);
            board.setJobCategories(jobs);
            board.setStatus("Y"); // 게시글 상태 설정

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
            response.put("message", "이미지 업로드 중 오류가 발생했습니다: " + e.getMessage());
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
        }

        return response;
    }

    // 게시글 삭제 API (REST API)
    @DeleteMapping("/api/posts/{postingNo}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deletePost(
            @PathVariable("postingNo") int postingNo,
            HttpSession session) { // 세션을 통해 사용자 정보 가져오기

        Map<String, Object> response = new HashMap<>();

        // 현재 사용자 정보 가져오기 (세션을 통해)
        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            response.put("status", "fail");
            response.put("message", "로그인이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }
        int currentUserNo = currentUser.getUserNo();

        // 게시글 정보 조회
        Board post = boardService.getPost(postingNo);
        if (post == null || !"Y".equals(post.getStatus())) {
            response.put("status", "fail");
            response.put("message", "게시글을 찾을 수 없습니다.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        // 작성자 확인
        if (post.getUserNo() != currentUserNo) {
            response.put("status", "fail");
            response.put("message", "본인의 게시글만 삭제할 수 있습니다.");
            return new ResponseEntity<>(response, HttpStatus.FORBIDDEN);
        }

        // 게시글 삭제
        int result = boardService.deletePost(postingNo);
        if (result > 0) {
            response.put("status", "success");
            response.put("message", "게시글이 삭제되었습니다.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("status", "fail");
            response.put("message", "게시글 삭제에 실패했습니다.");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 게시글 조회 API (REST API)
    @GetMapping("/api/posts/{postingNo}")
    @ResponseBody
    public ResponseEntity<Board> getPost(@PathVariable("postingNo") int postingNo) {
        Board post = boardService.getPostWithJobCategories(postingNo);
        if (post == null || !"Y".equals(post.getStatus())) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        // 조회수 증가
        boardService.increaseViewCount(postingNo);
        return new ResponseEntity<>(post, HttpStatus.OK);
    }

    // 게시글 수정 API (REST API)
    @PostMapping("/api/posts/{postingNo}/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updatePost(
            @PathVariable("postingNo") int postingNo,
            @RequestParam("category") String category,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam(value="image", required=false) MultipartFile image,
            @RequestParam(value="jobs", required=false) List<String> jobs,
            @RequestParam(value="hashtags", required=false) List<String> hashtags,
            HttpSession session) {

        Map<String, Object> response = new HashMap<>();

        try {
            // 현재 사용자 정보 가져오기 (로그인 사용자 정보)
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
            }
            int userNo = currentUser.getUserNo();

            // 게시글 정보 조회
            Board existingPost = boardService.getPostWithJobCategories(postingNo);
            if(existingPost == null || !"Y".equals(existingPost.getStatus())) {
                response.put("status", "fail");
                response.put("message", "게시글을 찾을 수 없습니다.");
                return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
            }

            // 작성자 확인
            if(existingPost.getUserNo() != userNo) {
                response.put("status", "fail");
                response.put("message", "본인의 게시글만 수정할 수 있습니다.");
                return new ResponseEntity<>(response, HttpStatus.FORBIDDEN);
            }

            // 이미지 업로드 처리 (기존 이미지 유지 또는 새로운 이미지로 대체)
            String imagePath = existingPost.getImagePath(); // 기존 이미지 경로 유지
            if(image != null && !image.isEmpty()) {
                // 고정된 업로드 디렉토리 설정
                String uploadDir = "C:/uploads/";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // 디렉토리 생성
                }
                String originalFilename = image.getOriginalFilename();
                String uniqueFilename = System.currentTimeMillis() + "_" + originalFilename;
                File dest = new File(dir, uniqueFilename);
                image.transferTo(dest);
                imagePath = uniqueFilename; // 이미지 파일명만 저장

                // 기존 이미지 파일 삭제 (선택 사항)
                if(existingPost.getImagePath() != null) {
                    File oldImage = new File("C:/uploads/" + existingPost.getImagePath());
                    if(oldImage.exists()) {
                        oldImage.delete();
                        System.out.println("Deleted old image: " + oldImage.getAbsolutePath());
                    }
                }

                // 업로드 경로 로그 출력
                System.out.println("Image updated to: " + dest.getAbsolutePath());
            }

            // Board 객체 생성 및 업데이트할 필드 설정
            Board board = new Board();
            board.setPostingNo(postingNo);
            board.setCategory(category);
            board.setTitle(title);
            board.setContent(content);
            board.setImagePath(imagePath);
            board.setUserNo(userNo);
            board.setJobCategories(jobs);
            board.setHashtags(hashtags);
            board.setStatus("Y"); // 상태 유지

            // 게시글 업데이트
            int result = boardService.updatePost(board);
            if(result > 0) {
                response.put("status", "success");
                response.put("message", "게시글이 수정되었습니다.");
                response.put("postId", postingNo);
                return new ResponseEntity<>(response, HttpStatus.OK);
            } else {
                response.put("status", "fail");
                response.put("message", "게시글 수정에 실패했습니다.");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            }
        } catch(IOException e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "이미지 업로드 중 오류가 발생했습니다: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다: " + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @PostMapping("/api/posts/{postingNo}/like")
    @ResponseBody
    public Map<String, Object> likePost(@PathVariable("postingNo") int postingNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 로그인 여부 확인
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 공감 로직
            boolean success = boardService.likePost(postingNo, currentUser.getUserNo());

            if(success) {
                response.put("status", "success");
                response.put("message", "공감했습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "이미 공감했거나, 공감에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }

    /* 게시글 공감 취소 API */
    @PostMapping("/api/posts/{postingNo}/unlike")
    @ResponseBody
    public Map<String, Object> unlikePost(@PathVariable("postingNo") int postingNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 로그인 여부 확인
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 공감 취소 로직
            boolean success = boardService.unlikePost(postingNo, currentUser.getUserNo());

            if(success) {
                response.put("status", "success");
                response.put("message", "공감을 취소했습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "공감을 하지 않았거나, 취소에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }

    /* 댓글 공감 API */
    @PostMapping("/api/replies/{replyNo}/like")
    @ResponseBody
    public Map<String, Object> likeReply(@PathVariable("replyNo") int replyNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 로그인 여부 확인
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 공감 로직
            boolean success = boardService.likeReply(replyNo, currentUser.getUserNo());

            if(success) {
                response.put("status", "success");
                response.put("message", "공감했습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "이미 공감했거나, 공감에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }

    /* 댓글 공감 취소 API */
    @PostMapping("/api/replies/{replyNo}/unlike")
    @ResponseBody
    public Map<String, Object> unlikeReply(@PathVariable("replyNo") int replyNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 로그인 여부 확인
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 공감 취소 로직
            boolean success = boardService.unlikeReply(replyNo, currentUser.getUserNo());

            if(success) {
                response.put("status", "success");
                response.put("message", "공감을 취소했습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "공감을 하지 않았거나, 취소에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }

    
    // 특정 게시글의 댓글 조회 (REST API)
    @GetMapping("/api/replies")
    @ResponseBody
    public Map<String, Object> getReplies(@RequestParam("postId") int postId) {
        List<Reply> replies = boardService.getReplies(postId);
        Map<String, Object> response = new HashMap<>();
        response.put("replies", replies);
        return response;
    }

    // 댓글 추가 (REST API)
    @PostMapping("/api/replies")
    @ResponseBody
    public Map<String, Object> addReply(@RequestBody Reply reply, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 현재 사용자 정보 가져오기
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            int userNo = currentUser.getUserNo();
            reply.setUserNo(userNo);
            // author 필드는 MyBatis selectReplies에서 JOIN을 통해 가져오기 때문에 서버에서 설정할 필요 없음

            int result = boardService.addReply(reply);
            if(result > 0) {
                response.put("status", "success");
            } else {
                response.put("status", "fail");
                response.put("message", "댓글 등록에 실패했습니다.");
            }
            return response;
        } catch(Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
            return response;
        }
    }   
    
    // 댓글 삭제 (REST API)
    @DeleteMapping("/api/replies/{replyNo}")
    @ResponseBody
    public Map<String, Object> deleteReply(@PathVariable("replyNo") int replyNo, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 현재 사용자 정보 가져오기
            Member currentUser = (Member) session.getAttribute("loginUser");
            if(currentUser == null) {
                response.put("status", "fail");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            // 댓글 소유자 확인
            Reply existingReply = boardService.getReplyById(replyNo);
            if(existingReply == null || existingReply.getUserNo() != currentUser.getUserNo()) {
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

    // 이미지 서빙을 위한 컨트롤러 메서드 추가
    @GetMapping("/uploads/{filename}")
    @ResponseBody
    public ResponseEntity<byte[]> serveImage(@PathVariable("filename") String filename) {
        try {
            // 고정된 업로드 디렉토리 설정
            String uploadDir = "C:/uploads/";
            File imageFile = new File(uploadDir, filename);
            if (!imageFile.exists()) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }

            byte[] imageBytes = Files.readAllBytes(imageFile.toPath());
            String mimeType = Files.probeContentType(imageFile.toPath());
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType(mimeType));
            return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        } catch(IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
