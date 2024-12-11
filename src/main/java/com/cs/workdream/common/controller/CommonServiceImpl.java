package com.cs.workdream.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.Recruitment;
import com.cs.workdream.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;
	
	/*=====================================================================================================*/
	
	
	// 공고 목록 조회
	@Override
	public List<Recruitment> selectRecruitmentList(int personNo) {
		return commonDao.selectRecruitmentList(personNo);
	}

}
