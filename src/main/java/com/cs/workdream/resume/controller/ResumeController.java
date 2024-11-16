package com.cs.workdream.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping; // POST 요청을 처리하기 위해 사용
import org.springframework.web.bind.annotation.GetMapping;
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
    
    // 기타 GET 요청 핸들러는 그대로 유지
    @GetMapping("/selfIntroDashboard")
    public String showSelfIntroDashboard() {
        return "resume/selfIntroDashboard"; // selfIntroDashboard.jsp
    }
    
    @GetMapping("/selfIntro")
    public String selfIntro() {
        return "resume/selfIntro"; // selfIntro.jsp
    }
    
    /**
     * 이력서 등록 페이지를 보여주는 메서드
     * 
     * @param model   Model 객체
     * @param session HttpSession 객체
     * @return 이력서 등록 JSP 페이지
     */
    @GetMapping("/enrollresume")
    public String showEnrollResumePage(org.springframework.ui.Model model, HttpSession session) {
        Resume resume = new Resume();
        // 기본 정보 리스트에 빈 BasicInfo 객체 추가 (폼 바인딩을 위해)
        resume.getBasicInfo().add(new com.cs.workdream.resume.model.vo.BasicInfo());
        // 학력 정보 리스트에 빈 AcademicAbility 객체 추가
        resume.getAcademicAbilities().add(new com.cs.workdream.resume.model.vo.AcademicAbility());
        // 스킬 리스트에 빈 Skill 객체 추가
        resume.getSkills().add(new com.cs.workdream.resume.model.vo.Skill());
        // 경험 리스트에 빈 Experience 객체 추가
        resume.getExperiences().add(new com.cs.workdream.resume.model.vo.Experience());
        // 자격증 리스트에 빈 Qualification 객체 추가
        resume.getQualification().add(new com.cs.workdream.resume.model.vo.Qualification());
        // 경력 리스트에 빈 Career 객체 추가
        resume.getCareers().add(new com.cs.workdream.resume.model.vo.Career());
        // 고용 선호사항 객체 추가
        resume.setEmploymentPreference(new com.cs.workdream.resume.model.vo.EmploymentPreferences());
        
        model.addAttribute("resume", resume);
        return "resume/enrollresume"; // 이력서 등록 JSP 경로
    }
    
    /**
     * 이력서를 등록하는 메서드
     * 
     * @param resume Resume 객체 (폼 데이터 바인딩됨)
     * @param mv     ModelAndView 객체
     * @param session HttpSession 객체 (로그인된 사용자 정보)
     * @return 등록 성공 시 대시보드로 리다이렉트, 실패 시 에러 페이지로 이동
     */
    @PostMapping("/insert.re")
    public ModelAndView enrollResume(@ModelAttribute Resume resume, ModelAndView mv, HttpSession session) {
        // 로그인된 사용자의 person_no를 세션에서 가져오기
        Integer personNo = (Integer) session.getAttribute("person_no");
        
        if (personNo == null) {
            // 로그인되지 않은 경우 처리
            mv.addObject("errorMsg", "로그인이 필요합니다.");
            mv.setViewName("member/login");
            return mv;
        }

        // Resume 객체에 person_no 설정
        resume.setPersonNo(personNo); // person_no 설정

        // Resume 객체에 포함된 모든 리스트와 객체의 person_no도 설정
        // 이는 서비스 계층 또는 DAO 계층에서 처리할 수도 있지만, 여기서는 컨트롤러에서 간단히 처리
        if (resume.getBasicInfo() != null) {
            for (com.cs.workdream.resume.model.vo.BasicInfo basicInfo : resume.getBasicInfo()) {
                basicInfo.setPersonNo(personNo);
                basicInfo.setResumeNo(resume.getResumeNo()); // resume_no는 DAO에서 설정 후 처리해야 할 수 있음
            }
        }
        
        if (resume.getAcademicAbilities() != null) {
            for (com.cs.workdream.resume.model.vo.AcademicAbility academicAbility : resume.getAcademicAbilities()) {
                academicAbility.setPersonNo(personNo);
                academicAbility.setResumeNo(resume.getResumeNo());
            }
        }
        
        if (resume.getQualification() != null) {
            for (com.cs.workdream.resume.model.vo.Qualification qualification : resume.getQualification()) {
                qualification.setPersonNo(personNo);
                qualification.setResumeNo(resume.getResumeNo());
            }
        }
        
        if (resume.getExperiences() != null) {
            for (com.cs.workdream.resume.model.vo.Experience experience : resume.getExperiences()) {
                experience.setPersonNo(personNo);
                experience.setResumeNo(resume.getResumeNo());
            }
        }
        
        if (resume.getSkills() != null) {
            for (com.cs.workdream.resume.model.vo.Skill skill : resume.getSkills()) {
                skill.setPerson_no(personNo);
                skill.setResume_no(resume.getResumeNo());
            }
        }
        
        if (resume.getCareers() != null) {
            for (com.cs.workdream.resume.model.vo.Career career : resume.getCareers()) {
                career.setPersonNo(personNo);
                career.setResumeNo(resume.getResumeNo());
            }
        }
        
        if (resume.getEmploymentPreference() != null) {
            resume.getEmploymentPreference().setPersonNo(personNo);
            resume.getEmploymentPreference().setResumeNo(resume.getResumeNo());
        }
        
        // 이력서 저장 서비스 호출
        int result = resumeService.saveResume(resume);
        
        if (result > 0) {
            // 등록 성공 시 대시보드로 이동
            mv.setViewName("redirect:/resume/resumeDashboard");
        } else {
            // 등록 실패 시 에러 페이지로 이동
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
