package com.cs.workdream.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.controller.BusinessController;
import com.cs.workdream.member.model.dao.MemberDao;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.person.controller.PersonController;

@Service
public class MemberServiceImpl implements MemberService {
	private final BusinessController bController;
	private final PersonController pController;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	public MemberServiceImpl(BusinessController bController, PersonController pController) {
		this.bController = bController;
		this.pController = pController;
	}

	// 로그인 판별
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	// 신규 회원 등록
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

}
