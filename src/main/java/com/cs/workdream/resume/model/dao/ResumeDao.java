package com.cs.workdream.resume.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.Resume;

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
}
