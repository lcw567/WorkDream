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
public class AcademicAbility {
    private Integer academicNo;         // 기본 키
    private Integer resumeNo;           // 외래 키
    private int personNo;               // 외래 키
    private String educationLevel;
    private String academicName;
    private String major;
    private String degree;
    private String graduationStatus;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate enterDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate graduationDate;

    private String location;
    private Character examPassed;
}

