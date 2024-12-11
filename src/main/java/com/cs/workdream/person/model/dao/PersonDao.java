package com.cs.workdream.person.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PersonDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	
	/*=====================================================================================================*/
	
	
	// 지원현황 조회
	public Map<String, Integer> selectApplicationStatus(int personNo) {
		return sqlSession.selectOne("personMapper.selectApplicationStatus", personNo);
	}
}
