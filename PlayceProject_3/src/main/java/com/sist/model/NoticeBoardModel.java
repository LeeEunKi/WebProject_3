package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeBoardDAO;
import com.sist.dao.NoticeBoardDAO;
import com.sist.dao.ReplyDAO;

import java.util.*;
import com.sist.vo.*;
@Controller
public class NoticeBoardModel {
	@RequestMapping("noticeboard/list.do")
	public String noticeboard_list(HttpServletRequest request, HttpServletResponse response)
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
		List<NoticeBoardVO> list=NoticeBoardDAO.noticeboardListData(map);
	     
		int totalpage=NoticeBoardDAO.boardTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../noticeboard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("noticeboard/insert.do")
	public String noticeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{
		//main,footer는 유지하고 가운데만 바꾸기
		request.setAttribute("main_jsp", "../noticeboard/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("noticeboard/insert_ok.do")
	public String noticeboard_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		
		String subjet=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("name");
		System.out.println("name="+name);
		
		NoticeBoardVO vo=new NoticeBoardVO();
		vo.setName(name);
		vo.setSubject(subjet);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		NoticeBoardDAO.noticeboardInsert(vo);
		return "redirect:../noticeboard/list.do";
	}

	 @RequestMapping("noticeboard/detail.do")
	   public String noticeboard_detail(HttpServletRequest request,HttpServletResponse response)
	   {
		   // 출력할 데이터를 보낸다 
		   String no=request.getParameter("no");
		   NoticeBoardVO vo=NoticeBoardDAO.noticeboardDetailData(Integer.parseInt(no));
		   request.setAttribute("vo", vo);
		   
		   // 댓글 읽기 
		   ReplyVO rvo=new ReplyVO();
		   rvo.setBno(vo.getNo());
		   rvo.setType(1);
		   List<ReplyVO> list=ReplyDAO.replyListData(rvo);
		   request.setAttribute("list", list);
		   request.setAttribute("main_jsp", "../noticeboard/detail.jsp");
		   return "../main/main.jsp";
	   }
	@RequestMapping("noticeboard/update.do")
	public String noticeboard_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		NoticeBoardVO vo=NoticeBoardDAO.noticeboardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../noticeboard/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("noticeboard/pwd_check.do")
	public String noticeboard_pwd_check(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String res=NoticeBoardDAO.noticeboardPwdCheck(Integer.parseInt(no), pwd);
		//이거 맞나?
		request.setAttribute("res", res);
		return "../noticeboard/update_ok.jsp";
	}
	@RequestMapping("noticeboard/update_ok.do")
	public String noticeboard_update_ok(HttpServletRequest request, HttpServletResponse response)
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
		NoticeBoardVO vo=new NoticeBoardVO();
		vo.setName(name);
		vo.setSubject(subjet);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setNo(Integer.parseInt(no));
		NoticeBoardDAO.noticeboardUpdate(vo);
		return "redirect:../noticeboard/detail.do?no="+no;
	}
	
	@RequestMapping("noticeboard/delete.do")
	public String noticeboard_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String result=NoticeBoardDAO.noticeboardDelete(Integer.parseInt(no), pwd);
		request.setAttribute("result", result);
		
		//result값을 delete.jsp에게 보냄
		return "../noticeboard/delete.jsp";
	}
}
