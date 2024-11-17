package com.cs.workdream.person.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.cs.workdream.person.model.vo.Person;

public class PersonDao {

	// 신규 회원 등록
	public int insertPerson(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("personMapper");
	}

}
