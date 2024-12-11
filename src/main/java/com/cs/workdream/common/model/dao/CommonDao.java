package com.cs.workdream.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.Recruitment;

@Repository
public class CommonDao {

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	
	/*=====================================================================================================*/
	
	
	// 공고 목록 조회
	public List<Recruitment> selectRecruitmentList(int personNo) {
		if(personNo == 0) {
			// 전체 조회
			return sqlSession.selectList("commonMapper.selectRecruitmentList");
		} else {
			return sqlSession.selectList("commonMapper.selectRecruitmentTagList", personNo);
		}
	}
}
