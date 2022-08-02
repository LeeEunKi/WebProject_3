package com.sist.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;
import com.sist.vo.CategoryVO;
import com.sist.vo.PlaceVO;

public class CategoryDAO {
	private static SqlSessionFactory ssf;
	static //자동 수행
	{
		try {
			//XML 읽기            src/main/java => Config.xml (classpath영역=> Mybatis 자동 인식)
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//<select id="categoryData" resultType="CategoryVO" parameterType="int">
	public static List<CategoryVO> categoryData()
	{
		SqlSession session=null;
		List<CategoryVO> list =null;
		try {
			session=ssf.openSession(); // getConnection
			list=session.selectList("categoryData");
		}catch(Exception e) {
			System.out.println("categoryData(): error");
			e.printStackTrace();
		}finally {
			session.close(); //disConnection
		}
		return list; 
	}
	//<select id="categorySelectedData" resultType="CategoryVO" parameterType="int">
	public static CategoryVO categorySelectedData(int cno)
	{
		SqlSession session=null;
		CategoryVO cvo =null;
		try {
			session=ssf.openSession(); // getConnection
			cvo=session.selectOne("categorySelectedData",cno);
		}catch(Exception e) {
			System.out.println("categoryData(): error");
			e.printStackTrace();
		}finally {
			session.close(); //disConnection
		}
		return cvo; 
	}
	//<select id="categoryCount" resultType="int"> 
	public static List<Integer> categoryCount()
	{
		SqlSession session=null;
		List<Integer> cnts =null;
		
		try {
			session=ssf.openSession(); // getConnection
			cnts =session.selectList("categoryCount");
		}catch(Exception e) {
			System.out.println("categoryCount(): error");
			e.printStackTrace();
		}finally {
			session.close(); //disConnection
		}
		return cnts; 
	}
	
	//<select id="categoryDataList" resultType="PlaceVO" parameterType="hashmap">
	public static List<PlaceVO> categoryDataList(Map map){
		SqlSession session=null;
		List<PlaceVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("categoryDataList",map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("categoryDataList():에러");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;	
	}
	//<select id="categoryTotalCount" resultType="int" parameterType="int">
	public static int categoryTotalCount(int cno){
		SqlSession session=null;
		int total=0;
		try {
			session=ssf.openSession();
			total=session.selectOne("categoryTotalCount",cno);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("categoryTotalCount():에러");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return total;	
	}
	
}
