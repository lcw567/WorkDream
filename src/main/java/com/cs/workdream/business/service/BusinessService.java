package com.cs.workdream.business.service;

import java.util.List;
import java.util.Map;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.model.vo.Recruitment;

public interface BusinessService {
	
	// 현재 공고 현황 조회
	Map<String, Integer> selectRecruitmentStatus(int businessNo);
	
	// 진행중인 공고 목록 조회
	List<Recruitment> selectListProgressRecruitment(int businessNo);
	
	// 대기중인 공고 목록 조회
	List<Recruitment> selectListStandByRecruitment(int businessNo);
	
	// 임시저장한 공고 목록 조회
	List<Recruitment> selectListTemporaryRecruitment(int businessNo);
	
	// 마감된 공고 목록 조회
	List<Recruitment> selectListEndRecruitment(int businessNo);
	
	// 공고 정보 불러오기
	Recruitment selectJobPosting(int businessNo, int recruitmentNo);
	
	// 공고 삭제
	int deleteRecruitment(int recruitmentNo);
	
	
	/*=====================================================================================================*/

	// 지원자 현황 조회
	Map<String, Integer> selectApplicantsDashboard(int businessNo, int recruitmentNo);

	// 포지션 목록 조회
	List<Position> selectPositionList(int businessNo, int recruitmentNo);
	
	// 포지션 현황 조회
	List<Position> selectPositionDashboard(List<Position> positionList);
	
	// 포지션 상세 조회
	Position selectPositionDetail(int recruitmentNo, int positionNo);
	
	// 지원자 목록 조회
	List<Applicants> selectApplicantsList(int recruitmentNo, int positionNo, int stagyNo);
	
	
	/*=====================================================================================================*/

	
	// 즐겨찾기 목록 조회
	List<BusinessBookmark> loadBookmarkList(int businessNo);

	// 즐겨찾기 목록에서 삭제
	int deleteBookmarkList(int businessNo, int resumeNo);

	// 즐겨찾기 그룹 분류 수정
	int updateBookmarkFolder(BusinessBookmark bookmark, String type, int folder);

	// 즐겨찾기 그룹 추가
	int insertFolder(int businessNo, String folderName);

	// 즐겨찾기 그룹 편집
	int updateFolder(int businessNo, int folder, int order, String folderName);

	// 즐겨찾기 그룹 삭제
	int deleteFolder(int businessNo, int folder);

	
	/*=====================================================================================================*/



}
