package com.cs.workdream.business.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Recruitment {
	private int recruitmentNo;			// 공고 고유키
	private int businessNo;				// 기업 고유키
	
	private String companyName;			// 기업 이름
	private String managerName;			// 담당자 이름
	private String managerDept;			// 담당자 부서
	private String managerEmail;		// 담당자 이메일
	
	private String method;				// 모집 방식(워크드림 이력서: W / 자사 홈페이지 지원: H)
	private String site;				// 모집 사이트(기본 기업 사이트 / 자사 홈페이지 지원 시에 사용)
	private String logo;				// 로고 경로
	
	private String title;				// 공고 제목
	private String startDate;			// 공고 시작일 (공고 공개 시작일)
	private String deadline;			// 공고 마감일 (공고 공개 종료일)
	private String postingDate;			// 공고 게시일 (공고 작성일)
	private String contentImg;			// 공고 이미지
	private String contextText;			// 공고 내용(텍스트)
	
	private List<Position> positions;	// 포지션 리스트
	
	private String status;				// 공고 상태 (임시저장: T / 대기중: S / 진행중: P / 마감: E)
	private String deleteStatus;		// 공고 삭제 여부 (삭제: Y / 미삭제: N)
}
