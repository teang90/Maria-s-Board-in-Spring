package com.ict.service;

import org.springframework.stereotype.Service;

@Service("pg")
public class Page {
	
	private int cPage ; //현재 페이지
	private int numPerPage ; // 페에지당 담을 게시물의 수
	private int pagePerBlock ; // 블럭당 담을 페이지의 수
	private int totalRecord ; // 전체 게시물
	private int totalPage ; // 총 페이지 개수
	private int beginPage ; // 시작 페이지
	private int endPage ;   // 끝 페이지
	private String category ; // mariaDB로 바꾸면서 mapper에서 문제가 발생 오라클은 int값을 HashMap에 넣을 때 <String, String>으로 처리해도 괜찮았는데, 마리아디비는 아닌가보다. 오류에 ''1''이런식으로 떴음, 즉 int에 스트링 처리하면서 ''가 붙은게 마리아 디비에서는 처리가 안되었나보다...
	private int begin ; //마리아db limit기능 편하게 사용하기위해 (offset 역할)
	
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getcPage() {
		return cPage;
	}
	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
