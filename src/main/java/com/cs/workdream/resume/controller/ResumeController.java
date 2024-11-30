package com.cs.workdream.resume.controller;

import java.beans.PropertyEditorSupport;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
// 추가된 import
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;

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
                               @RequestParam("qualificationName[]") String[] qualificationNames,
                               @RequestParam("issuingAgency[]") String[] issuingAgencies,
                               @RequestParam("passStatus[]") String[] passStatuses,
                               @RequestParam("testDate_cer[]") String[] testDates,
                               @RequestParam("languageName[]") String[] languageNames,
                               @RequestParam("proficiencyLevel[]") String[] proficiencyLevels,
                               @RequestParam("languageType[]") String[] languageTypes,
                               @RequestParam("issueDate[]") String[] issueDates,
                               @RequestParam("awardName[]") String[] awardNames,
                               @RequestParam("organizer[]") String[] organizers,
                               @RequestParam("awardDate[]") String[] awardDates,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        // 세션에서 personNo 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login?error=sessionExpired";
        }
        resume.setPersonNo(loginUser.getPersonNo());
        
        switch (resume.getServiceStatus()) {
        case "unfulfilled":
            resume.setExemptionReason(null); // 미필일 경우 면제 사유는 null
            resume.setEnlistmentDate_ful(null);
            resume.setDischargeDate_ful(null);
            resume.setMilitaryBranch_ful(null);
            resume.setRank_ful(null);
            resume.setDischargeReason_ful(null);
            break;

        case "exempted":
            resume.setUnfulfilledReason(null); // 면제일 경우 미필 사유는 null
            resume.setEnlistmentDate_ful(null);
            resume.setDischargeDate_ful(null);
            resume.setMilitaryBranch_ful(null);
            resume.setRank_ful(null);
            resume.setDischargeReason_ful(null);
            break;

        case "fulfilled":
            resume.setUnfulfilledReason(null);
            resume.setExemptionReason(null);
            resume.setEnlistmentDate_ser(null);
            resume.setDischargeDate_ser(null);
            resume.setMilitaryBranch_ser(null);
            resume.setRank_ser(null);
            break;

        case "serving":
            resume.setUnfulfilledReason(null);
            resume.setExemptionReason(null);
            resume.setDischargeDate_ful(null);
            resume.setMilitaryBranch_ful(null);
            resume.setRank_ful(null);
            resume.setDischargeReason_ful(null);
            break;

        default:
            // 기타 군복무 대상 아님 등 상황에 맞춰 모든 군복무 관련 필드를 null로 처리
            resume.setUnfulfilledReason(null);
            resume.setExemptionReason(null);
            resume.setEnlistmentDate_ful(null);
            resume.setDischargeDate_ful(null);
            resume.setMilitaryBranch_ful(null);
            resume.setRank_ful(null);
            resume.setEnlistmentDate_ser(null);
            resume.setDischargeDate_ser(null);
            resume.setMilitaryBranch_ser(null);
            resume.setRank_ser(null);
            resume.setDischargeReason_ful(null);
            break;
    }

        // 자격증 배열 로그 출력
        logger.debug("qualificationNames.length: {}", (qualificationNames != null ? qualificationNames.length : "null"));
        logger.debug("issuingAgencies.length: {}", (issuingAgencies != null ? issuingAgencies.length : "null"));
        logger.debug("passStatuses.length: {}", (passStatuses != null ? passStatuses.length : "null"));
        logger.debug("testDates.length: {}", (testDates != null ? testDates.length : "null"));

        // 어학시험 배열 로그 출력
        logger.debug("languageNames.length: {}", (languageNames != null ? languageNames.length : "null"));
        logger.debug("proficiencyLevels.length: {}", (proficiencyLevels != null ? proficiencyLevels.length : "null"));
        logger.debug("languageTypes.length: {}", (languageTypes != null ? languageTypes.length : "null"));
        logger.debug("issueDatesLang.length: {}", (issueDates != null ? issueDates.length : "null"));

        // 수상내역 배열 로그 출력
        logger.debug("awardNames.length: {}", (awardNames != null ? awardNames.length : "null"));
        logger.debug("organizers.length: {}", (organizers != null ? organizers.length : "null"));
        logger.debug("awardDates.length: {}", (awardDates != null ? awardDates.length : "null"));

        // 자격증 리스트 생성
        List<Certificate> certificates = new ArrayList<>();
        if (qualificationNames != null && issuingAgencies != null && passStatuses != null && testDates != null) {
            int minLength = Math.min(Math.min(qualificationNames.length, issuingAgencies.length),
                                     Math.min(passStatuses.length, testDates.length));
            for (int i = 0; i < minLength; i++) {
                if (qualificationNames[i] != null && !qualificationNames[i].isEmpty()) {
                    Certificate cert = new Certificate();
                    cert.setQualificationName(qualificationNames[i]);
                    cert.setIssuingAgency(issuingAgencies[i]);
                    cert.setPassStatus(passStatuses[i]);
                    try {
                        if (testDates[i] != null && !testDates[i].isEmpty()) {
                            cert.setTestDate_cer(Date.valueOf(testDates[i]));
                        }
                    } catch (IllegalArgumentException e) {
                        logger.error("Invalid date format for testDate_cer: {}", testDates[i]);
                        cert.setTestDate_cer(null);
                    }
                    certificates.add(cert);
                }
            }
        } else {
            logger.warn("자격증 관련 배열들 중 하나 이상이 null입니다.");
        }
        resume.setCertificates(certificates);

        // 어학시험 리스트 생성
        List<LanguageTest> languageTests = new ArrayList<>();
        if (languageNames != null && proficiencyLevels != null && languageTypes != null && issueDates != null) {
            int minLength = Math.min(Math.min(languageNames.length, proficiencyLevels.length),
                                     Math.min(languageTypes.length, issueDates.length));
            for (int i = 0; i < minLength; i++) {
                if (languageNames[i] != null && !languageNames[i].isEmpty()) {
                    LanguageTest langTest = new LanguageTest();
                    langTest.setLanguageName(languageNames[i]);
                    langTest.setProficiencyLevel(proficiencyLevels[i]);
                    langTest.setLanguageType(languageTypes[i]);
                    try {
                        if (issueDates[i] != null && !issueDates[i].isEmpty()) {
                            langTest.setIssueDate(Date.valueOf(issueDates[i]));
                        }
                    } catch (IllegalArgumentException e) {
                        logger.error("Invalid date format for issueDate_language: {}", issueDates[i]);
                        langTest.setIssueDate(null);
                    }
                    languageTests.add(langTest);
                }
            }
        } else {
            logger.warn("어학시험 관련 배열들 중 하나 이상이 null입니다.");
        }
        resume.setLanguageTests(languageTests);

        // 수상내역 리스트 생성
        List<Award> awards = new ArrayList<>();
        if (awardNames != null && organizers != null && awardDates != null) {
            int minLength = Math.min(Math.min(awardNames.length, organizers.length), awardDates.length);
            for (int i = 0; i < minLength; i++) {
                if (awardNames[i] != null && !awardNames[i].isEmpty()) {
                    Award award = new Award();
                    award.setAwardName(awardNames[i]);
                    award.setOrganizer(organizers[i]);
                    try {
                        if (awardDates[i] != null && !awardDates[i].isEmpty()) {
                            award.setAwardDate(Date.valueOf(awardDates[i]));
                        }
                    } catch (IllegalArgumentException e) {
                        logger.error("Invalid date format for awardDate: {}", awardDates[i]);
                        award.setAwardDate(null);
                    }
                    awards.add(award);
                }
            }
        } else {
            logger.warn("수상내역 관련 배열들 중 하나 이상이 null입니다.");
        }
        resume.setAwards(awards);

        // 추가된 로깅: LanguageTest 리스트 확인
        logger.debug("LanguageTests to be saved: {}", languageTests);
        
        if (resume.getUnfulfilledReason() != null && !resume.getUnfulfilledReason().isEmpty()) {
            resume.setExemptionReason(null);
        } else if (resume.getExemptionReason() != null && !resume.getExemptionReason().isEmpty()) {
            resume.setUnfulfilledReason(null);
        }

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
    public String viewResume(@RequestParam("resumeNo") int resumeNo, Model model) {
        Resume resume = resumeService.getResumeByNo(resumeNo);
        model.addAttribute("resume", resume);
        return "resume/previewresume"; // JSP 파일의 경로
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
    public String editResume(@RequestParam(value = "id", required = false, defaultValue = "0") int resumeNo, Model model, RedirectAttributes redirectAttributes) {
        if (resumeNo == 0) {
            redirectAttributes.addFlashAttribute("error", "유효하지 않은 이력서 ID입니다.");
            return "redirect:/resume/resumeDashboard";
        }
        Resume resume = resumeService.getResumeById(resumeNo);
        if (resume == null) {
            redirectAttributes.addFlashAttribute("error", "이력서를 찾을 수 없습니다.");
            return "redirect:/resume/resumeDashboard";
        }
        model.addAttribute("resume", resume);
        return "resume/editResume";
    }


    @PostMapping("/update.re")
    public String updateResume(@ModelAttribute Resume resume,
                               @RequestParam(value = "qualificationName[]", required = false) String[] qualificationNames,
                               @RequestParam(value = "issuingAgency[]", required = false) String[] issuingAgencies,
                               @RequestParam(value = "passStatus[]", required = false) String[] passStatuses,
                               @RequestParam(value = "testDate_cer[]", required = false) String[] testDates,
                               @RequestParam(value = "languageName[]", required = false) String[] languageNames,
                               @RequestParam(value = "proficiencyLevel[]", required = false) String[] proficiencyLevels,
                               @RequestParam(value = "languageType[]", required = false) String[] languageTypes,
                               @RequestParam(value = "issueDate[]", required = false) String[] issueDate,
                               @RequestParam(value = "awardName[]", required = false) String[] awardNames,
                               @RequestParam(value = "organizer[]", required = false) String[] organizers,
                               @RequestParam(value = "awardDate[]", required = false) String[] awardDates,
                               @RequestParam(value = "deletedQualifications", required = false) String deletedQualifications, // 삭제된 자격증 ID
                               RedirectAttributes redirectAttributes) {
    	
    	logger.info("Received militaryStatus: " + resume.getServiceStatus());
    	logger.info("Received militaryBranchFul: " + resume.getMilitaryBranch_ful());
        try {
            // 이력서 업데이트
            boolean isUpdated = resumeService.updateResume(resume);
            if (!isUpdated) {
                redirectAttributes.addFlashAttribute("error", "이력서 업데이트에 실패했습니다.");
                return "redirect:/resume/editResume?id=" + resume.getResumeNo();
            }

            // 기존 자격증 삭제
            resumeService.deleteCertificatesByResumeNo(resume.getResumeNo());

            // 새로운 자격증 추가
            if (qualificationNames != null) {
                for (int i = 0; i < qualificationNames.length; i++) {
                    if (qualificationNames[i] != null && !qualificationNames[i].isEmpty()) {
                        Certificate cert = new Certificate();
                        cert.setResumeNo(resume.getResumeNo());
                        cert.setQualificationName(qualificationNames[i]);
                        cert.setIssuingAgency(issuingAgencies[i]);
                        cert.setPassStatus(passStatuses[i]);
                        try {
                            if (testDates[i] != null && !testDates[i].isEmpty()) {
                                cert.setTestDate_cer(Date.valueOf(testDates[i]));
                            }
                        } catch (IllegalArgumentException e) {
                            logger.error("Invalid date format for testDate_cer: {}", testDates[i]);
                            cert.setTestDate_cer(null);
                        }
                        resumeService.insertCertificate(cert);
                    }
                }
            }

            // 기존 어학시험 삭제
            resumeService.deleteLanguageTestsByResumeNo(resume.getResumeNo());

         // 새로운 어학시험 추가
            if (languageNames != null) {
                for (int i = 0; i < languageNames.length; i++) {
                    // 유효성 검증: 빈 값이 있는 경우 건너뜀
                    if (languageNames[i] != null && !languageNames[i].isEmpty() &&
                        proficiencyLevels[i] != null && !proficiencyLevels[i].isEmpty() &&
                        languageTypes[i] != null && !languageTypes[i].isEmpty() &&
                        issueDate.length > i && issueDate[i] != null && !issueDate[i].isEmpty()) {
                        
                        LanguageTest langTest = new LanguageTest();
                        langTest.setResumeNo(resume.getResumeNo());
                        langTest.setLanguageName(languageNames[i]);
                        langTest.setProficiencyLevel(proficiencyLevels[i]);
                        langTest.setLanguageType(languageTypes[i]);
                        try {
                            langTest.setIssueDate(Date.valueOf(issueDate[i]));
                        } catch (IllegalArgumentException e) {
                            logger.error("Invalid date format for issueDate: {}", issueDate[i]);
                            langTest.setIssueDate(null);
                        }
                        resumeService.insertLanguageTest(langTest);
                    }
                }

                logger.info("Received languageNames: {}", Arrays.toString(languageNames));
                logger.info("Received proficiencyLevels: {}", Arrays.toString(proficiencyLevels));
                logger.info("Received languageTypes: {}", Arrays.toString(languageTypes));
                logger.info("Received issueDate: {}", Arrays.toString(issueDate));

            }


            // 기존 수상내역 삭제
            resumeService.deleteAwardsByResumeNo(resume.getResumeNo());

            // 새로운 수상내역 추가
            if (awardNames != null) {
                for (int i = 0; i < awardNames.length; i++) {
                    if (awardNames[i] != null && !awardNames[i].isEmpty()) {
                        Award award = new Award();
                        award.setResumeNo(resume.getResumeNo());
                        award.setAwardName(awardNames[i]);
                        award.setOrganizer(organizers[i]);
                        try {
                            if (awardDates[i] != null && !awardDates[i].isEmpty()) {
                                award.setAwardDate(Date.valueOf(awardDates[i]));
                            }
                        } catch (IllegalArgumentException e) {
                            logger.error("Invalid date format for awardDate: {}", awardDates[i]);
                            award.setAwardDate(null);
                        }
                        resumeService.insertAward(award);
                    }
                }
            }

            redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 업데이트되었습니다.");
            return "redirect:/resume/resumeDashboard";

        } catch (Exception e) {
            logger.error("Error while updating resume: ", e);
            redirectAttributes.addFlashAttribute("error", "이력서 업데이트 중 오류가 발생했습니다.");
            return "redirect:/resume/editResume?id=" + resume.getResumeNo();
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

    // 예외 처리 핸들러 추가 (선택 사항)
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handleAllExceptions(Exception ex, RedirectAttributes redirectAttributes) {
        logger.error("Unhandled exception occurred: ", ex);
        redirectAttributes.addFlashAttribute("error", "예기치 않은 오류가 발생했습니다.");
        return "redirect:/resume/resumeDashboard";
    }
}
