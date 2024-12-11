package com.cs.workdream.business.model.vo;

import java.sql.Timestamp;

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
public class JobPosting {
    private int recruitmentNo;        		// 채용 번호
    private int businessNo;           		// 기업 번호
    private String representativeName;		// 대표 이름
    private String representativeDept;		// 대표 부서
    private String representativeEmail; 	// 대표 이메일
    private String companyName;       		// 기업명
    private String website;          		// 홈페이지 주소
    private String logoPath;        		// 로고 경로
    
    private String method;       			// 채용 방법
    private String title;       // 채용 제목
    private String contentImg;  // 내용 이미지
    private String contentText; // 공고 소개 내용 텍스트
    private String majorText;	// 주요 업무 내용 텍스트
    private String qualificationText;	//자격 요건 내용 텍스트
    private String preferentialText;	//우대 사항 내용 텍스트
    private String recruitmentText;	//채용절차 내용 텍스트
    private String otherText;	//기타 안내 내용 텍스트
    private String postingDate;	//공고 게시일
    private String postingEndDate;	//공고 게시 종료일
    private Timestamp startDate; // 채용 시작일
    private Timestamp deadline;  // 채용 마감일
    private String requirements;	//지원자 입력정보 자격요건
    private String applicantsPreferential;	//지원자 입력정보 우대사항
    private String information;	//지원자 입력정보 개인정보
}

