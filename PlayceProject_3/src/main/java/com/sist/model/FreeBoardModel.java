//JSP와 JAVA 연결
package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FreeBoardDAO;
import com.sist.dao.ReplyDAO;

import java.util.*;
import com.sist.vo.*;
@Controller
public class FreeBoardModel {
	@RequestMapping("freeboard/list.do")
	public String freeboard_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		map.put("start", start);
		map.put("end", end);
		List<FreeBoardVO> list=FreeBoardDAO.boardListData(map);
	     
		int totalpage=FreeBoardDAO.boardTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../freeboard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/insert.do")
	public String freeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{
		//main,footer는 유지하고 가운데만 바꾸기
		request.setAttribute("main_jsp", "../freeboard/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("freeboard/insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String name=request.getParameter("name");
		System.out.println("name="+name);
		String subjet=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		FreeBoardVO vo=new FreeBoardVO();
		vo.setName(name);
		vo.setSubject(subjet);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		FreeBoardDAO.boardInsert(vo);
		return "redirect:../freeboard/list.do";
	}

	 @RequestMapping("freeboard/detail.do")
	   public String freeboard_detail(HttpServletRequest request,HttpServletResponse response)
	   {
		   // 출력할 데이터를 보낸다 
		   String no=request.getParameter("no");
		   FreeBoardVO vo=FreeBoardDAO.boardDetailData(Integer.parseInt(no));
		   request.setAttribute("vo", vo);
		   
		   // 댓글 읽기 
		   ReplyVO rvo=new ReplyVO();
		   rvo.setBno(vo.getNo());
		   rvo.setType(1);
		   List<ReplyVO> list=ReplyDAO.replyListData(rvo);
		   request.setAttribute("list", list);
		   request.setAttribute("main_jsp", "../freeboard/detail.jsp");
		   return "../main/main.jsp";
	   }
	@RequestMapping("freeboard/update.do")
	public String freeboard_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		FreeBoardVO vo=FreeBoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../freeboard/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/pwd_check.do")
	public String freeboard_pwd_check(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String res=FreeBoardDAO.boardPwdCheck(Integer.parseInt(no), pwd);
		//이거 맞나?
		request.setAttribute("res", res);
		return "../freeboard/update_ok.jsp";
	}
	@RequestMapping("freeboard/update_ok.do")
	public String freeboard_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String name=request.getParameter("name");
		String subjet=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String no=request.getParameter("no");
		FreeBoardVO vo=new FreeBoardVO();
		vo.setName(name);
		vo.setSubject(subjet);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setNo(Integer.parseInt(no));
		FreeBoardDAO.boardUpdate(vo);
		return "redirect:../freeboard/detail.do?no="+no;
	}
	
	@RequestMapping("freeboard/delete.do")
	public String freeboard_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String result=FreeBoardDAO.boardDelete(Integer.parseInt(no), pwd);
		request.setAttribute("result", result);
		
		//result값을 delete.jsp에게 보냄
		return "../freeboard/delete.jsp";
	}
}
