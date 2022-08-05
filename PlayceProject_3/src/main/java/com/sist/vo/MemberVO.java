package com.sist.vo;
/*
		 *  이름       널?       유형             
			-------- -------- -------------- 
			ID       NOT NULL VARCHAR2(30)   
			PWD      NOT NULL VARCHAR2(30)   
			NAME     NOT NULL VARCHAR2(34)   
			SEX      NOT NULL VARCHAR2(10)   
			BIRTHDAY          DATE           
			EMAIL             VARCHAR2(100)  
			POST              VARCHAR2(30)   
			ADDR1             VARCHAR2(1000) 
			ADDR2             VARCHAR2(1000) 
			TEL               VARCHAR2(30)   
			CONTENT           CLOB           
			ADMIN             VARCHAR2(1)    
			CONN              VARCHAR2(1)    
 */
public class MemberVO {
	String id,pwd,name,sex,email,post,addr1,addr2,tel,admin,conn;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getConn() {
		return conn;
	}

	public void setConn(String conn) {
		this.conn = conn;
	}
	
}
