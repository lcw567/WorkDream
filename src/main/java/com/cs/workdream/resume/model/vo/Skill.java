package com.cs.workdream.resume.model.vo;

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
public class Skill {

    private Integer skill_no;      // 스킬번호
    private Integer resume_no;     // 이력서번호
    private int person_no;     // 개인번호
    private String skill_name; // 스킬명

}
