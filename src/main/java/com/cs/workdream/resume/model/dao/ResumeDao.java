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

@Repository
public class ResumeDao {

    private final SqlSession sqlSession;

    @Autowired
    public ResumeDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public int insertResume(Resume resume) {
        return sqlSession.insert("resumeMapper.insertResume", resume);
    }

    public int insertEmploymentPreference(EmploymentPreferences pref) {
        return sqlSession.insert("resumeMapper.insertEmploymentPreference", pref);
    }

    // 다른 관련 엔티티 삽입 메서드 추가
    public int insertBasicInfo(BasicInfo basicInfo) {
        return sqlSession.insert("resumeMapper.insertBasicInfo", basicInfo);
    }

    public int insertAcademicAbility(AcademicAbility academicAbility) {
        return sqlSession.insert("resumeMapper.insertAcademicAbility", academicAbility);
    }

    public int insertQualification(Qualification qualification) {
        return sqlSession.insert("resumeMapper.insertQualification", qualification);
    }

    public int insertExperience(Experience experience) {
        return sqlSession.insert("resumeMapper.insertExperience", experience);
    }

    public int insertSkill(Skill skill) {
        return sqlSession.insert("resumeMapper.insertSkill", skill);
    }

    public int insertCareer(Career career) {
        return sqlSession.insert("resumeMapper.insertCareer", career);
    }

    // 관련 엔티티 조회 메서드 추가 (필요 시)
    // ...
}
