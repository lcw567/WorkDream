package com.cs.workdream.resume.controller;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String insertResume(Resume resume, RedirectAttributes redirectAttributes) {
        // 이력서 데이터 저장 로직
        boolean isSaved = resumeService.saveResume(resume);

        if(isSaved) {
            // 성공적으로 저장되었을 때 대시보드로 리다이렉트
            return "redirect:/resume/resumeDashboard";
        } else {
            // 저장에 실패했을 경우 이전 페이지로 리다이렉트하거나 오류 페이지로 이동
            redirectAttributes.addFlashAttribute("error", "이력서 저장에 실패했습니다.");
            return "redirect:/resume/enrollResume"; // enrollResume.jsp 페이지로 이동
        }
    }
}
