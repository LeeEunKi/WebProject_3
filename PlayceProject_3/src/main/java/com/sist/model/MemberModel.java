package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request, HttpServletResponse response) {
				
		return "../member/login.jsp";
	}
	
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/id_check.do")
	public String member_id_check(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		int count=MemberDAO.memberIdCheck(id);
		
		request.setAttribute("count", count);
		return "../member/id_check.jsp";
	}
	
	@RequestMapping("member/email_check.do")
	public String member_email_check(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		int count=MemberDAO.memberEmailCheck(email);
		
		request.setAttribute("count", count);
		return "../member/email_check.jsp";
	}
	
	//회원가입
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 전송값 받기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String email=request.getParameter("email");
		String post=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel="010"+tel1+tel2;		
		
		MemberVO vo=new MemberVO();
		// 데이터베이스 연결
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setSex(sex);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPost(post);
		vo.setTel(tel);
		// 요청 처리
		MemberDAO.memberInsert(vo);

		// 화면 이동
		return "redirect:../main/main.do";
	}
	
	// login 처리
	@RequestMapping("member/login_ok.do")
	public String member_login_ok(HttpServletRequest request,HttpServletResponse response) {
		
		//사용자 요청값 받기
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		// DAO연동 ==> mapper(SQL)
		MemberVO vo=MemberDAO.isLogin(id, pwd);
		String result=vo.getMsg();
		if(result.equals("OK")) {
			// 로그인유지 =>  Session을 서버에 저장
			HttpSession session=request.getSession();
			session.setAttribute("id",vo.getId());
			session.setAttribute("name",vo.getName());
			session.setAttribute("admin",vo.getAdmin());
			// 서버에 저장 ==> 모든 JSP에서 사용이 가능		
		}
		
		request.setAttribute("result", result);
		return "../member/login_ok.jsp"; //NOID, NOPWD, OK
	}
	
	// 로그아웃 처리
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:../main/main.do";
	}
	
	// 아이디/비밀번호 찾기
	@RequestMapping("member/id_find.do")
	public String member_id_find(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String result=MemberDAO.emailIdFind(name, email);
		
		request.setAttribute("result", result);
		return "../member/id_find.jsp";
	}
	@RequestMapping("member/pwd_find.do")
	public String member_pwd_find(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String result=MemberDAO.emailPwdFind(name, email);
		
		request.setAttribute("result", result);
		return "../member/pwd_find.jsp";
	}

	

}
