package com.cs.workdream.resume.controller;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.portfolio.model.vo.Portfolio;
import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.service.ResumeService;
import com.cs.workdream.selfintro.model.vo.SelfIntro;

@Controller
@RequestMapping("/resume")
public class ResumeController {

	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);


    private final ResumeService resumeService;
    private final ServletContext servletContext;

    @Autowired
    public ResumeController(ResumeService resumeService, ServletContext servletContext) {
        this.resumeService = resumeService;
        this.servletContext = servletContext;
    }

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
                               @RequestParam(value = "resumePortfolios[]", required = false) List<Integer> resumePortfolios,
                               @RequestParam(value = "resumeSelfintro[]", required = false) List<Integer> resumeSelfintros,
                               @RequestParam(value = "selfintroTitle[]", required = false) String[] selfintroTitles,
                               @RequestParam(value = "selfintroContent[]", required = false) String[] selfintroContents,
                               HttpSession session, 
                               HttpServletRequest request,
                               RedirectAttributes redirectAttributes) {
        // 세션에서 로그인 사용자 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login?error=sessionExpired";
        }
        resume.setPersonNo(loginUser.getPersonNo());
        logger.info("로그인 사용자 PersonNo: {}", loginUser.getPersonNo());

        String status = resume.getResumeStatus();
        if (status == null || !status.equals("Y")) {
            resume.setResumeStatus("N");
        }
        logger.debug("Resume Status: {}", resume.getResumeStatus());
        
     // 자기소개서 리스트 생성
        List<SelfIntro> selfIntros = new ArrayList<>();
        if (selfintroTitles != null && selfintroContents != null) {
            int minLength = Math.min(selfintroTitles.length, selfintroContents.length);
            for (int i = 0; i < minLength; i++) {
                if (selfintroTitles[i] != null && !selfintroTitles[i].isEmpty()) {
                    SelfIntro selfIntro = new SelfIntro();
                    selfIntro.setUserNo(loginUser.getUserNo());
                    selfIntro.setUserId(loginUser.getUserId());
                    selfIntro.setIntroTitle(selfintroTitles[i]);
                    selfIntro.setIntroContent(selfintroContents[i]);
                    // personNo가 필요 없다면 setPersonNo 생략 또는 주석 처리
                    // selfIntro.setPersonNo(loginUser.getPersonNo());
                    selfIntros.add(selfIntro);
                }
            }
        }
        resume.setSelfintro(selfIntros);

        // 군복무 상태 처리
        switch (resume.getServiceStatus()) {
            case "미필":
                resume.setExemptionReason(null); // 미필일 경우 면제 사유는 null
                resume.setEnlistmentDate_ful(null);
                resume.setDischargeDate_ful(null);
                resume.setMilitaryBranch_ful(null);
                resume.setRank_ful(null);
                resume.setDischargeReason_ful(null);
                break;

            case "면제":
                resume.setUnfulfilledReason(null); // 면제일 경우 미필 사유는 null
                resume.setEnlistmentDate_ful(null);
                resume.setDischargeDate_ful(null);
                resume.setMilitaryBranch_ful(null);
                resume.setRank_ful(null);
                resume.setDischargeReason_ful(null);
                break;

            case "군필":
                resume.setUnfulfilledReason(null);
                resume.setExemptionReason(null);
                resume.setEnlistmentDate_ser(null);
                resume.setDischargeDate_ser(null);
                resume.setMilitaryBranch_ser(null);
                resume.setRank_ser(null);
                break;

            case "복무중":
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

        // 프로필 사진 처리
        try {
            String userPicPath = processProfilePicture(userPicFile, resume, loginUser);
            resume.setUserPic(userPicPath);
        } catch (RuntimeException e) {
            logger.error("프로필 사진 처리 중 오류 발생: ", e);
            redirectAttributes.addFlashAttribute("error", "프로필 사진 처리 중 오류가 발생했습니다.");
            return "redirect:/resume/enrollresume";
        }
        
        // 포트폴리오 데이터 로그 추가
        if (resumePortfolios != null) {
            logger.info("Received Portfolio IDs: {}", resumePortfolios);
        } else {
            logger.info("No Portfolio IDs received.");
        }

        try {
            boolean isInserted = resumeService.saveResume(resume);
            if (isInserted) {
                // 선택된 포트폴리오와 이력서를 연관
                if (resumePortfolios != null && !resumePortfolios.isEmpty()) {
                    List<Portfolio> selectedPortfolios = resumeService.getPortfoliosByIds(resumePortfolios);
                    resume.setPortfolio(selectedPortfolios);
                    resumeService.associatePortfoliosWithResume(resume.getResumeNo(), resumePortfolios);
                }

                redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 등록되었습니다.");
                return "redirect:/resume/resumeDashboard";
            } else {
                redirectAttributes.addFlashAttribute("error", "이력서 등록에 실패했습니다.");
                return "redirect:/resume/enrollresume";
            }
        } catch (Exception e) {
            logger.error("이력서 등록 중 오류 발생: ", e);
            redirectAttributes.addFlashAttribute("error", "이력서 등록 중 오류가 발생했습니다.");
            return "redirect:/resume/enrollresume";
        }
	}

    /**
     * 프로필 사진을 처리하고 저장된 파일의 경로를 반환하는 메서드
     */
	 // 프로필 사진 처리 메서드
    private String processProfilePicture(MultipartFile userPicFile, Resume resume, Member loginUser) {
        if (userPicFile != null && !userPicFile.isEmpty()) {
            String userFolder = "person" + loginUser.getPersonNo();
            String uploadDir = servletContext.getRealPath("resources/person/" + userFolder + "/profile/");
            if (uploadDir == null) {
                uploadDir = new File("src/main/webapp/resources/person/" + userFolder + "/profile/").getAbsolutePath();
            }
            logger.debug("프로필 업로드 디렉토리: {}", uploadDir);

            // 폴더 생성
            File dir = new File(uploadDir);
            if (!dir.exists() && !dir.mkdirs()) {
                throw new RuntimeException("프로필 사진 저장 폴더를 생성할 수 없습니다.");
            }

            // 파일명 설정
            String originalFilename = userPicFile.getOriginalFilename();
            String extension = "";
            if (originalFilename != null && originalFilename.contains(".")) {
                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            }
            String filename = UUID.randomUUID().toString() + extension;

            // 파일 저장
            try {
                userPicFile.transferTo(new File(uploadDir + File.separator + filename));
            } catch (IOException e) {
                logger.error("프로필 사진 저장 중 오류 발생: ", e);
                throw new RuntimeException("프로필 사진 저장 중 오류가 발생했습니다.");
            }

            // 사용자 프로필 사진 경로를 상대 경로로 설정 (앞에 슬래시 제거)
            return "resources/person/" + userFolder + "/profile/" + filename;
        } else {
            // 새로운 파일이 업로드되지 않은 경우, 기존 프로필 사진을 유지
            Resume existingResume = resumeService.getResumeById(resume.getResumeNo());
            if (existingResume != null) {
                return existingResume.getUserPic();
            }
            return null;
        }
    }
    
    @GetMapping("/getPortfolios")
    @ResponseBody
    public List<Portfolio> getPortfolios(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }

        int userNo = loginUser.getUserNo(); // Member 클래스에 getUserNo() 메서드가 있어야 합니다.
        return resumeService.getPortfoliosByUserNo(userNo);
    }

    
    @PostMapping("/savePortfolio")
    @ResponseBody
    public ResponseEntity<?> savePortfolio(@RequestBody Map<String, Integer> data) {
        int resumeId = data.get("resumeId");
        int portfolioId = data.get("portfolioId");
        
        logger.info("Received resumeId: {}, portfolioId: {}", resumeId, portfolioId);
        
        try {
            // Portfolio와 Resume 연관 관계 설정 (1대 다 관계로 변경)
            resumeService.associatePortfoliosWithResume(resumeId, Arrays.asList(portfolioId));

            // 성공 응답
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // 실패 응답
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    
    // 로그인 상태 확인 및 포트폴리오 가져오기
    @GetMapping("/getPortfoliosByResumeNo")
    public ResponseEntity<?> getPortfoliosByResumeNo(@RequestParam("resumeNo") int resumeNo, HttpSession session) {
        Object user = session.getAttribute("loginUser"); // 세션에 저장된 사용자 정보 확인
        if (user == null) {
            // 로그 추가
            // logger.warn("인증되지 않은 사용자가 /resume/getPortfoliosByResumeNo에 접근 시도");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .body("로그인이 필요합니다.");
        }

        List<Portfolio> portfolios = resumeService.getPortfoliosByResumeNo(resumeNo);
        // logger.info("사용자 {}의 포트폴리오 목록을 반환합니다.", user.toString());
        return ResponseEntity.ok(portfolios);
    }

    /**
     * 자기소개서 목록 가져오기
     */
    @GetMapping("/getSelfIntros")
    @ResponseBody
    public List<SelfIntro> getSelfIntros(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }

        int userNo = loginUser.getUserNo(); // Member 클래스에 getUserNo() 메서드가 있어야 합니다.
        return resumeService.getSelfIntrosByUserNo(userNo);
    }

    /**
     * 자기소개서와 이력서 연관짓기
     */
    @PostMapping("/saveSelfIntro")
    @ResponseBody
    public ResponseEntity<?> saveSelfIntro(@RequestBody Map<String, Integer> data) {
        int resumeNo = data.get("resumeNo");
        int selfintroNo = data.get("selfintroNo");
        
        logger.info("Received resumeId: {}, selfIntroId: {}", resumeNo, selfintroNo);
        
        try {
            // SelfIntro와 Resume 연관 관계 설정 (resumeNo 업데이트)
        	resumeService.associateSelfIntroWithResume(resumeNo, Arrays.asList(selfintroNo));
     
            // 성공 응답
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // 실패 응답
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("error", "SelfIntro와 Resume 연관짓기에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    /**
     * 이력서 번호로 자기소개서 목록 가져오기
     */
    @GetMapping("/getSelfIntrosByResumeNo")
    public ResponseEntity<?> getSelfIntrosByResumeNo(@RequestParam("resumeNo") int resumeNo, HttpSession session) {
        Object user = session.getAttribute("loginUser"); // 세션에 저장된 사용자 정보 확인
        if (user == null) {
            // logger.warn("인증되지 않은 사용자가 /resume/getSelfIntrosByResumeNo에 접근 시도");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                 .body("로그인이 필요합니다.");
        }

        List<SelfIntro> selfIntros = resumeService.getSelfIntrosByResumeNo(resumeNo);
        // logger.info("사용자 {}의 자기소개서 목록을 반환합니다.", user.toString());
        return ResponseEntity.ok(selfIntros);
    }


	@GetMapping("/enrollresume")
	public String enrollResume() {
		return "resume/enrollresume"; // 해당 JSP 파일의 경로
	}

	@GetMapping("/view.re")
	public String viewResume(@RequestParam("id") int resumeNo, Model model) {
		Resume resume = resumeService.getResumeByNo(resumeNo);
		model.addAttribute("resume", resume);
		
		 // 포트폴리오 목록 가져오기
        List<Portfolio> portfolios = resumeService.getPortfoliosByResumeNo(resume.getResumeNo());
        model.addAttribute("portfolios", portfolios);
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
	 * 
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
	 * 
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
	public String editResume(@RequestParam(value = "id", required = false, defaultValue = "0") int resumeNo,
			Model model, RedirectAttributes redirectAttributes) {
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
	public String updateResume(@ModelAttribute Resume resume, @RequestParam("userPicFile") MultipartFile userPicFile,
			@RequestParam(value = "qualificationName[]", required = false) String[] qualificationNames,
			@RequestParam(value = "issuingAgency[]", required = false) String[] issuingAgencies,
			@RequestParam(value = "passStatus[]", required = false) String[] passStatuses,
			@RequestParam(value = "testDate_cer[]", required = false) String[] testDates,
			@RequestParam(value = "languageName[]", required = false) String[] languageNames,
			@RequestParam(value = "proficiencyLevel[]", required = false) String[] proficiencyLevels,
			@RequestParam(value = "languageType[]", required = false) String[] languageTypes,
			@RequestParam(value = "issueDate[]", required = false) String[] issueDates,
			@RequestParam(value = "awardName[]", required = false) String[] awardNames,
			@RequestParam(value = "organizer[]", required = false) String[] organizers,
			@RequestParam(value = "awardDate[]", required = false) String[] awardDates, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		try {
			// 세션에서 로그인 사용자 정보 가져오기
			Member loginUser = (Member) session.getAttribute("loginUser");
			if (loginUser == null) {
				redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
				return "redirect:/login?error=sessionExpired";
			}
			resume.setPersonNo(loginUser.getPersonNo());

			// 프로필 사진 처리
			if (!userPicFile.isEmpty()) {
				// 업로드할 폴더 경로 설정
				String uploadDir = servletContext.getRealPath("resources/profile_images/");
				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// 기존 파일 삭제
				Resume existingResume = resumeService.getResumeById(resume.getResumeNo());
				if (existingResume != null && existingResume.getUserPic() != null) {
					String oldFilePath = request.getSession().getServletContext().getRealPath(existingResume.getUserPic());
					File oldFile = new File(oldFilePath);
					if (oldFile.exists()) {
						oldFile.delete();
					}
				}

				// 파일명 설정
				String originalFilename = userPicFile.getOriginalFilename();
				String filename = UUID.randomUUID().toString() + "_" + originalFilename;

				// 파일 저장
				try {
					userPicFile.transferTo(new File(uploadDir + filename));
				} catch (IOException e) {
					logger.error("프로필 사진 저장 중 오류 발생: ", e);
					redirectAttributes.addFlashAttribute("error", "프로필 사진 저장 중 오류가 발생했습니다.");
					return "redirect:/resume/editResume?id=" + resume.getResumeNo();
				}

				// 사용자 프로필 사진 경로를 설정
				resume.setUserPic("resources/profile_images/" + filename);
			} else {
				// 새로운 파일이 업로드되지 않은 경우, 기존 프로필 사진을 유지
				Resume existingResume = resumeService.getResumeById(resume.getResumeNo());
				if (existingResume != null) {
					resume.setUserPic(existingResume.getUserPic());
				}
			}

			// 군복무 상태 처리
			switch (resume.getServiceStatus()) {
			case "미필":
				resume.setExemptionReason(null);
				resume.setEnlistmentDate_ful(null);
				resume.setDischargeDate_ful(null);
				resume.setMilitaryBranch_ful(null);
				resume.setRank_ful(null);
				resume.setDischargeReason_ful(null);
				break;

			case "면제":
				resume.setUnfulfilledReason(null);
				resume.setEnlistmentDate_ful(null);
				resume.setDischargeDate_ful(null);
				resume.setMilitaryBranch_ful(null);
				resume.setRank_ful(null);
				resume.setDischargeReason_ful(null);
				break;

			case "군필":
				resume.setUnfulfilledReason(null);
				resume.setExemptionReason(null);
				resume.setEnlistmentDate_ser(null);
				resume.setDischargeDate_ser(null);
				resume.setMilitaryBranch_ser(null);
				resume.setRank_ser(null);
				break;

			case "복무중":
				resume.setUnfulfilledReason(null);
				resume.setExemptionReason(null);
				resume.setDischargeDate_ful(null);
				resume.setMilitaryBranch_ful(null);
				resume.setRank_ful(null);
				resume.setDischargeReason_ful(null);
				break;

			default:
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

			// 자격증 리스트 생성
			List<Certificate> certificates = new ArrayList<>();
			if (qualificationNames != null && issuingAgencies != null && passStatuses != null && testDates != null) {
				int minLength = Math.min(Math.min(qualificationNames.length, issuingAgencies.length),
						Math.min(passStatuses.length, testDates.length));
				for (int i = 0; i < minLength; i++) {
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
						certificates.add(cert);
					}
				}
			}

			// 어학시험 리스트 생성
			List<LanguageTest> languageTests = new ArrayList<>();
			if (languageNames != null && proficiencyLevels != null && languageTypes != null && issueDates != null) {
				int minLength = Math.min(Math.min(languageNames.length, proficiencyLevels.length),
						Math.min(languageTypes.length, issueDates.length));
				for (int i = 0; i < minLength; i++) {
					if (languageNames[i] != null && !languageNames[i].isEmpty()) {
						LanguageTest langTest = new LanguageTest();
						langTest.setResumeNo(resume.getResumeNo());
						langTest.setLanguageName(languageNames[i]);
						langTest.setProficiencyLevel(proficiencyLevels[i]);
						langTest.setLanguageType(languageTypes[i]);
						try {
							if (issueDates[i] != null && !issueDates[i].isEmpty()) {
								langTest.setIssueDate(Date.valueOf(issueDates[i]));
							}
						} catch (IllegalArgumentException e) {
							logger.error("Invalid date format for issueDate: {}", issueDates[i]);
							langTest.setIssueDate(null);
						}
						languageTests.add(langTest);
					}
				}
			}

			// 수상내역 리스트 생성
			List<Award> awards = new ArrayList<>();
			if (awardNames != null && organizers != null && awardDates != null) {
				int minLength = Math.min(Math.min(awardNames.length, organizers.length), awardDates.length);
				for (int i = 0; i < minLength; i++) {
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
						awards.add(award);
					}
				}
			}

			// 이력서 업데이트
			boolean isUpdated = resumeService.updateResume(resume, certificates, languageTests, awards);
			if (isUpdated) {
				redirectAttributes.addFlashAttribute("message", "이력서가 성공적으로 업데이트되었습니다.");
				return "redirect:/resume/resumeDashboard";
			} else {
				redirectAttributes.addFlashAttribute("error", "이력서 업데이트에 실패했습니다.");
				return "redirect:/resume/editResume?id=" + resume.getResumeNo();
			}

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