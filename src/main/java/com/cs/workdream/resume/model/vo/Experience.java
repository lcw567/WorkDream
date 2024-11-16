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
public class Experience {
    private Integer experienceNo;
    private Integer resumeNo;
    private int personNo;
    private String activityType;
    private String organizationName;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate startDate;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate endDate;

    private String description;
}

