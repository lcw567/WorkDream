package com.cs.workdream.business.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.model.dao.BusinessDao;
import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BusinessDao businessDao;
	
	// 지원자 현황 조회
	@Override
	public ApplicantsStatus inquireAppsStatus(int applicantsNo) {
		return businessDao.inquireAppsStatus(sqlSession, applicantsNo);
	}
	
	// 포지션 목록 조회
	@Override
	public List<Position> inquirePositionList(int recruitmentNo) {
		return businessDao.inquirePositionList(sqlSession, recruitmentNo);
	}

	// 지원자 목록 조회
	@Override
	public List<Applicants> loadAppList(int recruitmentNo, int positionNo) {
		return businessDao.loadAppList(sqlSession, recruitmentNo, positionNo);
	}

	// 즐겨찾기 목록 조회
	@Override
	public List<BusinessBookmark> loadBookmarkList(int businessNo) {
		return businessDao.loadBookmarkList(sqlSession, businessNo);
	}

	// 즐겨찾기 목록에서 삭제
	@Override
	public int deleteBookmarkList(int businessNo, int resumeNo) {
		return businessDao.deleteBookmarkList(sqlSession, businessNo, resumeNo);
	}
}
