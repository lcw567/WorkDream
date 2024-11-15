package com.cs.workdream.resume.controller;

import javax.servlet.http.HttpSession;

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
public class ResumeController {
	
    private final ResumeService resumeService;

    @Autowired
    public ResumeController(ResumeService resumeService) {
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
    
    @RequestMapping("insert.re")
    public ModelAndView enrollResume(@ModelAttribute Resume resume, ModelAndView mv) {
        // 테스트를 위해 임시로 person_no를 설정
        Integer testPersonNo = 1; // 실제 데이터베이스에 존재하는 person_no로 설정
        resume.setPerson_no(testPersonNo); // person_no 설정
        resume.setResumetitle("테스트용 제목"); // title 수동 설정

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
