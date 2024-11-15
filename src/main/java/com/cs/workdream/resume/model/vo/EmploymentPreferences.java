package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmploymentPreferences {

	private Integer employmentPreferencesNo; // 기본 키
    private Integer resumeNo;                // 외래 키
    private int personNo;                    // 외래 키
    private String marriageReason;           // 보훈사유
    private String serviceStatus;            // 병역 상태
    private Date enlistmentDate;             // 입대일
    private Date dischargeDate;              // 전역일
    private String militaryBranch;           // 군별
    private String rank;                     // 계급
    private String dischargeReason;          // 전역 사유
    private String exemptionReason;          // 면제 사유
    private String unfinishedReason;         // 미필 사유  
}
