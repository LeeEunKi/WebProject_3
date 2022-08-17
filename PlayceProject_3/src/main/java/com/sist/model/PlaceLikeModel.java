package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PlaceLikeDAO;
import com.sist.vo.PlaceLikeVO;
import com.sist.vo.PlaceVO;

@Controller
public class PlaceLikeModel {
	//좋아요!
	@RequestMapping("place/like.do")
	public String place_like(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		PlaceLikeVO vo = new PlaceLikeVO();
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setMember_id(member_id);
		PlaceLikeDAO.placeLikeInsert(vo);
		return "redirect:../place/detail.do?no="+place_no;
	}
	//좋아요 취소!
	@RequestMapping("place/like_cancel.do")
	public String place_like_cancel(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		PlaceLikeVO vo = new PlaceLikeVO();
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setMember_id(member_id);
		//DB연동!
		PlaceLikeDAO.placeLikeDelete(vo);
		return "redirect:../place/detail.do?no="+place_no;
	}
}
