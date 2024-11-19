package com.cs.workdream.resume.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.resume.model.vo.SelfIntro;

@Repository
public class SelfIntroDao {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.cs.workdream.resume.mapper.SelfIntroMapper.";

    public int insertSelfIntro(SelfIntro selfIntro) {
        return sqlSession.insert(NAMESPACE + "insertSelfIntro", selfIntro);
    }

    public List<SelfIntro> selectSelfIntroList(String userId) {
        return sqlSession.selectList(NAMESPACE + "selectSelfIntroList", userId);
    }

    public int deleteSelfIntro(Integer selfIntroNo) {
        return sqlSession.update(NAMESPACE + "deleteSelfIntro", selfIntroNo);
    }

    public SelfIntro selectSelfIntroById(int id) {
        return sqlSession.selectOne("SelfIntroMapper.selectSelfIntroById", id);
    }

    public void updateSelfIntro(SelfIntro intro) {
        sqlSession.update("SelfIntroMapper.updateSelfIntro", intro);
    }
}


