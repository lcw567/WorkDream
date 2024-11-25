package com.cs.workdream.resume.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class Resume {
    // 이력서 기본 정보
    private Integer resumeNo;
    private int personNo;
    private String resumeTitle;
    private Date createDate;
    private Date modifiedDate;
    private Character deleted;

    // 기본 정보
    private String userName;
    private String userGender;
    private Date userBirth;
    private String userEmail;
    private String userPhone;
    private String userAddress;
    private String userRoadAddress;
    private String userDetailAddress;
    private String userPic;

    // 최종 학력
    private String educationLevel;
    private String academicName_el;
    private String academicName_mi;
    private String academicName_hi;
    private String academicName_col;
    private String majorName_col;
    private String degree_col;
    private String graduationStatus_el;
    private String graduationStatus_mi;
    private String graduationStatus_hi;
    private String graduationStatus_col;

    private Date enterDate_el;
    private Date graduationDate_el;
    private Date enterDate_mi;
    private Date graduationDate_mi;
    private Date enterDate_hi;
    private Date graduationDate_hi;
    private Date enterDate_col;
    private Date graduationDate_col;

    private String location_el;
    private String location_mi;
    private String location_hi;
    private String location_col;

    private String examPassed_el;
    private String examPassed_mi;
    private String examPassed_hi;

    // 경력
    private String companyTitle;
    private String work;
    private String department;
    private Date startDateWork;
    private Date endDateWork;
    private String careerStatus;
    private String jobContent;
    private String position;

    // 스킬
    private String skillName;

    // 경험/활동/교육
    private String activityType;
    private String organizationName;
    private Date startDateAct;
    private Date endDateAct;
    private String description;

    // 자격/어학/수상
    private String category;
    private String name;
    private String issuingAgency;
    private String proficiencyLevel;
    private String languageType;
    private String passStatus;
    private String awardName;
    private String organizer;
    private Date awardDate;
    private Date issueDate;

    // 취업우대사항
    private String veteranReason;
    private String serviceStatus;
    private String unfinishedReason;
    private String exemptionReason;
    private Date enlistmentDate;
    private Date dischargeDate;
    private String militaryBranch;
    private String rank;
    private String dischargeReason;
}