package com.cs.workdream.business.service;

import java.util.List;

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
	private BusinessDao businessDao;
	
	
	/*=====================================================================================================*/
	
	
	// 지원자 현황 조회
	@Override
	public ApplicantsStatus inquireAppsStatus(int applicantsNo) {
		return businessDao.inquireAppsStatus(applicantsNo);
	}
	
	// 포지션 목록 조회(현황 페이지용)
	@Override
	public List<Position> inquirePositionList(int recruitmentNo) {
		return businessDao.inquirePositionList(recruitmentNo);
	}

	// 지원자 목록 조회
	@Override
	public List<Applicants> loadAppList(int recruitmentNo, int positionNo) {
		return businessDao.loadAppList(recruitmentNo, positionNo);
	}

	// 즐겨찾기 목록 조회
	@Override
	public List<BusinessBookmark> loadBookmarkList(int businessNo) {
		return businessDao.loadBookmarkList(businessNo);
	}

	// 즐겨찾기 목록에서 삭제
	@Override
	public int deleteBookmarkList(int businessNo, int resumeNo) {
		return businessDao.deleteBookmarkList(businessNo, resumeNo);
	}

	// 즐겨찾기 그룹 분류 수정
	@Override
	public int updateBookmarkFolder(BusinessBookmark bookmark, String type, int folder) {
		return businessDao.updateBookmarkFolder(bookmark, type, folder);
	}

	// 즐겨찾기 그룹 추가
	@Override
	public int insertFolder(int businessNo, String folderName) {
		return businessDao.insertFolder(businessNo, folderName);
	}

	// 즐겨찾기 그룹 편집
	@Override
	public int updateFolder(int businessNo, int folder, int order, String folderName) {
		return businessDao.updateFolder(businessNo, folder, order, folderName);
	}

	// 즐겨찾기 그룹 삭제
	@Override
	public int deleteFolder(int businessNo, int folder) {
		return businessDao.deleteFolder(businessNo, folder);
	}
}
