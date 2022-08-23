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
import com.sist.vo.ReserveVO;

public class ReserveDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//경로를 src/main/java까지 자동으로 인식한다. 그러니까 src/main/java에 Config.xml을 두면 자동으로 인식 가능함!
			ssf = new SqlSessionFactoryBuilder().build(reader); //xml파일 파싱
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : getConnection() ERROR");
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
			System.out.println("ReserveDAO : reserveGetDate() ERROR");
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
			System.out.println("ReserveDAO : reserveGetTime() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//예약값 입력
	//최대 예약번호 가져오기
	public static int reserveMaxNo() {
		SqlSession session = null;
		int maxno = 0;
		try {
			session = ssf.openSession();
			maxno = session.selectOne("reserveMaxNo");
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : reserveMaxNo() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return maxno;
	}
	public static void reserveInsert(ReserveVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reserveInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : reserveInsert() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//실제시간 범위 가져오기
	public static String getRealTime(int no) {
		SqlSession session = null;
		String timespan = "";
		try {
			session = ssf.openSession();
			timespan = session.selectOne("getRealTime", no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : getRealTime() ERROR");
		}finally {
			session.close();
		}
		return timespan;
	}
	//예약조회용 데이터 입력
	public static void reserveInfoInsert(ReserveVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reserveInfoInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : reserveInfoInsert() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//[마이페이지] 예약목록 조회
	public static List<ReserveVO> user_reserveListData(Map map){
		List<ReserveVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("user_reserveListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : user_reserveListData() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//[마이페이지] 예약 총 건수
	public static int user_reserveTotal(String member_id) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("user_reserveTotal",member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : user_reserveTotal() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	//[마이페이지] 예약 총 건수(예약완료)
	public static int user_reserveTotalChecked(String member_id) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("user_reserveTotalChecked",member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : user_reserveTotalChecked() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	//[마이페이지] 예약 취소
	public static void user_reserveDelete(Map map) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("user_reserveDelete",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : user_reserveDelete() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//[마이페이지] 예약 상세정보조회
	public static ReserveVO user_reserveDetailData(int no) {
		SqlSession session = null;
		ReserveVO vo = new ReserveVO();
		try {
			session = ssf.openSession();
			vo = session.selectOne("user_reserveDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("ReserveDAO : user_reserveDetailData() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;

	}
	//[관리자] 예약 목록 조회
		public static List<ReserveVO> admin_reserveListData(Map map) {
			List<ReserveVO> list = null;
			SqlSession session = null;
			try {
				session = ssf.openSession();
				list = session.selectList("admin_reserveListData",map);
			}catch(Exception ex) {
				ex.printStackTrace();
				System.out.println("ReserveDAO : admin_reserveListData() ERROR");
			}finally {
				if(session!=null)
					session.close();
			}
			return list;
		}
		//[관리자] 예약대기 수
		public static int admin_reserveWaitCount() {
			int wcount=0;
			SqlSession session = null;
			try {
				session = ssf.openSession();
				wcount = session.selectOne("admin_reserveWaitCount");
			}catch(Exception ex) {
				ex.printStackTrace();
				System.out.println("ReserveDAO : admin_reserveWaitCount() ERROR");
			}finally {
				if(session!=null)
					session.close();
			}
			return wcount;
		}
		//[관리자] 예약 승인 처리
		public static void admin_reserveCheck(Map map) {
			SqlSession session = null;
			try {
				session = ssf.openSession(true);
				session.update("admin_reserveCheck",map);
			}catch(Exception ex) {
				ex.printStackTrace();
				System.out.println("ReserveDAO : admin_reserveCheck() ERROR");
			}finally {
				if(session!=null)
					session.close();
			}
		}
}
