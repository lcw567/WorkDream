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
public class Career {
	private Integer career_no;
	private Integer resume_no;
	private int person_no;
	private String company_title;
	private String work;
	private String department;
	private Date start_date;
	private Date end_date;
	private String status;
	private String job_content;
	private String position;
}
