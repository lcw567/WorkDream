package com.cs.workdream.resume.model.vo;

import java.sql.Date;
import java.time.YearMonth;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qualification {
    private Integer qualificationNo; // qualification_no
    private Integer resumeNo; // resume_no
    private int personNo; // person_no
    private String category; // category
    private String name; // name
    private String issuingAgency; // issuing_agency
    private Integer proficiencyLevel; // proficiency_level
    private String languageType; // language_type
    private String passStatus; // pass_status
    private String award_name;
    private String organizer;
    private Date arwrd_date;

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth issueDate; // issue_date
}
