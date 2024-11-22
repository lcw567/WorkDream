package com.cs.workdream.resume.controller;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

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
    public String showEnrollResumePage(Model model, HttpSession session) {
        Resume resume = new Resume();
        model.addAttribute("resume", resume);
        return "resume/enrollresume"; // JSP 경로
    }

    @PostMapping("/insert.re")
    public String insertResume(@ModelAttribute Resume resume,
                               @RequestParam("userPicFile") MultipartFile userPicFile,
                               RedirectAttributes redirectAttributes) {
        logger.info("이력서 등록 시도: {}", resume);
        boolean isSaved = resumeService.saveResume(resume, userPicFile);
        if (isSaved) {
            redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 등록되었습니다.");
            return "redirect:/resume/resumeDashboard";
        } else {
            redirectAttributes.addFlashAttribute("message", "이력서 등록에 실패했습니다.");
            return "redirect:/resume/enrollresume";
        }
    }

    /**
     * @InitBinder를 사용하여 LocalDate 형식의 필드를 올바르게 변환하도록 설정
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // LocalDate 변환기 등록
        binder.registerCustomEditor(LocalDate.class, "userBirth", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                try {
                    if (text != null && !text.isEmpty()) {
                        setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    } else {
                        setValue(null);
                    }
                } catch (DateTimeParseException e) {
                    logger.error("Invalid date format for userBirth: {}", text);
                    setValue(null);
                }
            }

            @Override
            public String getAsText() {
                LocalDate value = (LocalDate) getValue();
                return (value != null) ? value.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : "";
            }
        });
    }
}
