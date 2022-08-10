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
	
	@RequestMapping("adminpage/askReply.do")
	   public String adminpage_answer(HttpServletRequest request,HttpServletResponse response) {
		   List<AskVO> list=AskDAO.admin_askReplyListData();	   

		   request.setAttribute("list", list);
		   request.setAttribute("admin_jsp", "../adminpage/askReply.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		   return "../main/main.jsp";
	   }

}
