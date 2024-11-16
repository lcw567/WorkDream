package com.cs.workdream.resume.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.AcademicAbility;
import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Career;
import com.cs.workdream.resume.model.vo.EmploymentPreferences;
import com.cs.workdream.resume.model.vo.Experience;
import com.cs.workdream.resume.model.vo.Qualification;
import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.resume.model.vo.Skill;

import java.util.List;

/**
 * ResumeDao 클래스는 MyBatis를 사용하여 데이터베이스와 상호작용합니다.
 */
@Repository
public class ResumeDao {

    private final SqlSession sqlSession;

    @Autowired
    public ResumeDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /**
     * 이력서를 삽입하는 메서드
     *
     * @param resume 삽입할 Resume 객체
     * @return 삽입된 레코드 수
     */
    public int insertResume(Resume resume) {
        return sqlSession.insert("resumeMapper.insertResume", resume);
    }

    /**
     * 고용 선호사항을 삽입하는 메서드
     *
     * @param pref 삽입할 EmploymentPreferences 객체
     * @return 삽입된 레코드 수
     */
    public int insertEmploymentPreference(EmploymentPreferences pref) {
        return sqlSession.insert("resumeMapper.insertEmploymentPreference", pref);
    }

    /**
     * 기본 정보를 삽입하는 메서드
     *
     * @param basicInfo 삽입할 BasicInfo 객체
     * @return 삽입된 레코드 수
     */
    public int insertBasicInfo(BasicInfo basicInfo) {
        return sqlSession.insert("resumeMapper.insertBasicInfo", basicInfo);
    }

    /**
     * 학력 정보를 삽입하는 메서드
     *
     * @param academicAbility 삽입할 AcademicAbility 객체
     * @return 삽입된 레코드 수
     */
    public int insertAcademicAbility(AcademicAbility academicAbility) {
        return sqlSession.insert("resumeMapper.insertAcademicAbility", academicAbility);
    }

    /**
     * 자격증을 삽입하는 메서드
     *
     * @param qualification 삽입할 Qualification 객체
     * @return 삽입된 레코드 수
     */
    public int insertQualification(Qualification qualification) {
        return sqlSession.insert("resumeMapper.insertQualification", qualification);
    }

    /**
     * 경험을 삽입하는 메서드
     *
     * @param experience 삽입할 Experience 객체
     * @return 삽입된 레코드 수
     */
    public int insertExperience(Experience experience) {
        return sqlSession.insert("resumeMapper.insertExperience", experience);
    }

    /**
     * 기술을 삽입하는 메서드
     *
     * @param skill 삽입할 Skill 객체
     * @return 삽입된 레코드 수
     */
    public int insertSkill(Skill skill) {
        return sqlSession.insert("resumeMapper.insertSkill", skill);
    }

    /**
     * 경력 상세를 삽입하는 메서드
     *
     * @param career 삽입할 Career 객체
     * @return 삽입된 레코드 수
     */
    public int insertCareer(Career career) {
        return sqlSession.insert("resumeMapper.insertCareer", career);
    }

    // 필요에 따라 추가적인 DAO 메서드를 정의할 수 있습니다.
}
