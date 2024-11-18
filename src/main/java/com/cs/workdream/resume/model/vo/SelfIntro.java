package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SelfIntro {

	private Integer selfintroNo;
	private Integer resumeNo;
	private String userId;
	private String introTitle;
	private String introContent;
	private Date createDate;
	private Date modifiedDae;
	private char deleted;
	private Integer personNo;
}
