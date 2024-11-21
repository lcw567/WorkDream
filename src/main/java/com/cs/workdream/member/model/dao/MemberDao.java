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
	    if ("B".equals(m.getUserType())) {
	        // 기업 회원의 경우 > Business에 insert
	        sqlSession.insert("memberMapper.insertBusiness", m);
	    } else {
	        // 개인 회원의 경우 > Person에 insert
	        sqlSession.insert("memberMapper.insertPerson", m);
	    }
	    
	    System.out.println("===== 고유키 반환 =====");
	    System.out.println("Business No: " + m.getBusinessNo());
	    System.out.println("Person No: " + m.getPersonNo());
	    System.out.println(m.toString());

	    // personNo나 businessNo가 설정된 후 insertMember 호출
	    return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member findMemberId(SqlSessionTemplate sqlSession, Member m, String method) {
		if("email".equals(method)) {
			// 이메일로 찾기
			return sqlSession.selectOne("memberMapper.findMemberId", m);
		} else if("phone".equals(method)) {
			// 휴대폰으로 찾기
			return null;
		} else {
			// 사업자등록번호로 찾기
			return null;
		}
	}
	
}
