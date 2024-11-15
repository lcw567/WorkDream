package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class AcademicAbility {

	 private String education_level;
	    private String acdemic_name;
	    private String major;
	    private String degree;
	    private String graduation_status;
	    private Date enter_date;
	    private Date graduation_date;
	    private String location;
	    private String exam_passed;
}
