package com.cs.workdream.resume.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.Resume;
import com.cs.workdream.selfintro.model.dao.SelfIntroDao;

@Repository
public class ResumeDao {

    @Autowired
    private SqlSessionTemplate sqlSession;
    private static final Logger logger = LoggerFactory.getLogger(SelfIntroDao.class);
    private static final String NAMESPACE = "com.cs.workdream.resume.mapper.ResumeMapper";

    // 이력서 기본 정보 삽입
    public boolean insertResume(Resume resume) {
        int result = sqlSession.insert(NAMESPACE + ".insertResume", resume);
        return result > 0;
    }

    public List<Resume> selectResumesByPersonNo(int personNo) {
        return sqlSession.selectList(NAMESPACE + ".selectResumesByPersonNo", personNo);
    }
    
    public Resume selectResumeById(int resumeNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectResumeById", resumeNo);
    }

    public int updateResume(Resume resume) {
        return sqlSession.update(NAMESPACE + ".updateResume", resume);
    }
    
    public int deleteResumeById(int resumeNo) {
    	logger.info("ResumeDao - 삭제하려는 resumeNo: {}", resumeNo);
    	int result = sqlSession.update(NAMESPACE + ".deleteResume", resumeNo);
    	logger.info("ResumeDao - 삭제 결과: {}", result);
        return result;
    }
}
