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
public class BasicInfo {
    private Integer basicNo; // basic_no
    private Integer resumeNo; // resume_no
    private int personNo; // person_no
    private String user_name; // user_name
    private String user_gender; // user_gender

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate user_birth; // user_birth

    private String user_email; // user_email
    private String user_phone; // user_phone
    private String user_address; // user_address
    private String usernumberaddress; // user_road_address
    private String userroadaddress;
    private String user_detailaddress; // user_detail_address
    private String user_Pic; // user_pic
}

