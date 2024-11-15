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
public class Experience {

	private String activity_type;     // 활동구분
    private String organization_name; // 기관/장소명
    private Date start_date;          // 시작년월
    private Date end_date;            // 종료년월
    private String description;       // 활동설명
}
