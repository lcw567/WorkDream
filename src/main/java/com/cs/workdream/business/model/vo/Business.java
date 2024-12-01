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
public class Business {
    private int businessNo; // 비즈니스 번호
    private String registrationNumber; // 사업자등록번호 추가
    private String ownerName; // 대표자명
    private String companyName; // 회사명
    private Integer companyCode; // 회사 코드
    private String companyTel; // 회사 전화번호
    private String companyAddr; // 회사 주소
    private String companyFax; // 회사 팩스번호
    private String companySite; // 회사 홈페이지
    private String logo; // 회사 로고 URL
    private String shortIntroduction; // 기업 한줄 소개
    private String introduction; // 기업 소개
    private String vision; // 기업 비전
    private String companyType; // 기업 형태
    private Integer employeeCount; // 직원 수
    private String industry; // 업종
    private String brandName; // 브랜드명
    private List<BusinessBenefit> benefits; // 복리후생 목록
    private List<WorkEnvironmentImage> workEnvironmentImages; // 근무 환경 이미지 목록
    
    // 현재 지원자 현황용
    private int recuritmentProgressCount;
    private int applicantsTotal;
    private int passCount;
    private int bookmarkTotal;
}
