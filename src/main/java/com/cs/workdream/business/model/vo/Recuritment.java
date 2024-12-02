package com.cs.workdream.business.model.vo;

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
public class Recuritment {
	private int recuritmentNo;		// 공고 고유키
	private int businessNo;			// 기업 고유키
	private String title;			// 공고 제목
	private String managerName;		// 담당자 이름
	private String managerDept;		// 담당자 부서
	private String managerEmail;	// 담당자 이메일
	private String method;			// 지원 방식(워크드림 이력서: W / 자사 홈페이지 지원: H)
	private String startDate;		// 공고 시작 날짜
	private String deadline;		// 공고 마감 날짜
	private String postingDate;		// 공고 게시일
	private String contentImg;		// 공고 이미지
	private String contextText;		// 공고 내용(텍스트)
	private String status;			// 공고 상태 (임시저장: T / 진행중: P / 종료: E)
	
	private int totalCount;			// 전체 공고 개수
	private int tempCount;			// 임시저장한 공고 개수
	private int progressCount;		// 마감한 공고 개수
	private int endCount;
}
