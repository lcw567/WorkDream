package com.cs.workdream.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.Resume;

@Repository
public class ResumeDao {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // 이력서 기본 정보 삽입
    public boolean insertResume(Resume resume) {
        int result = sqlSession.insert("ResumeMapper.insertResume", resume);
        return result > 0;
    }

    public List<Resume> selectResumesByPersonNo(int personNo) {
        List<Resume> result = sqlSession.selectList("ResumeMapper.selectResumesByPersonNo", personNo);
        
        return result;
    }
}
