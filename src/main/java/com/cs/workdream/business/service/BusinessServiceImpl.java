package com.cs.workdream.business.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.model.dao.BusinessDao;
import com.cs.workdream.business.model.vo.Applicants;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BusinessDao businessDao;
	
	// 지원자 현황 조회
	@Override
	public Applicants inquireAppStatus(int applicantsNo) {
		// 전달받은 no를 통해 조회
		return businessDao.inquireAppStatus(sqlSession, applicantsNo);
	}

	// 지원자 목록 조회
	@Override
	public List<Applicants> loadAppList(int recruitmentNo, int positionNo) {
		return businessDao.loadAppList(sqlSession, recruitmentNo, positionNo);
	}
}
