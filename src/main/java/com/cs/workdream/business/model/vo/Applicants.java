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
	private int stagyNo;				// 전형 단계 번호
	private int resumeNo;				// 이력서 고유키
	
	private String applicantName;		// 지원자 이름
	private int age;					// 지원자 나이
	private String gender;				// 지원자 성별
	private String picture;				// 지원자 이력서 사진
	private int career;					// 경력 (연 단위)
	private String academicAbility;		// 최종 학력
	private int salary;					// 희망연봉
	private String stagy;				// 현재 전형 단계
	
	private String applicantsDate;		// 지원일
	private String resumeStatus;		// 이력서 상태 (열람 가능: Y / 열람 불가능: N)
	private int score;					// 평가 점수
	private String memo;				// 지원자 평가 메모
	private String passStatus;			// 합격 상태
	private int bookmarkStatus;			// 즐겨찾기 여부 (즐겨찾기 추가완료: 1 / 즐겨찾기 미추가: 0)
}