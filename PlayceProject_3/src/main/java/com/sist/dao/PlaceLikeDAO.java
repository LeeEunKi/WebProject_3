package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.PlaceLikeVO;
import com.sist.vo.PlaceVO;

public class PlaceLikeDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//경로를 src/main/java까지 자동으로 인식한다. 그러니까 src/main/java에 Config.xml을 두면 자동으로 인식 가능함!
			ssf = new SqlSessionFactoryBuilder().build(reader); //xml파일 파싱
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO:getConnection() ERROR");
		}
	}
	//좋아요 : 장소별 좋아요 개수
	public static int placeLikeCount(int no) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("placeLikeCountList",no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeCount() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	//좋아요 : 장상세페이지에서 이미 좋아요 한 장소인지 확인
	public static int isLikedPlace(PlaceLikeVO vo) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("isLikedPlace",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : isLikedPlace() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	//좋아요 : 좋아요
	public static void placeLikeInsert(PlaceLikeVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("placeLikeInsert",vo);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeInsert() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//좋아요 : 좋아요 취소
	public static void placeLikeDelete(PlaceLikeVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("placeLikeDelete",vo);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeDelete() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//마이페이지 : 좋아요 한 장소 번호들 가져오기
	public static List<Integer> placeLikeGetNo(Map map) {
		List<Integer> list = null;
		SqlSession session = ssf.openSession();
		try {
			session = ssf.openSession();
			list = session.selectList("placeLikeGetNo",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeGetNo() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//마이페이지 : 좋아요 한 장소 총 개수(마이페이지에서 페이지네이션 할 때 사용)
	public static int placeLikeCount(String member_id) {
		int count = 0;
		SqlSession session = ssf.openSession();
		try {
			session = ssf.openSession();
			count = session.selectOne("placeLikeCount",member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeCount() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	//마이페이지 : 좋아요 목록 출력
	public static PlaceVO placeLikeListData(int place_no){
		PlaceVO vo = null;
		SqlSession session = ssf.openSession();
		try {
			session = ssf.openSession();
			vo = session.selectOne("placeLikeListData",place_no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("PlaceLikeDAO : placeLikeListData() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
}
