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
public class BusinessBookmark {
	private int businessNo;				// 기업 고유키
	private int resumeNo;				// 이력서 고유키
	private int folderNo;				// 분류 폴더 고유키
	private String name;				// 지원자 이름
	private String picture;				// 지원자 이력서 사진
	private String phone;				// 지원자 연락처(휴대번호)
	private String email;				// 지원자 이메일
	private String folder;				// 분류 폴더명
	private String resumeStatus;		// 이력서 열람 가능 여부 (열람 가능: Y / 열람 불가능: N)
	private String applicantHistory;		// 회사 지원 이력 여부 (이력있음: Y / 이력없음: N)
	private String applicantDate;		// ↑ 있다면 지원일자
	private String addDate;				// 즐겨찾기에 추가한 날짜
}