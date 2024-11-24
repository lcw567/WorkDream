package com.cs.workdream.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cs.workdream.business.model.vo.Applicants;

@Repository
public class BusinessDao {

	// 지원자 현황 조회
	public Applicants inquireAppStatus(SqlSessionTemplate sqlSession, int recruitmentNo) {
		// DB 추가하고 다시 수정 + Applicants 대신 list 사용 검토
		// 총 지원자 수 / 열람완료 수 / 평가완료 수 / 합격자 수 / 열람미완료 수 > status 조회로 int에 저장
		// 지원 목록 > list 사용해서 저장 또는 객체 새로 생성
		return null;
	};
	
	// 지원자 목록 조회
	public List loadAppList(SqlSessionTemplate sqlSession, int recruitmentNo, int positionNo) {
		// list<Applicants>로 저장
		return null;
	}

}
