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
public class Experience {
    private Integer experienceNo; // experience_no
    private Integer resumeNo; // resume_no
    private int personNo; // person_no
    private String activity_type; // activity_type
    private String organization_name; // organization_name

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate start_date; // start_date

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate end_date; // end_date

    private String description; // description
}

