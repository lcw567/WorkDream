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
public class Business {
	private int businessNo;			// 기업 고유키
	private int registraionNumber;	// 사업자등록번호
	private String ownerName;		// 대표자명
	private String companyName;		// 회사명 (상호명)
	private int companyCode;		// 업종코드
	private String companyTel;		// 사업장 전화번호
	private String companyAddress;	// 사업장 주소
	private String companyFax;		// 사업장 팩스 주소
	private String companyType;		// 기업 형태
	private String brand;			// 브랜드명
}
