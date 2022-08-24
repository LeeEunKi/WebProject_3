package com.sist.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReviewDAO;
import com.sist.vo.ReviewVO;

@Controller
public class ReviewModel {
	@RequestMapping("review/img_review.do")
	public String img_review(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../review/img_review.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_insert.do")
	public String review_insert(HttpServletRequest request,HttpServletResponse response)
	{
		String reserve_no=request.getParameter("no");//예약 번호 
		String place_no=request.getParameter("place_no");
		request.setAttribute("place_no", place_no);
		request.setAttribute("reserve_no", reserve_no);
		request.setAttribute("main_jsp", "../review/review_insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			System.out.println("Model => review_insert_ok error");
			e.printStackTrace();
		}
		String reserve_no=request.getParameter("reserve_no");//예약 번호 
		String place_no=request.getParameter("place_no"); //게시물 번호 참조키 
		String content=request.getParameter("content");
		String score=request.getParameter("rating");
		//String imgname=request.getParameter("imgname"); 이미지 어카냐 진
		/*HttpSession session=request.getSession(); 아이디 얻어와야지
		String member_id=(String)session.getAttribute("member_id");*/
		String member_id = request.getParameter("member_id");
		System.out.println(reserve_no);
		System.out.println(member_id);
		System.out.println(place_no);
		System.out.println(content);
		System.out.println(score);
		
		ReviewVO vo=new ReviewVO();
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		vo.setMember_id(member_id);
		vo.setReserve_no(Integer.parseInt(reserve_no));
		vo.setPlace_no(Integer.parseInt(place_no));
		
		ReviewDAO.reviewInsert(vo);
		ReviewDAO.reviewCheckInsert(Integer.parseInt(reserve_no));
		
		Map map=new HashMap();
		map.put("review_no", (int)vo.getNo());
		System.out.println(vo.getNo());
		map.put("reserve_no", Integer.parseInt(reserve_no));
		ReviewDAO.reviewNoInsert(map);
		
		
		return "redirect:../place/detail.do?no="+place_no+"#review";
	}
	
	
	@RequestMapping("review/review_delete.do")
	public String review_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String place_no=request.getParameter("place_no");
		String no=request.getParameter("review_no");
		System.out.println(no);
		System.out.println(place_no);
		//삭제 =>  DAO
		ReviewDAO.reviewDelete(Integer.parseInt(no));
		ReviewDAO.reviewCheckReset(Integer.parseInt(no));
		return "redirect:../place/detail.do?no="+place_no;
	}
	
	@RequestMapping("review/review_update.do")
	public String review_update(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("review_no");
		ReviewVO vo=ReviewDAO.reviewUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../review/review_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_update_ok.do")
	public String review_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			System.out.println("Model => review_update_ok error");
			e.printStackTrace();
		}
		String no=request.getParameter("review_no");
		String place_no=request.getParameter("place_no"); //게시물 번호 참조키 
		String content=request.getParameter("content");
		String score=request.getParameter("rating");
		//String imgname=request.getParameter("imgname"); 이미지 어카냐 진
		/*HttpSession session=request.getSession(); 아이디 얻어와야지
		String member_id=(String)session.getAttribute("member_id");*/
	
		System.out.println(no);
		System.out.println(place_no);
		System.out.println(content);
		System.out.println(score);
		
		ReviewVO vo=new ReviewVO();
		vo.setContent(content);
		vo.setScore(Integer.parseInt(score));
		vo.setNo(Integer.parseInt(no));
		

		
		ReviewDAO.reviewUpdate(vo);
		
		
		return "redirect:../place/detail.do?no="+place_no+"#review";
	    
	}
	
	@RequestMapping("review/review_like.do")
	public String review_like(HttpServletRequest request, HttpServletResponse response)
	{
		String place_no=request.getParameter("pno");
		String review_no=request.getParameter("rno");
		System.out.println(place_no);
		System.out.println(review_no);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		//중복 체크 
		ReviewVO vo=new ReviewVO();
		Map map=new HashMap();
		map.put("no", review_no);
		map.put("member_id", id);
		
		int count=ReviewDAO.reviewLikeCheck(map);
		System.out.println(count);
		if(count==0)
		{
			vo.setNo(Integer.parseInt(review_no));
			vo.setMember_id(id);
			
			ReviewDAO.reviewLikeInsert(vo);
			ReviewDAO.likeCheckInsert(vo);
		}
		else
		{
		   vo.setNo(Integer.parseInt(review_no));
		   vo.setMember_id(id);
		   
		   ReviewDAO.reviewLikeCancel(vo);	
		   ReviewDAO.likeCheckDelete(vo);
		   return "redirect:../place/detail.do?no="+place_no+"#review";
		}
			
		return "redirect:../place/detail.do?no="+place_no+"#review";
	}
	

	
	
	@RequestMapping("review/review_like_delete.do")
	public String review_like_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String place_no=request.getParameter("");
		String review_no=request.getParameter("review_no");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ReviewVO vo=new ReviewVO();
		vo.setNo(Integer.parseInt(review_no));
		vo.setMember_id(id);
		
		ReviewDAO.reviewLikeCancel(vo);
		ReviewDAO.reviewCheckReset(Integer.parseInt(review_no));
		return "redirect:../place/detail.do?no="+place_no;
	}
	
}
