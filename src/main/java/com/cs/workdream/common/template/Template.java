package com.cs.workdream.common.template;

import com.cs.workdream.common.vo.PageInfo;

public class Template {
	
	// 페이징바 설정
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		// 가장 마지막 페이지
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// 페이징바 시작 번호
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		
		// 페이징바 마지막 번호
		int endPage = startPage + pageLimit - 1;	
		
		endPage = endPage > maxPage ? maxPage : endPage;
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}
}
