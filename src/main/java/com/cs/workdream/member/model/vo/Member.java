package com.cs.workdream.member.model.vo;

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
public class Member {
	private int userNo;
	private String userType;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String status;
	private int businessNo;
	private int personNo;
}
