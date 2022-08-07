package com.sist.dao;
/*
 *  <!-- 목록 -->
  <select id="replyListData" resultType="ReplyVO" parameterType="ReplyVO">
    SELECT /*+ INDEX_DESC(project_reply pr_no_pk) no,bno,type,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
    FROM project_reply
    WHERE bno=#{bno} AND type=#{type}
  </select>
  <!-- 추가 -->
  <insert id="replyInsert" parameterType="ReplyVO">
    <!-- sequence 
         order 순서 => BEFORE는 먼저 수행 
         고급 => JOIN , SUBQUERY , 동적쿼리 
    -->
    <selectKey keyProperty="no" resultType="int" order="BEFORE">
      SELECT NVL(MAX(no)+1,1) as no FROM project_reply
    </selectKey>
    INSERT INTO project_reply VALUES(
      #{no},
      #{bno},
      #{type},
      #{id},
      #{name},
      #{msg},
      SYSDATE
    )
  </insert>
 */

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;
import com.sist.vo.*;
public class ReplyDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   try
		   {
			   // XML 읽기 
			   // src/main/java => Config.xml  (classpath영역=>마이바티스 자동인식)
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	   
	   // <select id="replyListData" resultType="ReplyVO" parameterType="ReplyVO">
	   public static List<ReplyVO> replyListData(ReplyVO vo)
	   {
		   List<ReplyVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("replyListData",vo);
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
	   
	   public static void replyInsert(ReplyVO vo)
	   {
		   
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("replycountIncrement",vo);
			   session.insert("replyInsert",vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // 반환 ==> POOLED(DBCP) => Connection생성(8개)
		   }
		   //SqlSession session=ssf.openSession(true);
		   //session.insert("replyInsert",vo);
		   //session.close();
		   
	   }
	   /*
	    *   <delete id="replyDelete" parameterType="int">
			   DELETE FROM project_reply
			   WHERE no=#{no}
			  </delete>
	    */
	   public static void replyDelete(int no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.delete("replyDelete",no);
		   session.close();
	   }
	   /*
	    *  <update id="replyUpdate" parameterType="ReplyVO">
			   UPDATE project_reply SET
			   msg=#{msg}
			   WHERE no=#{no}
			  </update>
	    */
	   public static void replyUpdate(ReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("replyUpdate",vo);
		   session.close();
	   }
	   
	   
}








