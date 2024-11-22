package com.cs.workdream.resume.model.vo;

import java.sql.Date;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Resume {
	//이력서제목
    private Integer resumeNo; // resume_no
    private Integer personNo; // person_no
    private String resumeTitle; // resume_title
    private Date createDate; // create_date
    private Date modifiedDate; // modified_date
    private char deleted; // deleted
    
    //기본정보
    private String user_name; // user_name
    private String user_gender; // user_gender

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate user_birth; // user_birth

    private String user_email; // user_email
    private String user_phone; // user_phone
    private String user_address; // user_address
    private String userroadaddress;
    private String user_detailaddress; // user_detail_address
    private String user_pic; // user_pic
    
    //최종 학력
    private String selectedu; // selectedu
    private String academic_name; // academic_name
    private String major_name; // major
    private String degree; // degree
    private String graduation_status; // graduation_status

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth enter_date; // enter_date

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth graduation_date; // graduation_date

    private String select_lo; // location
    private Character exam_passed; // exam_passed
    
    //경력
    private String company_title;
    private String work;
    private String department;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate startdate_work;

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate enddate_work;

    private String career_status;
    private String job_content;
    private String position;
    
    //스킬
    private String skill_name; // skill_name
    
    //경험/활동/교육
    private String activity_type; // activity_type
    private String organization_name; // organization_name

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate start_date; // start_date

    @DateTimeFormat(pattern = "yyyy-MM")
    private LocalDate end_date; // end_date

    private String description; // description
    
    //자격/어학/수상
    private String category; // category
    private String name; // name
    private String issuingAgency; // issuing_agency
    private Integer proficiencyLevel; // proficiency_level
    private String languageType; // language_type
    private String passStatus; // pass_status
    private String award_name;
    private String organizer;
    private Date arwrd_date;

    @DateTimeFormat(pattern = "yyyy-MM")
    private YearMonth issueDate; // issue_date
    
    //취업우대사항
    private String veteranreason; // marriage_reason
    private String serviceStatus; // service_status

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate enlistmentDate; // enlistment_date

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dischargeDate; // discharge_date

    private String militaryBranch; // military_branch
    private String rank; // rank
    private String dischargeReason; // discharge_reason
    private String exemptionReason; // exemption_reason
    private String unfinishedReason; // unfinished_reason
    

}