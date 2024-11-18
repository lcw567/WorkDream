package com.cs.workdream.business.model.vo;

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
public class JobPosting1 {
    private int recruitmentNo;        // 채용 번호
    private int businessNo;           // 기업 번호
    private String representativeName; // 대표 이름
    private String representativeDept; // 대표 부서
    private String representativeEmail; // 대표 이메일
    private String companyName;       // 기업명
    private String website;           // 홈페이지 주소
    private String logoPath;          // 로고 경로
}

