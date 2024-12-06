package com.cs.workdream.business.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Applicants;
import com.cs.workdream.business.model.vo.ApplicantsStatus;
import com.cs.workdream.business.model.vo.BusinessBookmark;
import com.cs.workdream.business.model.vo.Position;
import com.cs.workdream.business.model.vo.Recuritment;

@Repository
public class BusinessDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	
	/*=====================================================================================================*/
	
	// 현재 공고 현황 조회
	public Map<String, Integer> selectRecuritmentStatus(int businessNo) {
        return sqlSession.selectOne("businessMapper.selectRecuritmentStatus", businessNo);
    }
	
	// 진행중인 공고 목록 조회
	public List<Recuritment> selectListProgressRecuritment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListProgressRecuritment", businessNo);
	}
	
	// 대기중인 공고 목록 조회
	public List<Recuritment> selectListStandByRecuritment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListStandByRecuritment", businessNo);
	}
	
	// 임시저장한 공고 목록 조회
	public List<Recuritment> selectListTemporaryRecuritment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListTemporaryRecuritment", businessNo);
	}
	
	// 마감된 공고 목록 조회
	public List<Recuritment> selectListEndRecuritment(int businessNo) {
		return sqlSession.selectList("businessMapper.selectListEndRecuritment", businessNo);
	}

	// 지원자 현황 조회
	public ApplicantsStatus inquireAppsStatus(int recruitmentNo) {
		return sqlSession.selectOne("businessMapper.inquireAppsStatus", recruitmentNo);
	};
	
	// 포지션 목록 조회(현황 페이지용)
	public List<Position> inquirePositionList(int recruitmentNo) {
		return sqlSession.selectList("businessMapper.inquirePositionList", recruitmentNo);
	}
	
	// 지원자 목록 조회
	public List<Applicants> loadAppList(int recruitmentNo, int positionNo) {
		// list<Applicants>로 저장
		return null;
	}

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
