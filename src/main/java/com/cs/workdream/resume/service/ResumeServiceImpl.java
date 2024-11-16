package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.AcademicAbility;
import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Career;
import com.cs.workdream.resume.model.vo.EmploymentPreferences;
import com.cs.workdream.resume.model.vo.Experience;
import com.cs.workdream.resume.model.vo.Qualification;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.Skill;

import java.util.List;

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

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    /**
     * 이력서를 저장하는 메서드
     * 
     * @param resume 저장할 Resume 객체
     * @return 저장 성공 시 1, 실패 시 0
     */
    @Override
    @Transactional
    public int saveResume(Resume resume) {
        try {
            // 1. 이력서 기본 정보 삽입
            logger.info("Inserting resume for person_no: {}", resume.getPersonNo());
            int result = resumeDao.insertResume(resume);
            
            if (result > 0 && resume.getResumeNo() != null) {
                Integer resumeNo = resume.getResumeNo();
                int personNo = resume.getPersonNo();
                logger.info("Resume inserted with resume_no: {}", resumeNo);

                // 2. 고용 선호사항 삽입
                EmploymentPreferences pref = resume.getEmploymentPreference();
                if (pref != null) {
                    pref.setResumeNo(resumeNo);
                    pref.setPersonNo(personNo);
                    resumeDao.insertEmploymentPreference(pref);
                    logger.info("Inserted EmploymentPreferences: {}", pref);
                }

                // 3. 기본 정보 삽입
                List<BasicInfo> basicInfos = resume.getBasicInfo();
                if (basicInfos != null && !basicInfos.isEmpty()) {
                    for (BasicInfo info : basicInfos) {
                        info.setResumeNo(resumeNo);
                        info.setPersonNo(personNo);
                        resumeDao.insertBasicInfo(info);
                        logger.info("Inserted BasicInfo: {}", info);
                    }
                }

                // 4. 학력 정보 삽입
                List<AcademicAbility> academicAbilities = resume.getAcademicAbilities();
                if (academicAbilities != null && !academicAbilities.isEmpty()) {
                    for (AcademicAbility ability : academicAbilities) {
                        ability.setResumeNo(resumeNo);
                        ability.setPersonNo(personNo);
                        resumeDao.insertAcademicAbility(ability);
                        logger.info("Inserted AcademicAbility: {}", ability);
                    }
                }

                // 5. 자격증 삽입
                List<Qualification> qualifications = resume.getQualification();
                if (qualifications != null && !qualifications.isEmpty()) {
                    for (Qualification qualification : qualifications) {
                        qualification.setResumeNo(resumeNo);
                        qualification.setPersonNo(personNo);
                        resumeDao.insertQualification(qualification);
                        logger.info("Inserted Qualification: {}", qualification);
                    }
                }

                // 6. 경험 삽입
                List<Experience> experiences = resume.getExperiences();
                if (experiences != null && !experiences.isEmpty()) {
                    for (Experience experience : experiences) {
                        experience.setResumeNo(resumeNo);
                        experience.setPersonNo(personNo);
                        resumeDao.insertExperience(experience);
                        logger.info("Inserted Experience: {}", experience);
                    }
                }

                // 7. 기술 삽입
                List<Skill> skills = resume.getSkills();
                if (skills != null && !skills.isEmpty()) {
                    for (Skill skill : skills) {
                        skill.setResume_no(resumeNo);
                        skill.setPerson_no(personNo);
                        resumeDao.insertSkill(skill);
                        logger.info("Inserted Skill: {}", skill);
                    }
                }

                // 8. 경력 상세 삽입
                List<Career> careers = resume.getCareers();
                if (careers != null && !careers.isEmpty()) {
                    for (Career career : careers) {
                        career.setResumeNo(resumeNo);
                        career.setPersonNo(personNo);
                        resumeDao.insertCareer(career);
                        logger.info("Inserted Career: {}", career);
                    }
                }

                return result;
            } else {
                logger.error("Resume insertion failed. Result: {}, resume_no: {}", result, resume.getResumeNo());
                throw new RuntimeException("Resume insertion failed.");
            }
        } catch (Exception e) {
            logger.error("An error occurred while saving the resume: {}", e.getMessage());
            throw new RuntimeException("An error occurred while saving the resume.", e);
        }
    }
}
