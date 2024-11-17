package com.cs.workdream.resume.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Skill {
    private Integer skillNo; // skill_no
    private Integer resumeNo; // resume_no
    private Integer personNo; // person_no (int → Integer)
    private String skill_name; // skill_name
}
