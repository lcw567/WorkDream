package com.cs.workdream.member.service;

import com.cs.workdream.member.model.vo.Member;

public interface MemberService {

	// 로그인 판별
	Member loginMember(Member m);

	// 아이디 중복 체크
	int idCheck(String checkId);

	// 신규 회원 등록
	int insertMember(Member m);

	// 회원 아이디 조회
	Member findMemberId(Member m, String method);

	// 회원 비밀번호 조회
	Member findMemberPwd(Member m, String method);

}
