package com.cs.workdream.usertags.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.usertags.model.vo.UserTag;


@Repository
public class UserTagsDao {

    private final SqlSession sqlSession;

    @Autowired
    public UserTagsDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<UserTag> selectUserTagsByUserNo(int userNo) {
        return sqlSession.selectList("com.cs.workdream.usertags.model.dao.UserTagsDao.selectUserTagsByUserNo", userNo);
    }


    public int insertUserTag(UserTag userTag) {
        return sqlSession.insert("com.cs.workdream.usertags.model.dao.UserTagsDao.insertUserTag", userTag);
    }

    public int deleteUserTag(int tagId) {
        return sqlSession.delete("com.cs.workdream.usertags.model.dao.UserTagsDao.deleteUserTag", tagId);
    }

    public int deleteUserTagsByUserNo(int userNo) {
        return sqlSession.delete("com.cs.workdream.usertags.model.dao.UserTagsDao.deleteUserTagsByUserNo", userNo);
    }
}
