package com.cs.workdream.resume.model.vo;

import java.time.YearMonth;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcademicAbility {
    private Integer academicNo; // academic_no
    private Integer resumeNo; // resume_no
    private int personNo; // person_no
    private String education_level; // education_level
    private String academic_name; // academic_name
    private String major_name; // major
    private String degree; // degree
    private String graduation_status; // graduation_status

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth enter_date; // enter_date

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth end_date; // graduation_date

    private String select_lo; // location
    private Character exam_passed; // exam_passed
}
