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
	
	/*
	<!-- 리뷰 리스트 총페이지 -->
	<select id="reviewTotalCount" resultType="int" parameterType="int">
	 */
	public static int reviewTotalCount(int place_no)
	{
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("reviewTotalCount",place_no);
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("reviewTotalCount(int place_no) 오류났다 고쳐라");
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	//<insert id="reviewInsert" parameterType="ReviewVO">
	public static void reviewInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
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

	/*
	 * <update id="reviewCheckInsert" parameterType="ReviewVO">
   UPDATE reserve_info_3 SET
   reviewcheck= reviewcheck + 1
   WHERE no=#{no} AND member_id=#{member_id}
</update>
	 */
	public static void reviewCheckInsert(int reserve_no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("reviewCheckInsert", reserve_no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	<!-- 리뷰 넘버 리턴 -->
<insert id="reviewNoInsert" parameterType="int">
<!--  시퀀스 처리 -->
<selectKey keyProperty="review_no" resultType="int" order="BEFORE">
      SELECT NVL(MAX(no)+1,1) AS no FROM reserve_info_3
   </selectKey>
UPDATE reserve_info_3 SET
review_no=#{review_no}
WHERE no=#{no}
</insert>
	 */
	public static void reviewNoInsert(Map map)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("reviewNoInsert", map);
		} catch (Exception e) {
			// TODO: handle exception
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
	/* 예약내역에서 리뷰 넘버, 리뷰체크 값 초기화 
	 * <update id="reviewCheckReset" parameterType="int">
	 */
	public static void reviewCheckReset(int no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewCheckReset", no);
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
	//예약 내역에서 리뷰를 작성한 적이 있는지 체크 
	//<select id="reviewReserveCheck" resultType="int" parameterType="ReviewVO">
	public static int reviewReserveCheck(ReviewVO vo)
	{
		int check=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			check=session.selectOne("reviewReserveCheck",vo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			if(session!=null)
				session.close();
		}
		return check;
	}
	//리뷰 업데이트 리뷰 내용 불러오기 
	//<update id="reviewUpdatedata" parameterType="ReviewVO">
	public static ReviewVO reviewUpdateData(int no)
	{
		ReviewVO vo=new ReviewVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("reviewUpdateData",no);
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
	//리뷰 업데이트 
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
	public static void reviewLikeInsert(int no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewLikeInsert", no);
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