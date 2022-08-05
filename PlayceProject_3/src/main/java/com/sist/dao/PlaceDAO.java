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
	
	// 플레이스 목록 데이터 불러오기
	public static List<PlaceVO> placeListData(Map map){
		SqlSession session = null; 
		List<PlaceVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("placeListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO : placeListData(Map map) ERROR");
		}finally {
			if(session != null)
				session.close();
		}
		return list;
	}
	
	//플레이스 총 개수 구하기
	public static int placeTotalCount(int tno){
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("placeTotalCount",tno);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO : placeTotalCount(int) ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	//플레이스 타입 이름 불러오기
	public static CategoryVO placeTypeData(int tno) {
		SqlSession session = null;
		CategoryVO type = null;
		try {
			session = ssf.openSession();
			type = session.selectOne("placeTypeData",tno);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO : placeTypeName(int) ERROR");
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
	//상세페이지 : 장소 상세정보 불러오기
	public static PlaceVO placeDetailData(int no) {
		SqlSession session = null;
		PlaceVO vo = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("placeDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO : placeDetailData(int no) : ERROR");
		}
		return vo;
	}
	//상세페이지 : 장소 이미지들 불러오기
	public static List<ImageVO> placeImageData(int no){
		SqlSession session = null;
		List<ImageVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("placeImageData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceDAO : placeImageData(int no) : ERROR");
		}finally {
			session.close();
		}
		return list;
	}
}
