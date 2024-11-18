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
    private byte[] userPic; // 사용자 사진 (BLOB 타입)

    private List<BasicInfo> basicInfo = new ArrayList<>();
    private List<AcademicAbility> academicAbilities = new ArrayList<>();
    private List<Qualification> qualifications = new ArrayList<>();
    private List<Experience> experiences = new ArrayList<>();
    private EmploymentPreferences employmentPreferences;
    private List<Skill> skills = new ArrayList<>();
    private List<Career> careers = new ArrayList<>();

    // 단일 Qualification 접근 메소드 제거 또는 이름 변경
    // public Qualification getQualification() { ... }
    // public void setQualification(Qualification qualification) { ... }

    // 만약 단일 Qualification 접근이 꼭 필요하다면, 이름을 변경합니다.
    // 예시:
    public Qualification getFirstQualification() {
        return qualifications.isEmpty() ? null : qualifications.get(0);
    }

    public void setFirstQualification(Qualification qualification) {
        if (!qualifications.isEmpty()) {
            qualifications.set(0, qualification);
        } else {
            qualifications.add(qualification);
        }
    }
}