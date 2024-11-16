package com.cs.workdream.resume.model.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class EmploymentPreferences {
    private Integer employmentPreferencesNo;
    private Integer resumeNo;
    private int personNo;
    private String marriageReason;
    private String serviceStatus;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate enlistmentDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dischargeDate;

    private String militaryBranch;
    private String rank;
    private String dischargeReason;
    private String exemptionReason;
    private String unfinishedReason;
}

