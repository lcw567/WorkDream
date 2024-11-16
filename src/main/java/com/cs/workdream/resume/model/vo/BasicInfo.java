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
public class BasicInfo {
    private Integer basicNo;
    private Integer resumeNo;
    private int personNo;
    private String userName;
    private String userGender;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate userBirth;

    private String userEmail;
    private String userPhone;
    private String userAddress;
    private String userRoadAddress;
    private String userDetailAddress;
    private String userPic;
}

