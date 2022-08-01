package com.sist.dao;


import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class PlaceDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//경로를 src/main/java까지 자동으로 인식한다. 그러니까 src/main/java에 Config.xml을 두면 자동으로 인식 가능함!
			ssf = new SqlSessionFactoryBuilder().build(reader); //xml파일 파싱
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO:getConnection() ERROR");
		}
	}
	
	public static List<PlaceVO> placeListData(Map map){
		//ssf가 Connection 역할 SqlSession이 PreparedStatement역할 
		SqlSession session = null; 
		List<PlaceVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("placeListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO:placeListData(Map map) ERROR");
		}finally {
			if(session != null)
				session.close();
		}
		return list;
	}
	
	public static int placeTotalPage(int tno){
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("placeTotalPage",tno);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO:placeTotalPage(int) ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	public static String placeTypeName(int tno) {
		SqlSession session = null;
		String type="";
		try {
			session = ssf.openSession();
			type = session.selectOne("placeTypeName",tno);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO:placeTypeName(int) ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return type;
	}
	
	//	<select id="recommendPlaceList" resultType="PlaceVO">
	public static List<PlaceVO> recommendPlaceList(){
		SqlSession session =null;
		List<PlaceVO> list= null;
		try {
			session=ssf.openSession();
			list=session.selectList("recommendPlaceList");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("recommendPlaceList() : Error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
}
