package com.cs.workdream.business.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Position {
	private int positionNo;			// 포지션 고유키
	private int recruitmentNo;		// 채용공고 고유키
	private String positionName;	// 채용 포지션 이름
	private String positionRank;	// 채용 포지션 직위 (ex. 신입, 대리, 팀장, ...)
	private String employmentForm;	// 고용 형태 (정규직: R / 계약직: C)
	private int recruitedPeople;	// 채용 인원
	
	/* JOB_STAGY 테이블 관련 */
	private int stagyNo;			// 전형 단계 고유키
	private String stagyName;		// 전형 단계
	private String stagyStart;		// 전형 시작일 (YYYY.MM.DD)
	private String stagyEnd;		// 전형 종료일
	
	/* 대시보드에서만 사용 */
	private int totalPeople;		// 총지원자 수
	private int viewPeople;			// 열람완료 수
	private int evaluationPeople;	// 평가완료 수
	private int passPeople;			// 합격자 수
}
