package com.cs.workdream.planner.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Planner {
    private Long eventId;
    private Long userNo;
    private String title;
    private String description;
    private Date startDate;
    private Date endDate;
    private String status;
}
