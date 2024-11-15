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
public class BasicInfo {

	private Integer basic_no;
    private Integer resume_no;
    private int person_no;
	private String user_name;
	private String user_gender;
	private Date user_birth;
	private String user_email;
	private String user_phone;
	private String user_address;
	private String user_roadaddress;
	private String user_detailaddress;
	private String user_pic;
	
}
