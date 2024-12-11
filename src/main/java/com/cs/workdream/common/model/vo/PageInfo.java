package com.cs.workdream.common.model.vo;

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
public class PageInfo {
	int listCount;		// 현재 총 게시글 수
	int currentPage;	// 현재 페이지 (사용자가 요청한 페이지)
	int pageLimit;		// 페이지 하단에 보여질 페이징바의 수
	int boardLimit;		// 한 페이지 내에 보여질 게시글 최대갯수
	
	int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
	int startPage;		// 페이징바의 시작수
	int endPage;		// 페이지바의 마지막 끝수
}
