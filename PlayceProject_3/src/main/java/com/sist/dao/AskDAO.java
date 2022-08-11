package com.sist.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class AskDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("AskDAO:getConnection() ERROR");
		}
	}
	
	//장소별 문의목록 불러오기
	public static List<AskVO> askListData(Map map){
		SqlSession session = null;
		List<AskVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("askListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("AskDAO : askListData() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	//장소별 문의 총 수 가져오기
	public static int askTotalCount(int place_no) {
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("askCount",place_no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("AskDAO : askTotalCount() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	//[유저] 문의 등록
	public static void user_askInsert(AskVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("askInsert", vo);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("AskDAO : user_askInsert() ERROR");
		}finally {
			if(session!=null)
				session.close();
		}
	}

	//[관리자] 답변해야할 문의글 목록 가져오기
	//	<select id="admin_askReplyListData" resultType="AskVO">
	public static List<AskVO> admin_askReplyListData(Map map){
		List<AskVO> list=null;
		SqlSession session = null;
		 try {
			 session = ssf.openSession();
			 list=session.selectList("admin_askReplyListData",map);			
		 }catch(Exception ex) {
			 ex.printStackTrace();
		 }finally {
			 if(session!=null)
				 session.close();
		 }
		 return list;
	}
	//[관리자] 답변해야할 문의글 개수 가져오기
	public static int admin_askTotalCount() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("admin_askTotalCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	//[관리자] 답변해야 할 문의글 상세내용 가져오기
	public static AskVO admin_askDetailData(int no) {
		AskVO vo = new AskVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("admin_askDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
		
	}
	//[관리자] 답변 등록 
	public static void admin_askInsert(int ask_no, AskVO vo) {
		 SqlSession session = null;
		 try {
			 session = ssf.openSession();
			 int gi = session.selectOne("admin_getGroupId",ask_no);//해당 문의글 group_id 가져오기
			 vo.setGroup_id(gi);
			 session.insert("admin_askReplyInsert",vo); //답변 insert
			 session.update("admin_askReplyIsReply",ask_no); //질문글 isReply 업데이트
			 session.commit();
		 }catch(Exception ex) {
			 session.rollback();
			 ex.printStackTrace();
		 }finally {
			 if(session!=null)
				 session.close();
		 }
	 }
}
