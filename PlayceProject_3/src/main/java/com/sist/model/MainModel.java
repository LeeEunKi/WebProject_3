package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CategoryDAO;
import com.sist.dao.PlaceDAO;
import com.sist.vo.CategoryVO;
import com.sist.vo.PlaceVO;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
		
		List<CategoryVO> list=CategoryDAO.categoryData(); 
		List<Integer> categoryCnt = CategoryDAO.categoryCount();
		List<PlaceVO> rlist=PlaceDAO.recommendPlaceList();
		request.setAttribute("categoryCnt", categoryCnt);
		request.setAttribute("list", list);
		request.setAttribute("rlist", rlist);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("main/about.do")
	public String about_page(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../main/about.jsp");
		return "../main/main.jsp";
	}

}