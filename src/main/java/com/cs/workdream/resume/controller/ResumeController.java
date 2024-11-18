package com.cs.workdream.resume.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.SelfIntro;
import com.cs.workdream.resume.service.ResumeService;
import com.cs.workdream.resume.service.SelfIntroService;

@Controller
@RequestMapping("/resume")
public class ResumeController {

	@Autowired
    private SelfIntroService selfIntroService;
	
	@GetMapping("/selfIntro")
    public String showSelfIntroForm() {
        return "resume/selfIntro"; // 뷰의 이름을 반환 (예: selfIntroForm.jsp)
    }

    @RequestMapping(value = "/insert_intro", method = RequestMethod.POST)
    public String insertSelfIntro(@RequestParam("intro_name") String introTitle,
                                  @RequestParam("intro_content") String introContent,
                                  HttpSession session) {

        // 세션에서 사용자 ID, 이력서 번호, 인물 번호를 가져옵니다.
        String userId = (String) session.getAttribute("loginUser");
        Integer resumeNo = (Integer) session.getAttribute("resumeNo");
        Integer personNo = (Integer) session.getAttribute("personNo");

        // SelfIntro 객체 생성 및 데이터 설정
        SelfIntro selfIntro = new SelfIntro();
        selfIntro.setUserId(userId);
        selfIntro.setResumeNo(resumeNo);
        selfIntro.setPersonNo(personNo);
        selfIntro.setIntroTitle(introTitle);
        selfIntro.setIntroContent(introContent);
        selfIntro.setDeleted('N');

        // 서비스 계층에 데이터 저장 요청
        int result = selfIntroService.insertSelfIntro(selfIntro);

        if (result > 0) {
            // 성공 시 리다이렉트
            return "redirect:/resume/selfIntroDashboard";
        } else {
            // 실패 시 에러 페이지로 이동
            return "redirect:/errorPage";
        }
    }
    
    @GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "resume/selfIntroDashboard"; // 뷰의 이름을 반환 (예: selfIntroForm.jsp)
    }
}