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
import com.sist.dao.ReviewDAO;
import com.sist.vo.*;

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
		int totalCount = PlaceDAO.placeTotalCount(Integer.parseInt(tno));
		CategoryVO typedata = PlaceDAO.placeTypeData(Integer.parseInt(tno));
		String type = typedata.getTitle();
		String type_image = typedata.getPoster();
		int totalPage = (int)Math.ceil((double)totalCount/9.0);
		
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
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("list", list);
		request.setAttribute("tno", tno);
		request.setAttribute("type", type);
		request.setAttribute("type_image", type_image);
		request.setAttribute("main_jsp", "../place/place_list.jsp");
		return "../main/main.jsp";	
	}
	
	@RequestMapping("place/detail.do")
	public String place_detail(HttpServletRequest request, HttpServletResponse response) {
		//장소 상세 이미지 및 데이터
		String no = request.getParameter("no");
		PlaceVO pvo = PlaceDAO.placeDetailData(Integer.parseInt(no));
		List<ImageVO> list = PlaceDAO.placeImageData(Integer.parseInt(no));
		
		//리뷰 영역 데이터
		List<ReviewVO> rList =ReviewDAO.reviewListData(Integer.parseInt(no));
		int rcount=ReviewDAO.counts(Integer.parseInt(no));
		
		//문의게시판 영역 - 데이터
		int totalQ = AskDAO.askTotalCount(Integer.parseInt(no));
		String page = request.getParameter("page");
		if(page==null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize*curPage)-(rowSize-1);
		int end = rowSize*curPage;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("place_no", Integer.parseInt(no));
		List<AskVO> qList = AskDAO.askListData(map);
		
		//문의게시판 영역 - 페이지네이션
		int totalPage = (int)Math.ceil((double)totalQ/5.0);
		final int BLOCK = 5;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		
		request.setAttribute("place_no", Integer.parseInt(no)); //문의작성시 필요함
		request.setAttribute("pvo", pvo); //장소설명
		request.setAttribute("list", list); //이미지리스트
		
		//문의글영역 요소
		request.setAttribute("qList", qList);
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		request.setAttribute("rList", rList);
		request.setAttribute("rcount", rcount);
		
		request.setAttribute("totalQ", totalQ); //문의 총 개수
		request.setAttribute("main_jsp","../place/detail.jsp");
		request.setAttribute("review_jsp", "../review/review.jsp");
		request.setAttribute("ask_jsp", "../ask/ask_list.jsp");
		return "../main/main.jsp";
	}

}
