package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		Double avg=ReviewDAO.scoreAvg(Integer.parseInt(no));
		
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
		
		request.setAttribute("pvo", pvo); //장소설명
		request.setAttribute("list", list); //이미지리스트 
		//장소 좋아요
		PlaceLikeVO lvo = new PlaceLikeVO();
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		lvo.setPlace_no(Integer.parseInt(no));
		lvo.setMember_id(member_id);
		int lcount = PlaceDAO.placeLikeCount(lvo);
		request.setAttribute("lcount", lcount);
		//문의글영역 요소
		request.setAttribute("place_no", Integer.parseInt(no)); //문의작성시 필요함
		request.setAttribute("qList", qList);
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalQ", totalQ); //문의 총 개수
		
		//리뷰 영역 요소
		request.setAttribute("rList", rList);
		request.setAttribute("rcount", rcount);
		request.setAttribute("avg", avg);

		
		request.setAttribute("main_jsp","../place/detail.jsp");
		request.setAttribute("review_jsp", "../review/review.jsp");
		request.setAttribute("ask_jsp", "../ask/ask_list.jsp");
		return "../main/main.jsp";
	}
	//좋아요!
	@RequestMapping("place/like.do")
	public String place_like(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		PlaceLikeVO vo = new PlaceLikeVO();
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setMember_id(member_id);
		PlaceDAO.placeLikeInsert(vo);
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
		PlaceDAO.placeLikeDelete(vo);
		return "redirect:../place/detail.do?no="+place_no;
	}
	
	//[마이페이지] 좋아요 목록 조회
	@RequestMapping("mypage/like_list.do")
	public String place_like_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		List<Integer> list = PlaceDAO.placeLikeGetNo(member_id);
		List<PlaceVO> pList = new ArrayList<PlaceVO>();
		for(int pno:list) {
			PlaceVO vo = PlaceDAO.placeLikeListData(pno);
			pList.add(vo);
		}
		request.setAttribute("pList", pList);
		request.setAttribute("mypage_jsp", "../mypage/like_list.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}

}
