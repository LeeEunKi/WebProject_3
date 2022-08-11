package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;

public class MemberDAO {
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
	 
	 //id중복체크
	 //<select id="memberIdCheck" resultType="int" parameterType="String">
	 public static int memberIdCheck(String id) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("memberIdCheck",id);
			// selectList, selectOne ==> row단위 (2개이상이면 selectList)
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("memberIdCheck() : error");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		 return count;
	 }
	 //email 중복체크
	 //<select id="memberEmailCheck" resultType="int" parameterType="String">
	 public static int memberEmailCheck(String email) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("memberEmailCheck",email);
			// selectList, selectOne ==> row단위 (2개이상이면 selectList)
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("memberEmailCheck() : error");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		 return count;
	 }
	 
	// 회원가입 
	//<insert id="memberInsert" parameterType="MemberVO"> 
	public static void memberInsert(MemberVO vo) {
		
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("memberInsert",vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("memberInsert(): 에러");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
	}
	
	// 로그인 처리
	// <select id="memberIdCount" resultType="int" parameterType="string">
	// <select id="memberInfoData" resultType="MemberVO" parameterType="string">
	public static MemberVO isLogin(String id,String pwd) {
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdCount",id);
			if(count==0) {
				//아이디가 없는 상태
				vo.setMsg("NOID");
			}
			else {
				vo=session.selectOne("memberInfoData",id);
				if(pwd.equals(vo.getPwd())) {
					// 로그인 성공
					vo.setMsg("OK");
				}
				else {
					//비밀번호 틀린상태
					vo.setMsg("NOPWD");
				}
			}			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("isLogin(): error");
			e.printStackTrace();
			
		} finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	//id/pwd찾기
	//<select id="memberNameCount" resultType="int" parameterType="string">
	//<select id="memberGetEmail" resultType="string" parameterType="string">
 	//<select id="emailIdFind" resultType="string" parameterType="hashmap">
	public static String emailIdFind(String name,String email) {
		String result="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int nameCount=session.selectOne("memberNameCount",name);
			if(nameCount==0) {
				result="회원이 아닌 이름입니다.";
			}
			else {
				String db_email=session.selectOne("memberGetEmail", name);
				if(db_email.equals(email)) {
					Map map= new HashMap();
					map.put("name",name);
					map.put("email", email);
					result="아이디: "+session.selectOne("emailIdFind", map); 
				}
				else {
					result="이메일이 틀립니다!";
				}
			}
		} catch (Exception e) {
			System.out.println("emailIdFind(): 에러");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return result;
	}

	
}
