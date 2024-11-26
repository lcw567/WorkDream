package com.cs.workdream.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;

@Repository
public class BusinessDao {

	// 지원자 현황 조회
	public ApplicantsStatus inquireAppsStatus(SqlSessionTemplate sqlSession, int recruitmentNo) {
		return sqlSession.selectOne("businessMapper.inquireAppsStatus", recruitmentNo);
	};
	
	// 포지션 목록 조회
	public List<Position> inquirePositionList(SqlSessionTemplate sqlSession, int recruitmentNo) {
		return sqlSession.selectList("businessMapper.inquirePositionList", recruitmentNo);
	}
	
	// 지원자 목록 조회
	public List<Applicants> loadAppList(SqlSessionTemplate sqlSession, int recruitmentNo, int positionNo) {
		// list<Applicants>로 저장
		return null;
	}

	// 즐겨찾기 목록 조회
	public List<BusinessBookmark> loadBookmarkList(SqlSessionTemplate sqlSession, int businessNo) {
		return sqlSession.selectList("businessMapper.loadBookmarkList", businessNo);
	}

	public int deleteBookmarkList(SqlSessionTemplate sqlSession, int resumeNo) {
		return 0;
	}

}
