package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AskDAO;
import com.sist.dao.PlaceDAO;
import com.sist.dao.PlaceLikeDAO;
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
		
		

		
		//문의게시판 영역 - 데이터 
		int totalQ = AskDAO.askTotalCount(Integer.parseInt(no));
		//리뷰
		int totalR = ReviewDAO.reviewTotalCount(Integer.parseInt(no));
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
		//리뷰
		int totalPageR = (int)Math.ceil((double)totalR/5.0);
		int startPageR = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
		int endPageR = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPageR>totalPageR) {
			endPageR = totalPageR;
		}
		
		
		//리뷰 영역 데이터
				List<ReviewVO> rList =ReviewDAO.reviewListData(map);
				int rtotal=ReviewDAO.counts(Integer.parseInt(no));
				Double avg=ReviewDAO.scoreAvg(Integer.parseInt(no));
		
		request.setAttribute("pvo", pvo); //장소설명
		request.setAttribute("list", list); //이미지리스트 
		//장소 좋아요
		PlaceLikeVO lvo = new PlaceLikeVO();
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		if(member_id!=null) {
			lvo.setPlace_no(Integer.parseInt(no));
			lvo.setMember_id(member_id);
			int lcount = PlaceLikeDAO.isLikedPlace(lvo);
			request.setAttribute("lcount", lcount);
		}
		int totalL = PlaceLikeDAO.placeLikeCount(Integer.parseInt(no));
		
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
		request.setAttribute("rtotal", rtotal);
		request.setAttribute("avg", avg);
		request.setAttribute("totalPageR", totalPageR);
		request.setAttribute("totalR", totalR);
		request.setAttribute("startPageR", startPageR);
		request.setAttribute("endPageR", endPageR);

		request.setAttribute("totalL", totalL);//좋아요개수
		request.setAttribute("main_jsp","../place/detail.jsp");
		request.setAttribute("review_jsp", "../review/review.jsp");
		request.setAttribute("ask_jsp", "../ask/ask_list.jsp");
		return "../main/main.jsp";
	}
	
	 @RequestMapping("place/place_find.do")
	   public String food_find(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   String addr=request.getParameter("addr");
		   if(addr==null)
			   addr="";
		   
		   int curpage=Integer.parseInt(page);
		   int rowSize=9;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   Map map=new HashMap();
		   map.put("start", start);
		   map.put("end", end);
		   map.put("address", addr);
		   
		   List<PlaceVO> list=PlaceDAO.placeLocationFindData(map);
		   int totalpage=PlaceDAO.placeLocationFindTotalPage(addr);
		   int totalCount=PlaceDAO.placeFindTotalCount(addr);
		   
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("list", list);
		   request.setAttribute("addr", addr);
		   request.setAttribute("totalCount", totalCount);
		   request.setAttribute("main_jsp", "../place/place_find.jsp");
		   return "../main/main.jsp";
	   }

}
