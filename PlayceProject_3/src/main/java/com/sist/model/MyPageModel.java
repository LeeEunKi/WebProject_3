package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
public class MyPageModel {
	@RequestMapping("mypage/mypage.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mypage_jsp", "../member/join_update_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/join_update_ok.do")
	public String member_join_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mypage_jsp", "../member/join_update_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("member/join_delete_ok.do")
	public String member_join_delete_ok(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mypage_jsp", "../member/join_delete_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	
	// 회원수정 - 비밀번호 확인
	@RequestMapping("member/join_update_pwdConfirm.do")
	public String member_join_update_pwdConfirm(HttpServletRequest request,HttpServletResponse response) {
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("type");
		boolean bCheck=false;
		HttpSession session=request.getSession();		
		String id=(String)session.getAttribute("id");
		
		MemberVO vo=MemberDAO.memberInfoData(id);
		
		
		if(vo.getPwd().equals(pwd)) {
			bCheck=true;
		}
		request.setAttribute("type",type);
		request.setAttribute("bCheck", bCheck);
		return "../member/join_update_pwdConfirm.jsp";
	}
	
	// 회원수정 화면
	@RequestMapping("member/join_update.do")
	public String member_join_update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();		
		String id=(String)session.getAttribute("id");
		
		MemberVO vo=MemberDAO.memberInfoData(id);
		String tel1=vo.getTel().substring(3,7);
		String tel2=vo.getTel().substring(7);
		vo.setTel1(tel1);
		vo.setTel2(tel2);
		request.setAttribute("vo", vo);
		request.setAttribute("mypage_jsp", "../member/join_update.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	} 
	
	// 회원 수정 완료
	@RequestMapping("member/join_update_success.do")
	  public String member_join_update_success(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   String id=request.getParameter("id");
		   String email=request.getParameter("email");
		   String post=request.getParameter("post");
		   String addr1=request.getParameter("addr1");
		   String addr2=request.getParameter("addr2");
		   String tel1=request.getParameter("tel1");
		   String tel2=request.getParameter("tel2");
		   
		   MemberVO vo=new MemberVO();

		   vo.setId(id);
		   vo.setEmail(email);
		   vo.setPost(post);
		   vo.setAddr1(addr1);
		   vo.setAddr2(addr2);
		   vo.setTel("010"+tel1+tel2);
		  
		   //  수정 (DAO)
		   MemberDAO.memberUpdate(vo);
		   return "redirect:../mypage/mypage.do";
	   }
	
	//회원 탈퇴
	@RequestMapping("member/join_delete.do")
	public String memeber_join_delete(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// DAO연동
		MemberDAO.memberDelete(id);
		session.invalidate();

		return "redirect:../main/main.do";
	}
	


}
