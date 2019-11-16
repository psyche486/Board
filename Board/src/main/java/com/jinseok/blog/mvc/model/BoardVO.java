package com.jinseok.blog.mvc.model;

import java.util.Date;

public class BoardVO {

	private int bbsNo;
	private String bbsTitle;
    private String bbsContent;
    private int bbsReadCount;
    private String bbsRegdt;
    private String bbsWriter;
    private String result;
    private String searchText;
    private String searchOption;
    private String regdate;
    
	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsReadCount() {
		return bbsReadCount;
	}
	public void setBbsReadCount(int bbsReadCount) {
		this.bbsReadCount = bbsReadCount;
	}
	public String getBbsRegdt() {
		return bbsRegdt;
	}
	public void setBbsRegdt(String bbsRegdt) {
		this.bbsRegdt = bbsRegdt;
	}
	public String getBbsWriter() {
		return bbsWriter;
	}
	public void setBbsWriter(String bbsWriter) {
		this.bbsWriter = bbsWriter;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
