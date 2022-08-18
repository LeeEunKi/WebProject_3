package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.PlaceVO;

public class ReserveDAO {
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
	//예약불가능한 날짜 정보 불러오기
	public static List<String> reserveGetDate(int place_no){
		List<String> list = new ArrayList<String>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("reserveGetDate",place_no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//예약가능한 날짜 중에서 예약불가능한 시간 정보 불러오기
	public static List<String> reserveGetTime(Map map){
		List<String> list = new ArrayList<String>(); 
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("reserveGetTime",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
