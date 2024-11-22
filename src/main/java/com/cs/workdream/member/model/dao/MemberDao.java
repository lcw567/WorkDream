package com.cs.workdream.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.member.model.vo.Member;

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

	// 회원 아이디 조회
	public Member findMemberId(SqlSessionTemplate sqlSession, Member m, String method) {
		// Map 생성 (데이터 넘겨주기용)
		Map<String, Object> findMap = new HashMap<>();
		findMap.put("m", m);
		findMap.put("method", method);
		
		// 회원 유형에 따라 나누기
		if("B".equals(m.getUserType())) {
			// 기업 회원
			return sqlSession.selectOne("memberMapper.findMemberIdBusiness", findMap);
		} else {
			// 개인 회원
			return sqlSession.selectOne("memberMapper.findMemberIdPerson", findMap);
		}
	}
	
	// 회원 비밀번호 조회
	public Member findMemberPwd(SqlSessionTemplate sqlSession, Member m, String method) {
		// Map 생성 (데이터 넘겨주기용)
		Map<String, Object> findMap = new HashMap<>();
		findMap.put("m", m);
		findMap.put("method", method);
		
		// 회원 유형에 따라 나누기
		if("B".equals(m.getUserType())) {
			// 기업 회원
			return sqlSession.selectOne("memberMapper.findMemberPwdBusiness", findMap);
		} else {
			// 개인 회원
			return sqlSession.selectOne("memberMapper.findMemberPwdPerson", findMap);
		}
	}
	
}
