package com.cs.workdream.resume.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Resume {
    private Integer resumeNo; // resume_no
    private Integer personNo; // person_no
    private String resumeTitle; // resume_title
    private Date createDate; // create_date
    private Date modifiedDate; // modified_date
    private char deleted; // deleted

    private List<BasicInfo> basicInfo = new ArrayList<>();
    private List<AcademicAbility> academicAbilities = new ArrayList<>();
    private List<Qualification> qualifications = new ArrayList<>();
    private List<Experience> experiences = new ArrayList<>();
    private EmploymentPreferences employmentPreferences;
    private List<Skill> skills = new ArrayList<>();
    private List<Career> careers = new ArrayList<>();

}