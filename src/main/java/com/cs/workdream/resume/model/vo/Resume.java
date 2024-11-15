package com.cs.workdream.resume.model.vo;

import java.sql.Date;
import java.util.List;

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
public class Resume {

	private int resume_no;
	private int person_no;
	private String title;
	private Date create_date;
	private Date modified_date;
	private char deleted;
	
	private List<BasicInfo> basicInfo;
    private List<AcademicAbility> academicAbilities;
    private List<Qualification> qualification;
    private List<Experience> experiences;
    private EmploymentPreferences employmentPreference;
    private List<Skill> skills;
    private List<Career> careers;

}
