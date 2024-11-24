package com.cs.workdream.member.service;

import java.security.SecureRandom;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.controller.BusinessController;
import com.cs.workdream.member.model.dao.MemberDao;
import com.cs.workdream.member.model.vo.Member;
import com.cs.workdream.person.controller.PersonController;

@Service
public class MemberServiceImpl implements MemberService {
	private final BusinessController bController;
	private final PersonController pController;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	public MemberServiceImpl(BusinessController bController, PersonController pController, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bController = bController;
		this.pController = pController;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
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

	// 회원 아이디 조회
	@Override
	public Member findMemberId(Member m, String method) {
		return memberDao.findMemberId(sqlSession, m, method);
	}

	// 회원 비밀번호 조회
	@Override
	public Member findMemberPwd(Member m, String method) {
		m = memberDao.findMemberPwd(sqlSession, m, method);
		String tempPwd = generateTempPwd();
		int result = memberDao.settingTempPwd(sqlSession, m, bcryptPasswordEncoder.encode(tempPwd));
		
		if(result > 0) {
			// 임시 비밀번호 생성 성공 -> 바뀐 값으로 새로 저장
			m.setUserPwd(tempPwd);
		}
		
		return m;
	}
	
	// 임시 비밀번호 생성
	public String generateTempPwd() {
		final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+";
	    final SecureRandom random = new SecureRandom();
	    
	    int length = 8 + random.nextInt(9);  // 8에서 16 사이의 숫자
        StringBuilder stringBuilder = new StringBuilder(length);
        
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            stringBuilder.append(CHARACTERS.charAt(index));
        }
        
        return stringBuilder.toString();
	}

}
