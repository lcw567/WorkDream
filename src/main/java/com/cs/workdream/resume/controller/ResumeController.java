package com.cs.workdream.resume.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
        selfIntro.setDeleted("N");

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

        // 최신 데이터를 DB에서 가져오기
        String userId = loginUser.getUserId();
        List<SelfIntro> selfIntroList = selfIntroService.selectSelfIntroList(userId);

        // 데이터를 클라이언트로 전달
        model.addAttribute("selfIntroList", selfIntroList);

        return "resume/selfIntroDashboard";
    }

    
    @RequestMapping(value = "/deleteIntro", method = RequestMethod.POST)
    public String deleteSelfIntro(@RequestParam("id") int selfintroNo, HttpSession session) {
        System.out.println("Controller: Deleting SelfIntro with ID: " + selfintroNo); // 로그 추가
        int result = selfIntroService.deleteSelfIntro(selfintroNo);
        System.out.println("Controller delete result: " + result); // 로그 추가

        if (result > 0) {
            return "redirect:/resume/selfIntroDashboard";
        } else {
            return "redirect:/errorPage";
        }
    }
    
 // ResumeController.java

    @GetMapping("/editIntro")
    public String showEditIntroForm(@RequestParam("id") int selfintroNo, HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login?error=sessionExpired";
        }

        SelfIntro selfIntro = selfIntroService.getSelfIntroById(selfintroNo);
        if (selfIntro == null || !selfIntro.getUserId().equals(loginUser.getUserId())) {
            return "redirect:/errorPage";
        }

        model.addAttribute("selfIntro", selfIntro);
        return "resume/editSelfIntro";
    }
    
 // ResumeController.java

    @PostMapping("/updateIntro")
    public String updateSelfIntro(@RequestParam("selfintroNo") int selfintroNo,
                                  @RequestParam("intro_name") String introTitle,
                                  @RequestParam("intro_content") String introContent,
                                  HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login?error=sessionExpired";
        }

        SelfIntro selfIntro = new SelfIntro();
        selfIntro.setSelfintroNo(selfintroNo);
        selfIntro.setUserId(loginUser.getUserId());
        selfIntro.setIntroTitle(introTitle);
        selfIntro.setIntroContent(introContent);
        selfIntro.setModifiedDate(new Date(System.currentTimeMillis()));

        int result = selfIntroService.updateSelfIntro(selfIntro);
        if (result > 0) {
            return "redirect:/resume/selfIntroDashboard";
        } else {
            return "redirect:/errorPage";
        }
    }




}
