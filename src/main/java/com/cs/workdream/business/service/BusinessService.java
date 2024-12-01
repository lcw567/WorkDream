package com.cs.workdream.business.service;

import java.util.List;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.Business;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;

public interface BusinessService {

	// 지원자 현황 조회
	ApplicantsStatus inquireAppsStatus(int recruitmentNo);

	// 포지션 목록 조회(현황 페이지용)
	List<Position> inquirePositionList(int recruitmentNo);
	
	// 지원자 목록 조회
	List<Applicants> loadAppList(int recruitmentNo, int positionNo);

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

}
