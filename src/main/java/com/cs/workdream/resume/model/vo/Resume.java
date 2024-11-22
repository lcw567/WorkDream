package com.cs.workdream.resume.model.vo;


import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Resume {
    // 이력서 기본 정보
    private Integer resumeNo;
    private int personNo;
    private String resumeTitle;
    private LocalDate createDate;
    private LocalDate modifiedDate;
    private Character deleted;

    // 기본 정보
    private String userName;
    private String userGender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date userBirth;
    private String userEmail;
    private String userPhone;
    private String userAddress;
    private String userRoadAddress;
    private String userDetailAddress;
    private String userPic; // 파일명 저장

    // 최종 학력
    private String educationLevel;
    private String academicName_el;
    private String academicName_mi;
    private String academicName_hi;
    private String academicName;
    private String majorName;
    private String degree;
    private String graduationStatus_el;
    private String graduationStatus_mi;
    private String graduationStatus_hi;
    private String graduationStatus;
    private YearMonth enterDate;
    private YearMonth graduationDate;
    private String location_el;
    private String location_mi;
    private String location_hi;
    private String location;
    private Character examPassed_el;
    private Character examPassed_mi;
    private Character examPassed_hi;

    // 경력
    private String companyTitle;
    private String work;
    private String department;
    private YearMonth startDateWork;
    private YearMonth endDateWork;
    private String careerStatus;
    private String jobContent;
    private String position;

    // 스킬
    private String skillName;

    // 경험/활동/교육
    private String activityType;
    private String organizationName;
    private YearMonth startDateAct;
    private YearMonth endDateAct;
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
    private LocalDate awardDate;
    private YearMonth issueDate;

    // 취업우대사항
    private String veteranReason;
    private String serviceStatus;
    private String unfinishedReason;
    private String exemptionReason;
    private YearMonth enlistmentDate;
    private YearMonth dischargeDate;
    private String militaryBranch;
    private String rank;
    private String dischargeReason;
}
