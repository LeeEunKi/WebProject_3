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
		
		AskVO vo = new AskVO();
		vo.setMember_id(member_id);
		vo.setContent(content);
		vo.setPlace_no(Integer.parseInt(place_no));
		
		AskDAO.user_askInsert(vo);
		System.out.println(place_no);
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
		int curPage = Integer.parseInt(page_no);
		int rowSize = 5;
		int start = (rowSize*curPage)-(rowSize-1);
		int end = rowSize*curPage;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("place_no", Integer.parseInt(place_no));
		List<AskVO> qList = AskDAO.askListData(map);
		
		String result = "[";
//		System.out.println("size:"+qList.size());
		//JSON형태로 데이터 전송
		for(int i=0;i<qList.size();i++) {
			AskVO vo = qList.get(i);
			result = result+"{\"member_id\":\""+vo.getMember_id()+"\","
					+"\"dbday\":\""+vo.getDbday()+"\","
					+"\"content\":\""+vo.getContent()+"\","
					+"\"place_no\":\""+vo.getPlace_no();
			if(i==qList.size()-1) {
				result = result+"\"}";
			}else {
				result = result+"\"},";
			}
		}
		result = result+"]";
//		System.out.println(result);
		request.setAttribute("result", result);
		return "../ask/ask_page.jsp";
	}
	//[유저] 문의글 삭제 --마이페이지에서 삭제처리?
	
	//[어드민] 문의글 답변 작성
	@RequestMapping("ask/ask_insert.do")
	public String board_reply_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		String pno = request.getParameter("pno");
		String member_id= request.getParameter("member_id");
		String content = request.getParameter("content");
		
		AskVO vo = new AskVO();
		vo.setMember_id(member_id);
		vo.setContent(content);
		
		AskDAO.admin_askInsert(Integer.parseInt(pno),vo);
		
		return "redirect:..//";//어드민 질문목록으로 이동
	}
}
