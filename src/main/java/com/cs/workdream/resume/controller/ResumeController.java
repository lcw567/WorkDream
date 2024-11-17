package com.cs.workdream.resume.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    private final ResumeService resumeService;

    @Autowired
    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @GetMapping("/enrollresume")
    public String showEnrollResumePage(org.springframework.ui.Model model, HttpSession session) {
        Resume resume = new Resume();

        // 기본 데이터 추가
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

    @PostMapping("/insert.re")
    public ModelAndView enrollResume(@ModelAttribute Resume resume, ModelAndView mv, HttpSession session) {
        Integer personNo = (Integer) session.getAttribute("person_no");
        if (personNo == null) {
            mv.addObject("errorMsg", "로그인이 필요합니다.");
            mv.setViewName("member/login");
            return mv;
        }
        resume.setPersonNo(personNo);
        resumeService.saveResume(resume);
        mv.setViewName("redirect:/resume/resumeDashboard");
        return mv;
    }


    @GetMapping("/resumeDashboard")
    public String resumeDashboard() {
        return "resume/resumeDashboard";
    }

    @GetMapping("/testLogin")
    public String testLogin(HttpSession session) {
        session.setAttribute("person_no", 2);
        logger.info("테스트 로그인 완료. person_no=2");
        return "redirect:/resume/enrollresume";
    }
}
