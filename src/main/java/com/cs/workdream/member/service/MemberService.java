package com.cs.workdream.member.service;

import com.cs.workdream.member.model.vo.Member;

public interface MemberService {

	// 로그인 판별
	Member loginMember(Member m);

}
