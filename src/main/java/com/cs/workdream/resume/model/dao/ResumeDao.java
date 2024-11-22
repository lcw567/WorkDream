package com.cs.workdream.resume.model.dao;

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

    // 기타 정보 삽입 메서드 (필요 시 추가)
    // 예: 기본 정보, 학력, 경력 등
}
