package com.cs.workdream.resume.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
// import org.springframework.web.bind.annotation.PostMapping; // 이미 사용 중
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.SelfIntro;
import com.cs.workdream.resume.service.ResumeService;
import com.cs.workdream.resume.service.SelfIntroService;

@Controller
@RequestMapping("/resume")
public class ResumeController {

	private final ResumeService resumeService;

    @Autowired
    private SelfIntroService selfIntroService;
    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }
    
    @GetMapping("/enrollresume")
    public String showEnrollResumePage(org.springframework.ui.Model model, HttpSession session) {
        Resume resume = new Resume();
        resume.getBasicInfo().add(new com.cs.workdream.resume.model.vo.BasicInfo());
        resume.getAcademicAbilities().add(new com.cs.workdream.resume.model.vo.AcademicAbility());
        resume.getSkills().add(new com.cs.workdream.resume.model.vo.Skill());
        resume.getExperiences().add(new com.cs.workdream.resume.model.vo.Experience());
        resume.getQualifications().add(new com.cs.workdream.resume.model.vo.Qualification());
        resume.getCareers().add(new com.cs.workdream.resume.model.vo.Career());
        resume.setEmploymentPreferences(new com.cs.workdream.resume.model.vo.EmploymentPreferences());

        model.addAttribute("resume", resume);
        return "resume/enrollresume"; // JSP 경로
    }

    @GetMapping("/resumeDashboard")
    public String resumeDashboard() {
        return "resume/resumeDashboard";
    }
    
    @GetMapping("/selfIntro")
    public String showSelfIntroForm() {
        return "resume/selfIntro";
    }

    @GetMapping("/editIntro")
    public String showeditSelfIntro() {
        return "resume/editSelfIntro";
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

    // 수정된 내용 저장
    @PostMapping("/updateIntro")
    public String updateIntro(@ModelAttribute SelfIntro intro) {
        selfIntroService.updateSelfIntro(intro);
        return "redirect:/selfIntroDashboard"; // 수정 후 목록 페이지로 리다이렉트
    }

    
}
