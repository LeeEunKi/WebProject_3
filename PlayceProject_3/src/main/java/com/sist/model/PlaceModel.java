package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class PlaceModel {
	@RequestMapping("place/place_list.do")
	public String place_list(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		request.setAttribute("main_jsp", "../place/place_list.jsp");
		return "../main/main.jsp";
	}
	


}
