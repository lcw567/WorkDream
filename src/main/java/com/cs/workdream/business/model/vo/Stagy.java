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
public class Stagy {
	private int stagyNo;		
	private int recuritmentNo;	// 채용공고 고유키
	private int positionNo;		// 포지션 고유키
	private String stagyName;	// 전형 단계 이름
	private String startDate;	// 전형 시작일 (YYYY.MM.DD)
	private String endDate;		// 전형 종료일
	private String status;		// 진행 상태 (전형 미진행: N / 전형 진행중: P / 전형 종료: E)
}
