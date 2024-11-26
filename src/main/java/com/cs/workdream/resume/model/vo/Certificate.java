package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Certificate {
	
	private int certificateId;
	private int resumeNo;
	private String qualificationName;
	private String issuingAgency;
	private String passStatus;
	private Date testDate_cer;
}
