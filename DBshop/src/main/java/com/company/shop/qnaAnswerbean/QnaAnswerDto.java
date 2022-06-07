package com.company.shop.qnaAnswerbean;

public class QnaAnswerDto {
   int answerNum;
   String content;
   String regdate;
   
	
	public QnaAnswerDto() {
		super();
	}
	
	public QnaAnswerDto(int answerNum, String content, String regdate) {
		super();
		this.answerNum = answerNum;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
