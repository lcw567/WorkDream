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
public class Career {
    private Integer careerNo;
    private Integer resumeNo;
    private int personNo;
    private String company_title;
    private String work;
    private String department;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate start_date;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate end_date;

    private String career_status;
    private String job_content;
    private String position;
}

