package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PlaceDAO;
import com.sist.vo.PlaceVO;

@Controller
public class PlaceModel {
	@RequestMapping("place/place_list.do")
	public String place_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String tno = request.getParameter("tno");
		if(page==null)
			page="1";
		int curPage = Integer.parseInt(page);
		int rowSize = 9;
		int start = rowSize*curPage-(rowSize-1); 
		int end = rowSize*curPage; 
		
		Map map = new HashMap();
		map.put("start", start); //mapper에서 지정한 이름과 map의 key명이 똑같아야 한다.
		map.put("end", end);
		map.put("tno", Integer.parseInt(tno));
		
		List<PlaceVO> list = PlaceDAO.placeListData(map);
		int totalPage = PlaceDAO.placeTotalPage(Integer.parseInt(tno));
//		String type = PlaceDAO.placeTypeName(Integer.parseInt(tno));
		
		//페이지네이션 영역 변수 설정
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
		request.setAttribute("list", list);
		request.setAttribute("tno", tno);
//		request.setAttribute("type", type);
		request.setAttribute("main_jsp", "../place/place_list.jsp");
		return "../main/main.jsp";	
	}

}
