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
	
	//<select id="reviewListData" resultType="ReviewVO" parameterType="ReviewVO">
	public static List<ReviewVO> reviewListData(ReviewVO vo)
	{
		List<ReviewVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("reviewListData", vo);
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
	public static void reviewInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("countIncrement",vo); //댓글 갯수 +1
			session.insert("reviewInsert",vo);
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
	public static void reviewUpdate(ReviewVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("reviewUpdate",vo);
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
	
}
