package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qualification {
	
    private String category;         // 구분 (자격증, 어학, 수상)
    private String name;             // 자격증명, 어학시험명, 수상명
    private String issuingAgency;    // 발행처/기관
    private Integer proficiencyLevel; // 급수 (어학에만 사용)
    private String languageType;     // 언어 종류 (어학에만 사용)
    private String passStatus;       // 합격 구분 (자격증에만 사용)
    private Date issueDate;          // 발급일자/수상일자
}
