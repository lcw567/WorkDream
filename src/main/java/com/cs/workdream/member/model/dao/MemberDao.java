package com.cs.workdream.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.controller.BusinessController;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.person.controller.PersonController;

@Repository
public class MemberDao {
	
	// 로그인 판별
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	// 아이디 중복 체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	// 신규 회원 등록
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// 회원 유형 판별
		if ("B".equals(m.getUserType().toString())) {
			// 기업 회원의 경우 > Business에 insert
			sqlSession.insert("memberMapper.insertBusiness", m);
		} else {
			// 개인 회원의 경우 > Person에 insert
			sqlSession.insert("memberMapper.insertPerson", m);
		}
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
}
