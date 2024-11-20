package com.cs.workdream.resume.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.SelfIntro;

@Repository
public class SelfIntroDao {
    private static final Logger logger = LoggerFactory.getLogger(SelfIntroDao.class);

    @Autowired
    private SqlSession sqlSession;

    // 네임스페이스 끝에 점(.)을 제거
    private static final String NAMESPACE = "com.cs.workdream.resume.mapper.SelfIntroMapper";

    public int insertSelfIntro(SelfIntro selfIntro) {
        return sqlSession.insert(NAMESPACE + ".insertSelfIntro", selfIntro);
    }

    public List<SelfIntro> selectSelfIntroList(String userId) {
        return sqlSession.selectList(NAMESPACE + ".selectSelfIntroList", userId);
    }

    public int deleteSelfIntro(Integer selfIntroNo) {
        return sqlSession.update(NAMESPACE + ".deleteSelfIntro", selfIntroNo);
    }
    
    public SelfIntro selectSelfIntroById(Integer selfintroNo) {
        return sqlSession.selectOne(NAMESPACE + ".selectSelfIntroById", selfintroNo);
    }
    
    public void updateSelfIntro(SelfIntro intro) {
        int result = sqlSession.update(NAMESPACE + ".updateSelfIntro", intro);
        if (result > 0) {
            logger.info("SelfIntro updated successfully in DAO for id: {}", intro.getSelfintroNo());
        } else {
            logger.warn("SelfIntro update failed in DAO for id: {}", intro.getSelfintroNo());
            // 예외를 던지거나 추가적인 처리를 할 수 있습니다.
        }
    }

}
