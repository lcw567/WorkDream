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
public class ApplicantsStatus {
	private int total;					// 전체 지원자 수
	private int viewComplete;			// 이력서 열람완료 수
	private int viewNotFinished;		// 이력서 미열람 수
	private int evaluationComplete;		// 평가 완료 수
	private int passTotal;				// 총 합격자 수
}