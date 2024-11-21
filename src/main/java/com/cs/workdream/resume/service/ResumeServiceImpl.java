package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.AcademicAbility;
import com.cs.workdream.resume.model.vo.EmploymentPreferences;
import com.cs.workdream.resume.model.vo.Experience;
import com.cs.workdream.resume.model.vo.Qualification;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Skill;
import com.cs.workdream.resume.model.vo.Career;
import com.cs.workdream.resume.model.vo.Award;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ResumeServiceImpl 클래스는 ResumeService 인터페이스를 구현하며,
 * 이력서와 관련된 비즈니스 로직을 처리합니다.
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    private final ResumeDao resumeDao;
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    // 파일 업로드 디렉토리 설정 (application.properties에서 주입)
    @Value("${file.upload-dir}")
    private String uploadDir;

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    /**
     * 이력서를 저장하는 메서드
     * 
     * @param resume   저장할 이력서 객체
     * @param userPic  프로필 이미지 파일
     * @return         저장 성공 여부
     */
    @Override
    @Transactional
    public boolean saveResume(Resume resume, MultipartFile userPic) {
        try {
            // 프로필 이미지 처리
            if (userPic != null && !userPic.isEmpty()) {
                // 원본 파일 이름
                String originalFilename = userPic.getOriginalFilename();
                // 고유한 파일 이름 생성
                String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
                // 파일을 저장할 경로
                String filePath = uploadDir + File.separator + uniqueFilename;
                File dest = new File(filePath);
                // 디렉토리가 존재하지 않으면 생성
                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }
                // 파일 저장
                userPic.transferTo(dest);
                // Resume 객체에 파일 이름 설정
                resume.setUserPic(uniqueFilename);
            }

            // 이력서 기본 정보 저장
            resumeDao.insertResume(resume);
            
            Integer resumeId = resume.getResumeNo(); // MyBatis가 자동 생성한 ID를 설정해야 함
            logger.info("Resume saved with ID: {}", resumeId);

            // 학력 정보 저장
            if (resume.getEducations() != null) {
                for (AcademicAbility edu : resume.getEducations()) {
                    edu.setResumeNo(resumeId);
                    resumeDao.insertEducation(edu);
                }
            }

            // 경력 정보 저장
            if (resume.getCareers() != null) {
                for (Career career : resume.getCareers()) {
                    career.setResumeNo(resumeId);
                    resumeDao.insertCareer(career);
                }
            }

            // 스킬 저장
            if (resume.getSkills() != null) {
                for (Skill skill : resume.getSkills()) {
                    skill.setResumeNo(resumeId);
                    resumeDao.insertSkill(skill);
                }
            }

            // 자격증 저장
            if (resume.getQualifications() != null) {
                for (Qualification qual : resume.getQualifications()) {
                    qual.setResumeNo(resumeId);
                    resumeDao.insertQualification(qual);
                }
            }

            // 수상내역 저장
            if (resume.getAwards() != null) {
                for (Award award : resume.getAwards()) {
                    award.setResumeId(resumeId);
                    resumeDao.insertAward(award);
                }
            }

            // 취업 우대 사항 저장
            EmploymentPreferences preferences = resume.getEmploymentPreferences();
            if (preferences != null) {
                preferences.setResumeNo(resumeId);
                resumeDao.insertEmploymentPreferences(preferences);
            }

            return true;
        } catch (IOException e) {
            logger.error("파일 업로드 중 오류 발생: ", e);
            // 트랜잭션 롤백
            throw new RuntimeException("파일 업로드 실패", e);
        } catch (Exception e) {
            logger.error("이력서 저장 중 오류 발생: ", e);
            // 트랜잭션 롤백
            throw new RuntimeException("이력서 저장 실패", e);
        }
    }
}
