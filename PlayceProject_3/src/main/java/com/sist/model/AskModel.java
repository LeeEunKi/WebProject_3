package com.sist.model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AskDAO;
import com.sist.dao.PlaceDAO;
import com.sist.vo.*;

@Controller
public class AskModel {
	//[유저] 문의글 작성
	@RequestMapping("ask/ask_insert.do")
	public String user_askInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		String member_id = request.getParameter("member_id");
		String content = request.getParameter("askContent");
		String place_no = request.getParameter("place_no");
		PlaceVO pvo = PlaceDAO.placeDetailData(Integer.parseInt(place_no));
		
		AskVO vo = new AskVO();
		vo.setMember_id(member_id);
		vo.setContent(content);
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setPlace_img(pvo.getRep_image());
		vo.setPlace_name(pvo.getName());
		
		AskDAO.user_askInsert(vo);
		
		return "redirect:../place/detail.do?no="+place_no+"#ask";
	}
	//[유저] 문의글 페이지네이션
	@RequestMapping("ask/ask_page.do")
	public String user_askPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		String place_no = request.getParameter("place_no");
		String page_no = request.getParameter("page_no");
		if(page_no==null)
			page_no="1";
		int curPage = Integer.parseInt(page_no);
		int rowSize = 5;
		int start = (rowSize*curPage)-(rowSize-1);
		int end = rowSize*curPage;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("place_no", Integer.parseInt(place_no));
		List<AskVO> qList = AskDAO.askListData(map);

		request.setAttribute("qList", qList);
		return "../ask/ask_list_data.jsp";
	}
}
