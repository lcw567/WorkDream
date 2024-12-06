package com.cs.workdream.portfolio.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 포트폴리오 모델 클래스
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Portfolio {
    private Integer portfolioId;
    private int userNo;
    private String title;
    private String content;
    private Date createDate;
    private Date updateDate;
    private String status;
    private Integer resumeNo;
}
