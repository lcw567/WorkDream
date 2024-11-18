package com.cs.workdream.board.model.vo;

import java.sql.Timestamp;
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
public class Reply {
    private Integer replyNo;     
    private Integer postingNo;    
    private Integer userNo;      
    private String content;  
    private Timestamp createdTime;
    private Integer likeCount;      
    private String status;     
    private String author;
}
