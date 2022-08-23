package com.sist.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
public class NoticeBoardDAO {
	private static SqlSessionFactory ssf;
	 static // 자동 수행
	   {
		   try
		   {
			   // XML 읽기 
			   //                 src/main/java => Config.xml  (classpath영역=>마이바티스 자동인식)
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	 
	 public static List<NoticeBoardVO> noticeboardListData(Map map)
	   {
		   List<NoticeBoardVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("noticeboardListData",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // 반환 ==> POOLED(DBCP) => Connection생성(8개)
		   }
		   return list;
	   }
	 
	 public static int noticeboardTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("noticeboardTotalPage");
		   }catch(Exception ex)
		   {
			   System.out.println("noticeboardTotalPage : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
		   return total;
	   }
	   
	 public static void noticeboardInsert(NoticeBoardVO vo)
	 {
		 SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();//괄호에 true를 넣어도 commit
			   session.insert("noticeboardInsert",vo);//이것만 쓰면 commit은 안됩니더
			   session.commit(); 
		   }catch(Exception ex)
		   {
			   System.out.println("noticeboardInsert : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
	 }
	 
	 //상세보기
	 //<select id="boardDetailData" resultType="NoticeBoardVO" parameterType="int">
	 public static NoticeBoardVO noticeboardDetailData(int no)
	 {
		 NoticeBoardVO vo=new NoticeBoardVO();
		 SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   session.update("noticehitIncrement",no);
			   session.commit();
			   vo=session.selectOne("noticeboardDetailData",no);
		   }catch(Exception ex)
		   {
			   System.out.println("noticeboardDetailData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
		   return vo;
	 }
	 
	 public static NoticeBoardVO noticeboardUpdateData(int no)
	 {
		 NoticeBoardVO vo=new NoticeBoardVO();
		 SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("noticeboardDetailData",no);
		   }catch(Exception ex)
		   {
			   System.out.println("noticeboardUpdateData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
		   return vo;
	 }
	 
	 //비밀번호 확인
	 public static String noticeboardPwdCheck(int no,String pwd)
	 {
		 String result="";
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession();
			 String db_pwd=session.selectOne("noticeboardGetPassword",no);
			 if(db_pwd.equals(pwd))
			 {
				 result="yes";
			 }
			 else
			 {
				 result="no";
			 }
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		 finally
		 {
			 if(session!=null)
				 session.close();
		 }
		 return result;
	 }
	 
	 public static void noticeboardUpdate(NoticeBoardVO vo)
	 {
		 SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();//괄호에 true를 넣어도 commit
			   session.update("noticeboardUpdate",vo);//이것만 쓰면 commit은 안됩니더
			   session.commit(); 
		   }catch(Exception ex)
		   {
			   System.out.println("noticeboardUpdate : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
	 }
	 public static String noticeboardDelete(int no,String pwd)
	 {
		 String result="";
		 //오라클 연결
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession();
			 //<select id="boardGetPassword" resultType="string" parameterType="int">
			 /*
			  * SELECT pwd FROM project_freeboard
				WHERE no=#{no}
				
				map.put("boardGetPassword","SELECT pwd FROM project_freeboard
				WHERE no=#{no}")
			  * 
			  */
			 String db_pwd=session.selectOne("noticeboardGetPassword",no);
			 if(db_pwd.equals(pwd))
			 {
				 result="yes";
				 session.delete("noticeboardDelete",no);
				 //commit위치 여기 맞는지 확인
				 session.commit();
			 }
			 else
			 {
				 result="no";
			 }
			 
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		 finally
		 {
			 if(session!=null)
				 session.close();
		 }
		 return result;
	 }
	 public static List<NoticeBoardVO> noticeboardSearchData()
	   {
		   List<NoticeBoardVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("noticeboardSearchData");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); 
		   }
		   return list;
	   }

}
