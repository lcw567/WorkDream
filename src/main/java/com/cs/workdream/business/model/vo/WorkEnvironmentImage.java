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
public class WorkEnvironmentImage {
    private int workEnvironmentImageNo; // 근무 환경 이미지 번호
    private int businessNo; // 비즈니스 번호
    private String imageUrl; // 이미지 URL
    private String title; // 이미지 제목
}
