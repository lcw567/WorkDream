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
        Map<String, Object> params = new HashMap<>();
        params.put("selfIntroNo", selfIntroNo);
        int result = sqlSession.update(NAMESPACE + "deleteSelfIntro", params);
        System.out.println("DAO: Delete result: " + result); // 로그 추가
        return result;
    }

    public SelfIntro selectSelfIntroById(int selfintroNo) {
        return sqlSession.selectOne(NAMESPACE + "selectSelfIntroById", selfintroNo);
    }

    public int updateSelfIntro(SelfIntro selfIntro) {
        return sqlSession.update(NAMESPACE + "updateSelfIntro", selfIntro);
    }


}

