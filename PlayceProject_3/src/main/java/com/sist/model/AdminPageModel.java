package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;


@Controller
public class AdminPageModel {
	@RequestMapping("adminpage/adminpage.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "../main/main.jsp";
	}
	
	//답변 달아야 하는 문의글 목록 가져오기
	@RequestMapping("adminpage/askReply.do")
	   public String adminpage_answer(HttpServletRequest request,HttpServletResponse response) {
		   String page = request.getParameter("page");
		   if(page==null)
			   page = "1";
		   int curPage = Integer.parseInt(page);
		   int rowSize = 10;
		   int start = rowSize*curPage-(rowSize-1);
		   int end = rowSize*curPage;
		   
		   Map map = new HashMap();
		   map.put("start", start);
		   map.put("end", end);
		   List<AskVO> list=AskDAO.admin_askReplyListData(map);
		   //엄청 긴 문의글 미리 자르기
		   for(AskVO vo:list) {
			   String data = vo.getContent();
			   if(data.length()>20) {
				   data = data.substring(0,20)+"...";
				   vo.setContent(data);
			   }
		   }
		   int totalCount = AskDAO.admin_askTotalCount();
		   int totalPage = (int)Math.ceil((double)totalCount/10.0);
		   
		   final int BLOCK = 5;
			int startPage = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
			int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalPage) {
				endPage = totalPage;
			}
		   request.setAttribute("curPage", curPage);
		   request.setAttribute("startPage",startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("totalPage", totalPage);
		   request.setAttribute("totalCount", totalCount);
		   request.setAttribute("list", list);
		   request.setAttribute("admin_jsp", "../adminpage/askReply.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		   return "../main/main.jsp";
	   }
	//[관리자] 문의글 답변 작성 페이지로 이동
	@RequestMapping("adminpage/askReply_insert.do")
	public String adminpage_reply_insert(HttpServletRequest request,HttpServletResponse response) {
		String ask_no = request.getParameter("ask_no");
		AskVO vo = AskDAO.admin_askDetailData(Integer.parseInt(ask_no));
		request.setAttribute("askVO", vo);
		request.setAttribute("ask_no", Integer.parseInt(ask_no));
		request.setAttribute("admin_jsp", "../adminpage/askReply_insert.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "../main/main.jsp";
	}
	//[관리자] 문의글 답변 작성 처리
	@RequestMapping("adminpage/askReply_insert_ok.do")
	public String adminpage_reply_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		String ask_no = request.getParameter("ask_no"); //group_id지정
		String place_no = request.getParameter("pno");
		String member_id= request.getParameter("member_id");
		String replyContent = request.getParameter("replyContent");
		//답변내용 가져오기
		AskVO vo = new AskVO();
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setMember_id(member_id);
		vo.setContent(replyContent);
		
		AskDAO.admin_askInsert(Integer.parseInt(ask_no),vo);
		
//		request.setAttribute("admin_jsp", "../adminpage/askReply.jsp");
//		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "redirect:../adminpage/askReply.do";//어드민 질문목록으로 이동
	}
}
