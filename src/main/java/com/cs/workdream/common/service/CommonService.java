package com.cs.workdream.common.service;

import java.util.List;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.Recruitment;

public interface CommonService {

	// 공고 목록 조회
	List<Recruitment> selectRecruitmentList(int personNo);
	
}
