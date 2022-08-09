package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReviewDAO;
import com.sist.vo.ReviewVO;

@Controller
public class ReviewModel {
	@RequestMapping("review/reivew_insert.do")
	public String review_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../review/review_insert.jsp");
		return "..main/main.jsp";
	}
	
	@RequestMapping("review/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF_8");
		} catch (Exception e) {
			System.out.println("Model => review_insert_ok error");
			e.printStackTrace();
		}
		String place_no=request.getParameter("place_no"); //게시물 번호 참조키 
		String content=request.getParameter("content");
		String score=request.getParameter("score");
		//String imgname=request.getParameter("imgname"); 이미지 어카냐 진
		HttpSession session=request.getSession(); // 아이디 얻어와야지
		String member_id=(String)session.getAttribute("member_id");
		
		ReviewVO vo=new ReviewVO();
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		vo.setMember_id(member_id);
		
		ReviewDAO.reviewInsert(Integer.parseInt(place_no),vo); //place_no 댓글 갯수 +1
		
		return "redirect:../place/detail.do?no="+place_no;
	}
	
	
	@RequestMapping("review/review_delete.do")
	public String review_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String place_no=request.getParameter("place_no");
		String no=request.getParameter("no");
		//삭제 =>  DAO
		ReviewDAO.reviewDelete(Integer.parseInt(no));
		return "redirect:../place/detail.do?no="+place_no;
	}
	
	@RequestMapping("review/review_update.do")
	public String review_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		ReviewVO vo=ReviewDAO.reviewUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../review/review_update.do");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_update_ok.do")
	public String review_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UFT-8");
		} catch (Exception e) {
			System.out.println("Model => review_update_ok error");
			e.printStackTrace();
		}

		String place_no=request.getParameter("place_no");
		String no=request.getParameter("no");
		// 추가로 content, score 
		String content=request.getParameter("content");
		String score=request.getParameter("score");
		
		ReviewVO vo=new ReviewVO();
		vo.setNo(Integer.parseInt(no));
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		//DAO 연동
		ReviewDAO.reviewUpdate(vo);
		
		return "redirect:../place/detail.do?no="+place_no ;
	}
	
}
