package com.cs.workdream.usertags.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserTag {
    private Integer tagId;
    private Integer userNo;
    private String tagName;
    private Date createdDate;
}