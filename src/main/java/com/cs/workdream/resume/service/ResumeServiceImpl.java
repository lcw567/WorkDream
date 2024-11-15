package com.cs.workdream.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cs.workdream.resume.model.dao.ResumeDao;
import com.cs.workdream.resume.model.vo.*;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ResumeServiceImpl implements ResumeService {
    
    private final ResumeDao resumeDao;
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    @Autowired
    public ResumeServiceImpl(ResumeDao resumeDao) {
        this.resumeDao = resumeDao;
    }

    @Override
    @Transactional
    public int saveResume(Resume resume) {
        try {
            // 1. 이력서 기본 정보 삽입
            logger.info("Inserting resume for person_no: {}", resume.getPerson_no());
            int result = resumeDao.insertResume(resume);
            
            if (result > 0 && resume.getPerson_no()  != null) {
                Integer resumeNo = resume.getResume_no();
                int personNo = resume.getPerson_no();
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
                if (basicInfos != null) {
                    for (BasicInfo info : basicInfos) {
                        info.setResume_no(resumeNo);
                        info.setPerson_no(personNo);
                        resumeDao.insertBasicInfo(info);
                        logger.info("Inserted BasicInfo: {}", info);
                    }
                }

                // 4. 학력 정보 삽입
                List<AcademicAbility> academicAbilities = resume.getAcademicAbilities();
                if (academicAbilities != null) {
                    for (AcademicAbility ability : academicAbilities) {
                        ability.setResume_no(resumeNo);
                        ability.setPerson_no(personNo);
                        resumeDao.insertAcademicAbility(ability);
                        logger.info("Inserted AcademicAbility: {}", ability);
                    }
                }

                // 5. 자격증 삽입
                List<Qualification> qualifications = resume.getQualification();
                if (qualifications != null) {
                    for (Qualification qualification : qualifications) {
                        qualification.setResume_no(resumeNo);
                        qualification.setPerson_no(personNo);
                        resumeDao.insertQualification(qualification);
                        logger.info("Inserted Qualification: {}", qualification);
                    }
                }

                // 6. 경력 삽입
                List<Experience> experiences = resume.getExperiences();
                if (experiences != null) {
                    for (Experience experience : experiences) {
                        experience.setResume_no(resumeNo);
                        experience.setPerson_no(personNo);
                        resumeDao.insertExperience(experience);
                        logger.info("Inserted Experience: {}", experience);
                    }
                }

                // 7. 기술 삽입
                List<Skill> skills = resume.getSkills();
                if (skills != null) {
                    for (Skill skill : skills) {
                        skill.setResume_no(resumeNo);
                        skill.setPerson_no(personNo);
                        resumeDao.insertSkill(skill);
                        logger.info("Inserted Skill: {}", skill);
                    }
                }

                // 8. 경력 상세 삽입
                List<Career> careers = resume.getCareers();
                if (careers != null) {
                    for (Career career : careers) {
                        career.setResume_no(resumeNo);
                        career.setPerson_no(personNo);
                        resumeDao.insertCareer(career);
                        logger.info("Inserted Career: {}", career);
                    }
                }

                return result;
            } else {
                logger.error("Resume insertion failed. Result: {}, resume_no: {}", result, resume.getResume_no());
                throw new RuntimeException("Resume insertion failed.");
            }
        } catch (Exception e) {
            logger.error("An error occurred while saving the resume: {}", e.getMessage());
            throw new RuntimeException("An error occurred while saving the resume.", e);
        }
    }
}
