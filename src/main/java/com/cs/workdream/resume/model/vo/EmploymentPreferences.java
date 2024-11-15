package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmploymentPreferences {

	
	private String veteransReason;      // 보훈사유 입력값
    private String militaryStatus; // 병역대상 선택값

    // 'UNFULFILLED' 상태일 때
    private String unfulfilledReason;
    
    // 'EXEMPTED' 상태일 때
    private String exemptionReason;     // 면제 사유 입력값

    // 'FULFILLED' 상태일 때
    private Date enlistmentDate;   // 입대일
    private Date dischargeDate;    // 전역일
    private String militaryBranch; // 군별선택
    private String rank;             // 계급선택
    private String dischargeReason; // 전역사유 선택

    // 'SERVING' 상태일 때
    private Date servingEnlistmentDate;  // 입대일
    private Date servingDischargeDate;   // 전역일 (readonly)
    private String servingMilitaryBranch; // 군별선택
    private String servingRank;   
}
