package com.cs.workdream.resume.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LanguageTest {
    private int languageTestId; // 수정된 필드명
    private int resumeNo;
    private String languageName;
    private String proficiencyLevel;
    private String languageType;
    private Date issueDate;
}
