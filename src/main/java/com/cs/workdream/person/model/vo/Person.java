package com.cs.workdream.person.model.vo;

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
public class Person {
	private int personNo;		// 개인 고유키
	private String name;		// 이름
	private String birthday;	// 생일
	private String gender;		// 성별
	private String address;		// 주소
}
