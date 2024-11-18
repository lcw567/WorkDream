package com.cs.workdream.business.model.vo;

import java.sql.Timestamp;
import java.util.Date;

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
public class JobPosting2 {

    private int recruitmentNo;  // 채용 번호
    private int businessNo;     // 기업 번호
    private char method;        // 채용 방법
    private String title;       // 채용 제목
    private String contentImg;  // 내용 이미지
    private String contentText; // 내용 텍스트
    private Timestamp startDate; // 채용 시작일
    private Timestamp deadline;  // 채용 마감일
    private Date postingDate;    // 게시일
}
