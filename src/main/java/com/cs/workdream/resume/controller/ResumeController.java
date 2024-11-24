package com.cs.workdream.resume.controller;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;
import com.cs.workdream.member.model.vo.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

    @Autowired
    private ResumeService resumeService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                try {
                    if (text != null && !text.isEmpty()) {
                        setValue(new Date(dateFormat.parse(text).getTime()));
                    } else {
                        setValue(null);
                    }
                } catch (ParseException e) {
                    logger.error("Invalid date format: {}", text);
                    setValue(null);
                }
            }

            @Override
            public String getAsText() {
                Date value = (Date) getValue();
                return (value != null) ? dateFormat.format(value) : "";
            }
        });
    }

    @PostMapping("/insert.re")
    public String insertResume(@ModelAttribute Resume resume,
                               @RequestParam("userPicFile") MultipartFile userPicFile,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {

        // 세션에서 personNo 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login?error=sessionExpired";
        }

        // personNo 설정
        resume.setPersonNo(loginUser.getPersonNo());
        logger.info("설정된 personNo: {}", resume.getPersonNo());

        // 이력서 저장
        boolean isSaved = resumeService.saveResume(resume, userPicFile);
        if (isSaved) {
            redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 등록되었습니다.");
            return "redirect:/resume/resumeDashboard";
        } else {
            redirectAttributes.addFlashAttribute("message", "이력서 등록에 실패했습니다.");
            return "redirect:/resume/enrollresume";
        }
    }
    
    @GetMapping("/enrollresume")
    public String enrollResume() {
        return "resume/enrollresume"; // 해당 JSP 파일의 경로
    }
    
    @GetMapping("/previewresume")
    public String previewResume() {
        return "resume/previewresume"; // 해당 JSP 파일의 경로
    }
    
    @GetMapping("/resumeDashboard")
    public String resumeDashboard(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        // 세션에서 로그인 사용자 정보 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login?error=sessionExpired";
        }

        int personNo = loginUser.getPersonNo();
        logger.info("현재 사용자 personNo: {}", personNo);

        // 이력서 목록 조회
        List<Resume> resumeList = resumeService.getResumesByPersonNo(personNo);
        model.addAttribute("resumeList", resumeList);
        logger.info("조회된 이력서 개수: {}", resumeList.size());
        for (Resume resume : resumeList) {
            logger.info("Resume Title: {}", resume.getResumeTitle());
            logger.info("Create Date: {}", resume.getCreateDate());
            logger.info("Modified Date: {}", resume.getModifiedDate());
        }

        return "resume/resumeDashboard"; // JSP 파일의 경로
    }
    
    /**
     * 학력 수준에 따라 관련 없는 필드들을 null로 설정하는 메서드
     * @param resume 이력서 객체
     */
    private void setNullFieldsBasedOnEducationLevel(Resume resume) {
        String educationLevel = resume.getEducationLevel();
        if (educationLevel == null) {
            // 학력 수준이 선택되지 않은 경우 모든 학력 필드 null 처리
            setAllEducationFieldsToNull(resume);
            return;
        }

        switch (educationLevel) {
            case "element":
                // 초등학교 선택 시 중학교, 고등학교, 대학교 관련 필드 null 처리
                resume.setAcademicName_mi(null);
                resume.setGraduationStatus_mi(null);
                resume.setEnterDate_mi(null);
                resume.setGraduationDate_mi(null);
                resume.setLocation_mi(null);
                resume.setExamPassed_mi(null);

                resume.setAcademicName_hi(null);
                resume.setGraduationStatus_hi(null);
                resume.setEnterDate_hi(null);
                resume.setGraduationDate_hi(null);
                resume.setLocation_hi(null);
                resume.setExamPassed_hi(null);

                resume.setAcademicName_col(null);
                resume.setMajorName_col(null);
                resume.setDegree_col(null);
                resume.setGraduationStatus_col(null);
                resume.setEnterDate_col(null);
                resume.setGraduationDate_col(null);
                resume.setLocation_col(null);
                break;
            case "middle":
                // 중학교 선택 시 초등학교, 고등학교, 대학교 관련 필드 null 처리
                resume.setAcademicName_el(null);
                resume.setGraduationStatus_el(null);
                resume.setEnterDate_el(null);
                resume.setGraduationDate_el(null);
                resume.setLocation_el(null);
                resume.setExamPassed_el(null);

                resume.setAcademicName_hi(null);
                resume.setGraduationStatus_hi(null);
                resume.setEnterDate_hi(null);
                resume.setGraduationDate_hi(null);
                resume.setLocation_hi(null);
                resume.setExamPassed_hi(null);

                resume.setAcademicName_col(null);
                resume.setMajorName_col(null);
                resume.setDegree_col(null);
                resume.setGraduationStatus_col(null);
                resume.setEnterDate_col(null);
                resume.setGraduationDate_col(null);
                resume.setLocation_col(null);
                break;
            case "high":
                // 고등학교 선택 시 초등학교, 중학교, 대학교 관련 필드 null 처리
                resume.setAcademicName_el(null);
                resume.setGraduationStatus_el(null);
                resume.setEnterDate_el(null);
                resume.setGraduationDate_el(null);
                resume.setLocation_el(null);
                resume.setExamPassed_el(null);

                resume.setAcademicName_mi(null);
                resume.setGraduationStatus_mi(null);
                resume.setEnterDate_mi(null);
                resume.setGraduationDate_mi(null);
                resume.setLocation_mi(null);
                resume.setExamPassed_mi(null);

                resume.setAcademicName_col(null);
                resume.setMajorName_col(null);
                resume.setDegree_col(null);
                resume.setGraduationStatus_col(null);
                resume.setEnterDate_col(null);
                resume.setGraduationDate_col(null);
                resume.setLocation_col(null);
                break;
            case "college":
                // 대학교 선택 시 초등학교, 중학교, 고등학교 관련 필드 null 처리
                resume.setAcademicName_el(null);
                resume.setGraduationStatus_el(null);
                resume.setEnterDate_el(null);
                resume.setGraduationDate_el(null);
                resume.setLocation_el(null);
                resume.setExamPassed_el(null);

                resume.setAcademicName_mi(null);
                resume.setGraduationStatus_mi(null);
                resume.setEnterDate_mi(null);
                resume.setGraduationDate_mi(null);
                resume.setLocation_mi(null);
                resume.setExamPassed_mi(null);

                resume.setAcademicName_hi(null);
                resume.setGraduationStatus_hi(null);
                resume.setEnterDate_hi(null);
                resume.setGraduationDate_hi(null);
                resume.setLocation_hi(null);
                resume.setExamPassed_hi(null);
                break;
            default:
                // 학력 수준이 알 수 없는 경우 모든 학력 필드 null 처리
                setAllEducationFieldsToNull(resume);
                break;
        }
    }

    /**
     * 모든 학력 관련 필드를 null로 설정하는 메서드
     * @param resume 이력서 객체
     */
    private void setAllEducationFieldsToNull(Resume resume) {
        resume.setAcademicName_el(null);
        resume.setGraduationStatus_el(null);
        resume.setEnterDate_el(null);
        resume.setGraduationDate_el(null);
        resume.setLocation_el(null);
        resume.setExamPassed_el(null);

        resume.setAcademicName_mi(null);
        resume.setGraduationStatus_mi(null);
        resume.setEnterDate_mi(null);
        resume.setGraduationDate_mi(null);
        resume.setLocation_mi(null);
        resume.setExamPassed_mi(null);

        resume.setAcademicName_hi(null);
        resume.setGraduationStatus_hi(null);
        resume.setEnterDate_hi(null);
        resume.setGraduationDate_hi(null);
        resume.setLocation_hi(null);
        resume.setExamPassed_hi(null);

        resume.setAcademicName_col(null);
        resume.setMajorName_col(null);
        resume.setDegree_col(null);
        resume.setGraduationStatus_col(null);
        resume.setEnterDate_col(null);
        resume.setGraduationDate_col(null);
        resume.setLocation_col(null);
    }

    @GetMapping("/editResume")
    public String editResume(@RequestParam("id") int resumeNo, Model model) {
        // 이력서 정보 조회
        Resume resume = resumeService.getResumeById(resumeNo);
        if (resume == null) {
            return "redirect:/resumeDashboard?error=notFound";
        }
        model.addAttribute("resume", resume);
        return "resume/editResume"; // 수정 페이지로 이동
    }
    
    @PostMapping("/updateResume")
    public String updateResume(@ModelAttribute Resume resume) {
        // 이력서 수정 서비스 호출
        int result = resumeService.updateResume(resume);
        if (result > 0) {
            return "redirect:/resumeDashboard?success=update";
        } else {
            return "redirect:/resumeDashboard?error=updateFailed";
        }
    }
    
    @PostMapping("/deleteResume")
    public String deleteResume(@RequestParam("id") int resumeNo, RedirectAttributes redirectAttributes) {
        try {
            logger.info("ResumeController - 삭제하려는 resumeNo: {}", resumeNo);
            int result = resumeService.deleteResumeById(resumeNo);

            if (result > 0) {
                redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 삭제되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "이력서 삭제에 실패했습니다.");
            }
            return "redirect:/resume/resumeDashboard";
        } catch (Exception e) {
            logger.error("ResumeController - 이력서 삭제 중 오류: ", e);
            redirectAttributes.addFlashAttribute("error", "이력서 삭제 중 오류가 발생했습니다.");
            return "redirect:/resume/resumeDashboard";
        }
    }

}
