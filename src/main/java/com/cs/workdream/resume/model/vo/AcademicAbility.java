package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class AcademicAbility {
    private Integer academic_no; // 기본 키
    private Integer resume_no;   // 외래 키
    private int person_no;       // 외래 키
    private String education_level;
    private String academic_name;
    private String major;
    private String degree;
    private String graduation_status;
    private Date enter_date;
    private Date graduation_date;
    private String location;
    private Character exam_passed;
}
