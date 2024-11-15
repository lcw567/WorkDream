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
    private int replyNo;     
    private int postingNo;    
    private int userNo;      
    private String content;  
    private Timestamp createdTime;
    private int likeCount;      
    private String status;     
    private String author; 
}
