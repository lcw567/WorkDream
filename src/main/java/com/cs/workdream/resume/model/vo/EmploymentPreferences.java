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
public class EmploymentPreferences {
    private Integer employmentPreferencesNo; // employment_preferences_no
    private Integer resumeNo; // resume_no
    private int personNo; // person_no
    private String marriageReason; // marriage_reason
    private String serviceStatus; // service_status

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate enlistmentDate; // enlistment_date

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dischargeDate; // discharge_date

    private String militaryBranch; // military_branch
    private String rank; // rank
    private String dischargeReason; // discharge_reason
    private String exemptionReason; // exemption_reason
    private String unfinishedReason; // unfinished_reason
}
