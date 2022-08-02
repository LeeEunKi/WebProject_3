package com.sist.vo;
/*
			 * 이름      널?       유형            
			------- -------- ------------- 
			NO      NOT NULL NUMBER        
			TITLE   NOT NULL VARCHAR2(500) 
			SUBJECT NOT NULL VARCHAR2(500) 
			POSTER  NOT NULL VARCHAR2(500) 
 * 
 */
public class CategoryVO {
	int no;
	String title,subject,poster;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
}
