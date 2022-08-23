package com.sist.dao;
import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class ReviewDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	//<select id="counts" resultType="int" parameterType="int">
	public static int counts(int place_no)
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("counts", place_no);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
    //<select id="scoreAvg" resultType="double" parameterType="int">
	public static Double scoreAvg(int place_no)
	{
		SqlSession session=null;
		Double avg=0.0;
		try {
			session=ssf.openSession();
			avg=session.selectOne("scoreAvg", place_no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewListData(ReviewVO vo) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return avg;
	}
	
	
	//<select id="reviewListData" resultType="ReviewVO" parameterType="no">
	public static List<ReviewVO> reviewListData(Map map)
	{
		SqlSession session=null;
		List<ReviewVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("reviewListData", map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewListData(ReviewVO vo) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
				
		return  list;
	}
	
	
	//<insert id="reviewInsert" parameterType="ReviewVO">
	public static void reviewInsert(int place_no, ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("counts",place_no); //댓글 갯수 +1
			session.insert("reviewInsert",vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewInsert(ReviewVO vo) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	//<delete id="reivewDelete" parameterType="int">
	public static void reviewDelete(int no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("reviewDelete",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewDelete(int no) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		
	}
	
	//<update id="reviewUpdate" parameterType="ReviewVO">
	public static ReviewVO reviewUpdateData(int no)
	{
		ReviewVO vo=new ReviewVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("reviewUpdate",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewUpdateData(ReviewVO vo) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public static void reviewUpdate(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewUpdate",vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("reviewUpdate(ReviewVO vo) 오류났다 고쳐라");
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	//리뷰 도움돼요
	//<insert id="reviewLikeInsert" parameterType="com.sist.vo.ReviewLikeVO">
	public static void reviewLikeInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewLikeInsert", vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	//<insert id="likeCheckInsert" parameterType="ReviewVO"> 도움돼요 클릭 시 중복 방지값 넣어주기 
	public static void likeCheckInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("likeCheckInsert", vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	//중복 방지 값을 체크
	//<select id="reviewLikeCheck" resultType="int" parameterType="com.sist.vo.ReviewLikeVO">
	public static int reviewLikeCheck(Map map)
	{
		SqlSession session=null;
		int check=0;
		try {
			session=ssf.openSession();
			check=session.selectOne("reviewLikeCheck", map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
				
		}
		return check;
	}
	
	//리뷰 도움돼요 취소
	public static void reviewLikeCancel(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewLikeCancel", vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	//도움돼요 취소 시 중복 값 제거 해서 클릭 활성화
	//<delete id="likeCheckDelete" parameterType="ReviewVO">
	public static void likeCheckDelete(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("likeCheckDelete", vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	
	//베스트 리뷰 출력 
	//<select id="bestReview" resultType="ReviewVO">
	public static List<ReviewVO> bestReview()
	{
		List<ReviewVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("bestReview");
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
}
