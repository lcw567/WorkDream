package com.cs.workdream.person.service;

import java.util.Map;

public interface PersonService {
	
	// 지원현황 조회
	Map<String, Integer> selectApplicationStatus(int personNo);
}
