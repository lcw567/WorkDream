package com.cs.workdream.resume.model.vo;

import java.time.YearMonth;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Qualification {
    private Integer qualificationNo;
    private Integer resumeNo;
    private int personNo;
    private String category;
    private String name;
    private String issuingAgency;
    private Integer proficiencyLevel;
    private String languageType;
    private String passStatus;

    @DateTimeFormat(pattern = "yyyy-MM") // 날짜 형식을 yyyy-MM으로 설정
    private YearMonth issueDate;
}
