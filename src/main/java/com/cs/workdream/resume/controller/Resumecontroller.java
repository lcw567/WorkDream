package com.cs.workdream.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute; // 추가된 부분
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;

@Controller
@RequestMapping("/resume")
public class Resumecontroller {
	
    private final ResumeService resumeService;

    @Autowired
    public Resumecontroller(ResumeService resumeService) {
        this.resumeService = resumeService;
    }
	
    @GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "resume/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
	
    @GetMapping("/selfIntro")
    public String selfIntro() {
        return "resume/selfIntro"; // selfIntro.jsp
    }
	
    @GetMapping("/enrollresume")
    public String showEnrollResumePage() {
        return "resume/enrollresume"; // 이력서 등록 JSP 경로
    }
	 
    @PostMapping("/enrollresume")
    public ModelAndView enrollResume(@ModelAttribute Resume resume, ModelAndView mv) {
        int result = resumeService.saveResume(resume);

        if (result > 0) {
            mv.setViewName("redirect:/resume/resumeDashboard"); // 등록 성공 시 대시보드로 이동
        } else {
            mv.addObject("errorMsg", "이력서 등록에 실패했습니다.");
            mv.setViewName("common/errorPage");
        }

        return mv;
    }
	
    @GetMapping("/resumeDashboard")
    public String resumeDashboard() {
        return "resume/resumeDashboard";
    }
	
    @GetMapping("/previewresume")
    public String previewResume() {
        return "resume/previewresume";
    }
	
}
