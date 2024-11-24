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
public class Applicants {
	private int applicantsNo;			// 지원자 고유키
	private int recuritmentNo;			// 채용공고 고유키
	private int positionNo;				// 채용 포지션 고유키
	private int resumeNo;				// 이력서 고유키
	private String applicantsDate;		// 지원일
	private String resumeStatus;		// 이력서 상태 (Y: 열람 가능 / N: 열람 불가능)
	private int score;					// 평가 점수
	private String memo;				// 지원자 평가 메모
	private String applicationStatus;	// 지원 상태
	private String passStatus;			// 합격 상태
	
	/* DB와 관계없이 사용할 변수 */
	private int totalApplicants;		// 총 지원자 수
}