package com.sist.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.CategoryVO;

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
	
	
	
	
}
