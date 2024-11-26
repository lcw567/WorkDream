package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Award {
	
	private int awardId;
	private int resumeNo;
	private String awardName;
	private String organizer;
	private Date awardDate;
}
