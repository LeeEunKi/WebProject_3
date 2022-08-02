package com.sist.vo;
/*
 * 			이름          널?       유형             
			----------- -------- -------------- 
			NO          NOT NULL NUMBER         
			HOST_NAME   NOT NULL VARCHAR2(500)  
			PRICE                NUMBER         
			ADDRESS     NOT NULL VARCHAR2(1000) 
			AREA                 VARCHAR2(100)  
			BOX                  VARCHAR2(100)  
			CAPA                 NUMBER         
			PARKING              NUMBER         
			CONTENT              CLOB           
			ETC                  CLOB           
			NNB                  VARCHAR2(100)  
			CATEGORY_NO          NUMBER         
			TYPE_NO     NOT NULL NUMBER         
			NAME                 VARCHAR2(200)  
 */
public class PlaceVO {
	int no,price,capa,parking,category_no,type_no;
	String name,host_name,address,area,box,content,etc,nnb,rep_image;
	
	public String getRep_image() {
		return rep_image;
	}
	public void setRep_image(String rep_image) {
		this.rep_image = rep_image;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCapa() {
		return capa;
	}
	public void setCapa(int capa) {
		this.capa = capa;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getType_no() {
		return type_no;
	}
	public void setType_no(int type_no) {
		this.type_no = type_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getNnb() {
		return nnb;
	}
	public void setNnb(String nnb) {
		this.nnb = nnb;
	}
}
