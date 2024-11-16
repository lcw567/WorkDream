package com.cs.workdream.resume.model.vo;

import lombok.Data;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
public class Resume {
    private Integer resumeNo;
    private Integer personNo;
    private String resumeTitle;
    private LocalDate createDate;
    private LocalDate modifiedDate;
    private char deleted;
    private String userPic;

    private List<BasicInfo> basicInfo = new ArrayList<>();
    private List<AcademicAbility> academicAbilities = new ArrayList<>();
    private List<Qualification> qualification = new ArrayList<>();
    private List<Experience> experiences = new ArrayList<>();
    private EmploymentPreferences employmentPreference;
    private List<Skill> skills = new ArrayList<>();
    private List<Career> careers = new ArrayList<>();
}

