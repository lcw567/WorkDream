package com.cs.workdream.resume.service;

import java.io.IOException;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.beans.factory.annotation.Value; // 확인 필요
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.Award;
import com.cs.workdream.resume.model.vo.Certificate;
import com.cs.workdream.resume.model.vo.LanguageTest;
import com.cs.workdream.resume.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {

    private final ResumeDao resumeDao;
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    @PostConstruct
    public void init() {
        logger.info("파일 업로드 디렉토리: {}", uploadDir);
    }

    @Override
    @Transactional
    public boolean saveResume(Resume resume, MultipartFile userPicFile) {
        try {
            // 파일 업로드 경로 설정 및 프로필 이미지 저장
            Path uploadPath = Paths.get(uploadDir).toAbsolutePath().normalize();
            logger.info("절대 업로드 경로: {}", uploadPath.toString());

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                logger.info("업로드 디렉토리 생성: {}", uploadPath.toString());
            }

            if (userPicFile != null && !userPicFile.isEmpty()) {
                String originalFilename = userPicFile.getOriginalFilename();
                String extension = "";
                if (originalFilename != null && originalFilename.contains(".")) {
                    extension = originalFilename.substring(originalFilename.lastIndexOf("."));
                }
                String newFilename = UUID.randomUUID().toString() + extension;
                Path destination = uploadPath.resolve(newFilename);
                userPicFile.transferTo(destination.toFile());
                resume.setUserPic(newFilename);
                logger.info("프로필 이미지 업로드 성공: {}", newFilename);
            }

            // 이력서 기본 정보 삽입
            boolean isResumeInserted = resumeDao.insertResume(resume);
            if (!isResumeInserted) {
                logger.error("이력서 정보 저장 실패");
                return false;
            }
            logger.debug("Inserted resumeNo: {}", resume.getResumeNo());

            // 자격증 삽입
            List<Certificate> certificates = resume.getCertificates();
            if (certificates != null) {
                for (Certificate cert : certificates) {
                    cert.setResumeNo(resume.getResumeNo());
                    boolean isCertInserted = resumeDao.insertCertificate(cert);
                    if (isCertInserted) {
                        logger.debug("Inserted certificate: {}", cert.getQualificationName());
                    } else {
                        logger.error("자격증 정보 저장 실패: {}", cert.getQualificationName());
                        throw new RuntimeException("자격증 정보 저장 실패");
                    }
                }
            }

            // 어학시험 삽입
            List<LanguageTest> languageTests = resume.getLanguageTests();
            if (languageTests != null && !languageTests.isEmpty()) {
                for (LanguageTest langTest : languageTests) {
                    langTest.setResumeNo(resume.getResumeNo());
                    logger.debug("Inserting LanguageTest: {}", langTest);
                    boolean isLangInserted = resumeDao.insertLanguageTest(langTest);
                    if (isLangInserted) {
                        logger.debug("Inserted language test: {}", langTest.getLanguageName());
                    } else {
                        logger.error("어학시험 정보 저장 실패: {}", langTest.getLanguageName());
                        throw new RuntimeException("어학시험 정보 저장 실패");
                    }
                }
            } else {
                logger.warn("어학시험 리스트가 비어있거나 null입니다.");
            }

            // 수상내역 삽입
            List<Award> awards = resume.getAwards();
            if (awards != null) {
                for (Award award : awards) {
                    award.setResumeNo(resume.getResumeNo());
                    boolean isAwardInserted = resumeDao.insertAward(award);
                    if (isAwardInserted) {
                        logger.debug("Inserted award: {}", award.getAwardName());
                    } else {
                        logger.error("수상내역 정보 저장 실패: {}", award.getAwardName());
                        throw new RuntimeException("수상내역 정보 저장 실패");
                    }
                }
            }

            return true;
        } catch (IOException e) {
            logger.error("파일 업로드 중 오류 발생", e);
            throw new RuntimeException("파일 업로드 중 오류 발생", e);
        } catch (Exception e) {
            logger.error("이력서 저장 중 오류 발생", e);
            throw new RuntimeException("이력서 저장 중 오류 발생", e);
        }
    }

    @Override
    public List<Resume> getResumesByPersonNo(int personNo) {
        return resumeDao.selectResumesByPersonNo(personNo);
    }

    @Override
    public Resume getResumeById(int resumeNo) {
        Resume resume = resumeDao.selectResumeById(resumeNo);
        if (resume != null) {
            // 자격증, 어학시험, 수상내역 정보 가져와서 설정
            List<Certificate> certificates = resumeDao.selectCertificatesByResumeNo(resumeNo);
            List<LanguageTest> languageTests = resumeDao.selectLanguageTestsByResumeNo(resumeNo);
            List<Award> awards = resumeDao.selectAwardsByResumeNo(resumeNo);

            resume.setCertificates(certificates != null ? certificates : new ArrayList<>());
            resume.setLanguageTests(languageTests != null ? languageTests : new ArrayList<>());
            resume.setAwards(awards != null ? awards : new ArrayList<>());
        }
        return resume;
    }

    @Override
    @Transactional
    public boolean updateResume(Resume resume) {
        try {
            int rowsAffected = resumeDao.updateResume(resume);
            if (rowsAffected > 0) {
                logger.info("Resume updated successfully: {}", resume.getResumeNo());
                return true;
            } else {
                logger.warn("Failed to update resume: {}", resume.getResumeNo());
                return false;
            }
        } catch (Exception e) {
            logger.error("Error updating resume", e);
            throw new RuntimeException("Error updating resume", e);
        }
    }

    @Override
    @Transactional
    public int deleteResumeById(int resumeNo) {
        try {
            logger.info("ResumeServiceImpl - 삭제 요청된 이력서 번호: {}", resumeNo);
            int result = resumeDao.deleteResumeById(resumeNo);
            logger.info("ResumeServiceImpl - DAO 결과: {}", result > 0 ? "성공" : "실패");
            return result;
        } catch (Exception e) {
            logger.error("ResumeServiceImpl - 이력서 삭제 중 오류 발생: {}", e.getMessage(), e);
            throw new RuntimeException("이력서 삭제 중 문제가 발생했습니다.", e);
        }
    }
}
