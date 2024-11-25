package com.cs.workdream.business.model.vo;

import java.util.List;

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
	
	/* JOB_POSITION 관련 */
	private int positionNo;			// 포지션 고유키
	private int recuritmentNo;		// 채용공고 고유키
	private String positionName;	// 채용 포지션 이름
	private String positionRank;	// 채용 포지션 직위 (ex. 신입, 대리, 팀장, ...)
	private String employmentForm;	// 고용 형태 (정규직: R / 계약직: C)
	private int recuitedPeople;		// 채용 인원
	
	private int viewPeople;			// 열람완료 수
	private int evaluationPeople;	// 평가완료 수
	private int passPeople;			// 합격자 수
	
	/* JOB_STAGY 관련 */
	private List<Stagy> stagys;		// 전형 단계 리스트
}
