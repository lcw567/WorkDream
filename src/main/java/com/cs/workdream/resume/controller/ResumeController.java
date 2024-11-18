package com.cs.workdream.resume.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.resume.model.vo.SelfIntro;
import com.cs.workdream.resume.service.SelfIntroService;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private SelfIntroService selfIntroService;

    @GetMapping("/selfIntro")
    public String showSelfIntroForm() {
        return "resume/selfIntro";
    }

    @RequestMapping(value = "/insert_intro", method = RequestMethod.POST)
    public String insertSelfIntro(@RequestParam("intro_name") String introTitle,
                                  @RequestParam("intro_content") String introContent,
                                  HttpSession session) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login?error=sessionExpired";
        }

        SelfIntro selfIntro = new SelfIntro();
        selfIntro.setUserId(loginUser.getUserId());
        selfIntro.setResumeNo((Integer) session.getAttribute("resumeNo"));
        selfIntro.setIntroTitle(introTitle);
        selfIntro.setIntroContent(introContent);
        selfIntro.setDeleted('N');

        try {
            int result = selfIntroService.insertSelfIntro(selfIntro);
            if (result > 0) {
                return "redirect:/resume/selfIntroDashboard";
            } else {
                return "redirect:/errorPage";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/errorPage";
        }
    }

    @RequestMapping(value = "/selfIntroDashboard", method = RequestMethod.GET)
    public String selfIntroDashboard(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login?error=sessionExpired";
        }

        String userId = loginUser.getUserId();
        List<SelfIntro> selfIntroList = selfIntroService.selectSelfIntroList(userId);
        model.addAttribute("selfIntroList", selfIntroList);

        return "resume/selfIntroDashboard";
    }
    
    @RequestMapping(value = "/deleteIntro", method = RequestMethod.POST)
    public String deleteSelfIntro(@RequestParam("id") int selfIntroId, HttpSession session) {
        // 세션에서 로그인 사용자 확인
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login?error=sessionExpired";
        }

        // 서비스 계층에 삭제 요청
        try {
            int result = selfIntroService.deleteSelfIntro(selfIntroId);
            if (result > 0) {
                // 성공적으로 삭제되었으면 대시보드로 리다이렉트
                return "redirect:/resume/selfIntroDashboard";
            } else {
                // 삭제 실패 시 오류 페이지로 이동
                return "redirect:/errorPage";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/errorPage";
        }
    }

}
