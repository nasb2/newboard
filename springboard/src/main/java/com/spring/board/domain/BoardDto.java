package com.spring.board.domain;

import java.util.Date;

public class BoardDto {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	
	public BoardDto() {}
	
	public BoardDto(String title, String content, String writer ) {
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + "]";
	}
}
