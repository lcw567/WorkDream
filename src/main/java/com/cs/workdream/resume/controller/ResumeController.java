package com.cs.workdream.resume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

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
    public String showEditSelfIntro(@RequestParam("id") Integer selfintroNo, Model model) {
        SelfIntro selfIntro = selfIntroService.getSelfIntroById(selfintroNo);
        model.addAttribute("selfIntro", selfIntro);
        return "resume/editselfIntro"; // JSP 파일 이름과 경로 확인
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
    public Object deleteSelfIntro(@RequestParam("id") int selfintroNo, HttpServletRequest request) {
        logger.info("Controller: Deleting SelfIntro with ID: {}", selfintroNo);
        int result = selfIntroService.deleteSelfIntro(selfintroNo);
        logger.info("Controller delete result: {}", result);

        // AJAX 요청인지 확인
        String requestedWith = request.getHeader("X-Requested-With");
        logger.info("Requested-With header: {}", requestedWith);

        if ("XMLHttpRequest".equals(requestedWith)) {
            if (result > 0) {
                logger.info("AJAX request: Deletion successful.");
                return ResponseEntity.ok("success");
            } else {
                logger.warn("AJAX request: Deletion failed.");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error");
            }
        } else {
            if (result > 0) {
                logger.info("Non-AJAX request: Deletion successful. Redirecting to selfIntroDashboard.");
                return "redirect:/resume/selfIntroDashboard";
            } else {
                logger.warn("Non-AJAX request: Deletion failed. Redirecting to errorPage.");
                return "redirect:/errorPage";
            }
        }
    }
    
    @PostMapping("/update_intro")
    public String updateSelfIntro(@ModelAttribute SelfIntro selfIntro, Model model) {
        logger.info("Updating SelfIntro: {}", selfIntro);
        if (selfIntro.getSelfintroNo() == null) {
            logger.error("selfintroNo is null. Update failed.");
            return "redirect:/errorPage"; // 적절한 에러 페이지로 리다이렉트
        }
        selfIntroService.updateSelfIntro(selfIntro);
        logger.info("SelfIntro updated successfully for id: {}", selfIntro.getSelfintroNo());
        return "redirect:/resume/selfIntroDashboard"; // 리다이렉션할 URL 확인
    }

}
