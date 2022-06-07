package com.company.shop.qnabean;

public class QnaDto {
	int qnaNum;
	String title;
	String content;
	String id;
	String qdate;
	
	public QnaDto() {
		super();
	}
	
	public QnaDto(int qnaNum, String title, String content, String id, String qdate) {
		super();
		this.qnaNum = qnaNum;
		this.title = title;
		this.content = content;
		this.id = id;
		this.qdate = qdate;
	}
	
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	
	
}
