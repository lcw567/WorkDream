package com.cs.workdream.resume.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.*;

@Repository
public class ResumeDao {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // 이력서 기본 정보 삽입
    public void insertResume(Resume resume) {
        sqlSession.insert("ResumeMapper.insertResume", resume);
    }

    // 기본 정보 삽입
    public void insertBasicInfo(BasicInfo basicInfo) {
        sqlSession.insert("ResumeMapper.insertBasicInfo", basicInfo);
    }

    // 학력 정보 삽입
    public void insertAcademicAbility(AcademicAbility academicAbility) {
        sqlSession.insert("ResumeMapper.insertAcademicAbility", academicAbility);
    }

    // 자격증/어학/수상 정보 삽입
    public void insertQualification(Qualification qualification) {
        sqlSession.insert("ResumeMapper.insertQualification", qualification);
    }

    // 경험 정보 삽입
    public void insertExperience(Experience experience) {
        sqlSession.insert("ResumeMapper.insertExperience", experience);
    }

    // 취업우대사항 삽입
    public void insertEmploymentPreferences(EmploymentPreferences preferences) {
        sqlSession.insert("ResumeMapper.insertEmploymentPreferences", preferences);
    }

    // 스킬 정보 삽입
    public void insertSkill(Skill skill) {
        sqlSession.insert("ResumeMapper.insertSkill", skill);
    }

    // 경력 정보 삽입
    public void insertCareer(Career career) {
        sqlSession.insert("ResumeMapper.insertCareer", career);
    }

    // 필요에 따라 추가적인 CRUD 메서드 구현
}
