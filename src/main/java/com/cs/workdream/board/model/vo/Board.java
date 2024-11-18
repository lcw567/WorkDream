package com.cs.workdream.board.model.vo;

import java.sql.Timestamp;
import java.util.List;
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
public class Board {
    private Integer postingNo;
    private String category;
    private String title;
    private String content;
    private String imagePath;
    private String author; // USER_ID
    private Integer userNo;
    private Timestamp createdTime;
    private Integer viewCount;
    private Integer likeCount;
    private List<String> hashtags;
    private List<String> jobCategories;
    private Integer commentCount;


}
