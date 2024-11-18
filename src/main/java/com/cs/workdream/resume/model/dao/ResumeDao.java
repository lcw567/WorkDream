package com.cs.workdream.resume.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.BasicInfo;
import com.cs.workdream.resume.model.vo.Resume;

@Repository
public class ResumeDao {

    private final SqlSession sqlSession;

    @Autowired
    public ResumeDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 이력서 삽입 메서드
    public int insertResume(Resume resume) {
        return sqlSession.insert("resumeMapper.insertResume", resume);
    }

    // 기본 정보 삽입 메서드
    public int batchInsertBasicInfo(List<BasicInfo> basicInfoList) {
        return sqlSession.insert("resumeMapper.batchInsertBasicInfo", basicInfoList);
    }

    // 이력서와 기본 정보를 저장하는 메서드
    public int saveResumeAndBasicInfo(Resume resume) {
        int result = insertResume(resume); // 이력서 삽입
        if (result > 0 && resume.getBasicInfo() != null) {
            batchInsertBasicInfo(resume.getBasicInfo()); // 기본 정보 삽입
            System.out.println("DAO 전달 Resume 객체: " + resume);
            
        }
        return result;
    }
}
