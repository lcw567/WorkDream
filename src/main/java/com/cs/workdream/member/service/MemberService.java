package com.cs.workdream.member.service;

import com.cs.workdream.member.model.vo.Member;

public interface MemberService {

	// 로그인 판별
	Member loginMember(Member m);

	// 아이디 중복 체크
	int idCheck(String checkId);

}
