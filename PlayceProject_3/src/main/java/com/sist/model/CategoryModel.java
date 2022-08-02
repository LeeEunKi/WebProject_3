package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CategoryDAO;
import com.sist.vo.CategoryVO;
import com.sist.vo.PlaceVO;

@Controller
public class CategoryModel {
	@RequestMapping("place/category_list.do")
	public String  category_list(HttpServletRequest request,HttpServletResponse response) {
		String page = request.getParameter("page");
		String cno = request.getParameter("cno");
		if(page==null)
			page="1";
		int curPage = Integer.parseInt(page);
		int rowSize = 9;
		int start = rowSize*curPage-(rowSize-1); 
		int end = rowSize*curPage; 
		
		Map map = new HashMap();
		map.put("start", start); 
		map.put("end", end);
		map.put("cno", Integer.parseInt(cno));
		
		List<PlaceVO> list = CategoryDAO.categoryDataList(map);
		int totalCount = CategoryDAO.categoryTotalCount(Integer.parseInt(cno));
		int totalPage = (int)Math.ceil((double)totalCount/9.0);
		
		final int BLOCK = 5;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		CategoryVO cvo=CategoryDAO.categorySelectedData(Integer.parseInt(cno));
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("list", list);
		request.setAttribute("cno", cno);
		request.setAttribute("cvo", cvo);
		
		request.setAttribute("main_jsp", "../place/category_list.jsp");
		return "../main/main.jsp";
	}

}
