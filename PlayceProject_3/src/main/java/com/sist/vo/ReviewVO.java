package com.sist.vo;

import java.util.*;
/*
 * 	no        NUMBER,
	content   VARCHAR2(1500)		 CONSTRAINT review_content_nn NOT NULL,
	regdate   DATE    			 DEFAULT SYSDATE,
	imgname   VARCHAR(500),
	imgsize     VARCHAR(500),
	place_no  NUMBER     		 NOT NULL,
	member_id VARCHAR2(30)  		 NOT NULL,
	score	NUMBER			 CONSTRAINT review_score_nn NOT NULL,
	CONSTRAINT review_3_no_pk PRIMARY KEY(no)
	rcount NUMBER DEFAULT 0
 */
public class ReviewVO {
	private int no,place_no,score,rcount;
	private String content,imgname,imgsize,member_id,dbday,rep_image;
	private Date regdate;
	
	
	public String getRep_image() {
		return rep_image;
	}
	public void setRep_image(String rep_image) {
		this.rep_image = rep_image;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPlace_no() {
		return place_no;
	}
	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getImgsize() {
		return imgsize;
	}
	public void setImgsize(String imgsize) {
		this.imgsize = imgsize;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	 
	
}
