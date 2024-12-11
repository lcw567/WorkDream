package com.cs.workdream.business.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.model.vo.Recruitment;

@Repository
public class BusinessDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	
	/*=====================================================================================================*/
	
	
	// 현재 공고 현황 조회
	public Map<String, Integer> selectRecruitmentStatus(int businessNo) {
        return sqlSession.selectOne("businessMapper.selectRecruitmentStatus", businessNo);
    }
	
	// 진행중인 공고 목록 조회
	public List<Recruitment> selectListProgressRecruitment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListProgressRecruitment", businessNo);
	}
	
	// 대기중인 공고 목록 조회
	public List<Recruitment> selectListStandByRecruitment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListStandByRecruitment", businessNo);
	}
	
	// 임시저장한 공고 목록 조회
	public List<Recruitment> selectListTemporaryRecruitment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListTemporaryRecruitment", businessNo);
	}
	
	// 마감된 공고 목록 조회
	public List<Recruitment> selectListEndRecruitment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListEndRecruitment", businessNo);
	}
	
	// 공고 삭제
	public int deleteRecruitment(int recruitmentNo) {
		return sqlSession.delete("businessMapper.deleteRecruitment", recruitmentNo);
	}
	
	
	/*=====================================================================================================*/
	
	
	// 지원자 현황 조회
	public Map<String, Integer> selectApplicantsDashboard(int businessNo, int recruitmentNo) {
		if(recruitmentNo == 0) {
			// 전체 조회
			return sqlSession.selectOne("businessMapper.selectAllApplicantsDashboard", businessNo);
		} else {
			// 특정 공고 조회
			Map<String, Integer> numbers = new HashMap<>();
			numbers.put("businessNo", businessNo);
			numbers.put("recruitmentNo", recruitmentNo);
			
			return sqlSession.selectOne("businessMapper.selectApplicantsDashboard", numbers);
		}
	}
	
	// 포지션 목록 조회
	public List<Position> selectPositionList(int businessNo, int recruitmentNo) {
		if(recruitmentNo == 0) {
			// 전체 조회
			return sqlSession.selectList("businessMapper.selectAllPositionList", businessNo);
		} else {
			// 특정 공고 조회
			Map<String, Integer> numbers = new HashMap<>();
			numbers.put("businessNo", businessNo);
			numbers.put("recruitmentNo", recruitmentNo);
			
			return sqlSession.selectList("businessMapper.selectPositionList", numbers);
		}
	}
	
	// 포지션 현황 조회
	public List<Position> selectPositionDashboard(List<Position> positionList) {
		// positionNo으로 조회 > 조회된 값을 다시 추가
		 for (Position position : positionList) {
			Map<String, Integer> numbers = new HashMap<>();
			numbers.put("recruitmentNo", position.getRecruitmentNo());
			numbers.put("positionNo", position.getPositionNo());
			
			Position p = sqlSession.selectOne("businessMapper.selectPositionDashboard", numbers);
			
			position.setTotalPeople(p.getTotalPeople());
			position.setViewPeople(p.getViewPeople());
			position.setEvaluationPeople(p.getEvaluationPeople());
			position.setPassPeople(p.getPassPeople());
		 }
		
		return positionList;
	}
	
	// 포지션 상세 조회
	public Position selectPositionDetail(int recruitmentNo, int positionNo) {
		Map<String, Integer> numbers = new HashMap<>();
		numbers.put("recruitmentNo", recruitmentNo);
		numbers.put("positionNo", positionNo);
		
		// 상세 조회
		Position positionDetail = sqlSession.selectOne("businessMapper.selectPositionDetail", numbers);
		
		// 현황 정보 추가
		Position p1 = sqlSession.selectOne("businessMapper.selectPositionDashboard", numbers);
		positionDetail.setTotalPeople(p1.getTotalPeople());
		positionDetail.setViewPeople(p1.getViewPeople());
		positionDetail.setEvaluationPeople(p1.getEvaluationPeople());
		positionDetail.setPassPeople(p1.getPassPeople());
		
		// 전형 정보 추가
		numbers.put("stagyNo", positionDetail.getStagyNo());
		Position p2 = sqlSession.selectOne("businessMapper.selectPositionStagy", numbers);
		positionDetail.setStagyName(p2.getStagyName());
		positionDetail.setStagyStart(p2.getStagyStart());
		positionDetail.setStagyEnd(p2.getStagyEnd());
		
		return positionDetail;
	}
	
	// 지원자 목록 조회
	public List<Applicants> selectApplicantsList(int recruitmentNo, int positionNo, int stagyNo) {
		Map<String, Integer> numbers = new HashMap<>();
		numbers.put("recruitmentNo", recruitmentNo);
		numbers.put("positionNo", positionNo);
		numbers.put("stagyNo", stagyNo);
		
		return sqlSession.selectList("businessMapper.selectApplicantsList", numbers);
	}
	
	
	/*=====================================================================================================*/
	

	// 즐겨찾기 목록 조회
	public List<BusinessBookmark> loadBookmarkList(int businessNo) {
		return sqlSession.selectList("businessMapper.loadBookmarkList", businessNo);
	}

	// 즐겨찾기 목록에서 삭제
	public int deleteBookmarkList(int businessNo, int resumeNo) {
		Map<String, Integer> numbers = new HashMap<>();
		numbers.put("businessNo", businessNo);
		numbers.put("resumeNo", resumeNo);
		
		return sqlSession.delete("businessMapper.deleteBookmarkList", numbers);
	}

	// 즐겨찾기 그룹 분류 수정
	public int updateBookmarkFolder(BusinessBookmark bookmark, String type, int folder) {
		Map<String, Object> data = new HashMap<>();
		data.put("bookmark", bookmark);
		data.put("type", type);
		data.put("folder", folder);
		
		return sqlSession.update("businessMapper.updateBookmarkFolder", data);
	}

	// 즐겨찾기 그룹 추가
	public int insertFolder(int businessNo, String folderName) {
		Map<String, Object> data = new HashMap<>();
		data.put("businessNo", businessNo);
		data.put("folderName", folderName);
		
		return sqlSession.insert("businessMapper.insertFolder", data);
	}

	// 즐겨찾기 그룹 편집
	public int updateFolder(int businessNo, int folder, int order, String folderName) {
		Map<String, Object> data = new HashMap<>();
		data.put("businessNo", businessNo);
		data.put("folder", folder);
		data.put("order", order);
		data.put("folderName", folderName);
		
		return sqlSession.update("businessMapper.updateFolder", data);
	}

	// 즐겨찾기 그룹 삭제
	public int deleteFolder(int businessNo, int folder) {
		Map<String, Integer> numbers = new HashMap<>();
		numbers.put("businessNo", businessNo);
		numbers.put("resumeNo", folder);
		
		return sqlSession.delete("businessMapper.deleteFolder", numbers);
	}


}
