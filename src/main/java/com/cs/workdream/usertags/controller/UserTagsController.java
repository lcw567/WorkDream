package com.cs.workdream.usertags.controller;

import com.cs.workdream.usertags.model.vo.UserTag;
import com.cs.workdream.usertags.service.UserTagsService;
import com.cs.workdream.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/usertags")
public class UserTagsController {

    @Autowired
    private UserTagsService userTagsService;

    /**
     * 사용자 마이페이지에 관심태그 로드
     * GET /usertags
     */
    @GetMapping
    public String showUserTagsPage(Model model, HttpSession session) {
        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        List<UserTag> userTags = userTagsService.getUserTags(currentUser.getUserNo());
        model.addAttribute("userTags", userTags);
        return "usertags/userTagsPage"; // userTagsPage.jsp
    }

    /**
     * 관심태그 추가
     * POST /usertags/add
     * Body: { "tagName": "태그이름" }
     */
    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addUserTag(@RequestBody Map<String, String> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            response.put("status", "fail");
            response.put("message", "로그인이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }

        String tagName = request.get("tagName");
        if(tagName == null || tagName.trim().isEmpty()) {
            response.put("status", "fail");
            response.put("message", "태그 이름이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        boolean success = userTagsService.addUserTag(currentUser.getUserNo(), tagName.trim());
        if(success) {
            response.put("status", "success");
            response.put("message", "태그가 추가되었습니다.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("status", "fail");
            response.put("message", "태그 추가에 실패했습니다. 중복되었거나 최대 20개를 초과했습니다.");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * 관심태그 삭제
     * DELETE /usertags/{tagId}
     */
    @DeleteMapping("/{tagId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteUserTag(@PathVariable("tagId") int tagId, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            response.put("status", "fail");
            response.put("message", "로그인이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }

        boolean success = userTagsService.removeUserTag(tagId, currentUser.getUserNo());
        if(success) {
            response.put("status", "success");
            response.put("message", "태그가 삭제되었습니다.");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("status", "fail");
            response.put("message", "태그 삭제에 실패했습니다. 해당 태그가 존재하지 않거나 권한이 없습니다.");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * 관심태그 목록 업데이트 (전체 교체)
     * POST /usertags/update
     * Body: { "tags": ["태그1", "태그2", ...] }
     */
    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateUserTags(@RequestBody Map<String, List<String>> request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            response.put("status", "fail");
            response.put("message", "로그인이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }

        List<String> newTags = request.get("tags");
        if(newTags == null) {
            response.put("status", "fail");
            response.put("message", "태그 목록이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        boolean success = userTagsService.updateUserTags(currentUser.getUserNo(), newTags);
        if(success) {
            // 업데이트 후 최신 태그 목록을 반환
            List<UserTag> updatedTags = userTagsService.getUserTags(currentUser.getUserNo());
            response.put("status", "success");
            response.put("message", "관심태그가 업데이트되었습니다.");
            response.put("userTags", updatedTags);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("status", "fail");
            response.put("message", "관심태그 업데이트에 실패했습니다. 태그 수를 확인해주세요.");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * 사용자 관심태그 조회 (REST API)
     * GET /usertags/api/userTags
     */
    @GetMapping("/api/userTags")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getUserTags(HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        Member currentUser = (Member) session.getAttribute("loginUser");
        if(currentUser == null) {
            response.put("status", "fail");
            response.put("message", "로그인이 필요합니다.");
            return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
        }

        List<UserTag> userTags = userTagsService.getUserTags(currentUser.getUserNo());
        response.put("status", "success");
        response.put("userTags", userTags);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    /**
     * 테스트용 POST 매핑
     * POST /usertags/test
     */
    @PostMapping("/test")
    @ResponseBody
    public ResponseEntity<String> testPost() {
        return new ResponseEntity<>("POST /usertags/test 성공", HttpStatus.OK);
    }
}
