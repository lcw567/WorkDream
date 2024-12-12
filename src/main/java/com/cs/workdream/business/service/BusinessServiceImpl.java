package com.cs.workdream.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cs.workdream.business.model.dao.BusinessDao;
import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.model.vo.Recruitment;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;
	
	
	/*=====================================================================================================*/
	
	
	// 현재 공고 현황 조회
	public Map<String, Integer> selectRecruitmentStatus(int businessNo) {
		return businessDao.selectRecruitmentStatus(businessNo);
	}
	
	// 진행중인 공고 목록 조회
	@Override
	public List<Recruitment> selectListProgressRecruitment(int businessNo) {
		return businessDao.selectListProgressRecruitment(businessNo);
	}
	
	// 대기중인 공고 목록 조회
	@Override
	public List<Recruitment> selectListStandByRecruitment(int businessNo) {
		return businessDao.selectListStandByRecruitment(businessNo);
	}
		
	// 임시저장한 공고 목록 조회
	@Override
	public List<Recruitment> selectListTemporaryRecruitment(int businessNo) {
		return businessDao.selectListTemporaryRecruitment(businessNo);
	}
	
	// 마감된 공고 목록 조회
	@Override
	public List<Recruitment> selectListEndRecruitment(int businessNo) {
		return businessDao.selectListEndRecruitment(businessNo);
	}
	
	// 공고 정보 불러오기
	@Override
	public Recruitment selectJobPosting(int businessNo, int recruitmentNo) {
		return businessDao.selectJobPosting(businessNo, recruitmentNo);
	}
	
	// 공고 삭제
	@Override
	public int deleteRecruitment(int recruitmentNo) {
		return businessDao.deleteRecruitment(recruitmentNo);
	}
	
	
	/*=====================================================================================================*/
	
	// 지원자 현황 조회
	@Override
	public Map<String, Integer> selectApplicantsDashboard(int businessNo, int recruitmentNo) {
		return businessDao.selectApplicantsDashboard(businessNo, recruitmentNo);
	}
	
	// 포지션 목록 조회
	@Override
	public List<Position> selectPositionList(int businessNo, int recruitmentNo) {
		return businessDao.selectPositionList(businessNo, recruitmentNo);
	}
	
	// 포지션 현황 조회
	@Override
	public List<Position> selectPositionDashboard(List<Position> positionList) {
		return businessDao.selectPositionDashboard(positionList);
	}
	
	// 포지션 상세 조회
	@Override
	public Position selectPositionDetail(int recruitmentNo, int positionNo) {
		return businessDao.selectPositionDetail(recruitmentNo, positionNo);
	}
	
	// 지원자 목록 조회
	@Override
	public List<Applicants> selectApplicantsList(int recruitmentNo, int positionNo, int stagyNo) {
		return businessDao.selectApplicantsList(recruitmentNo, positionNo, stagyNo);
	}
	
	
	/*=====================================================================================================*/
	

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

	
	/*=====================================================================================================*/
	

}
