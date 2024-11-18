package com.cs.workdream.resume.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cs.workdream.resume.model.vo.SelfIntro;
import org.apache.ibatis.session.SqlSession;

@Repository
public class SelfIntroDao {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.cs.workdream.resume.mapper.SelfIntroMapper.";

    public int insertSelfIntro(SelfIntro selfIntro) {
        return sqlSession.insert(NAMESPACE + "insertSelfIntro", selfIntro);
    }
}
