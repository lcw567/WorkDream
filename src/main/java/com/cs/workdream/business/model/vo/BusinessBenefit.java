package com.cs.workdream.business.model.vo;

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
public class BusinessBenefit {
    private int businessNo; // 비즈니스 번호
    private String benefit; // 복리후생 내용
}
