package com.cs.workdream.business.service;

import java.util.List;

import com.cs.workdream.business.model.vo.Applicants;

public interface BusinessService {

	// 지원자 현황 조회
	Applicants inquireAppStatus(int recruitmentNo);

	// 지원자 목록 조회
	List<Applicants> loadAppList(int recruitmentNo, int positionNo);
	
}
