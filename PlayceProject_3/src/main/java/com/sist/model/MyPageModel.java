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
import com.sist.dao.AskDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.PlaceDAO;
import com.sist.dao.PlaceLikeDAO;
import com.sist.vo.AskVO;
import com.sist.vo.MemberVO;
import com.sist.vo.PlaceVO;

@Controller
public class MyPageModel {
	@RequestMapping("mypage/mypage.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("page", "update");
		request.setAttribute("mypage_jsp", "../member/join_update_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/join_update_ok.do")
	public String member_join_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("page", "update");
		request.setAttribute("mypage_jsp", "../member/join_update_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("member/join_delete_ok.do")
	public String member_join_delete_ok(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("page", "delete");
		request.setAttribute("mypage_jsp", "../member/join_delete_ok.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	
	// 회원수정 - 비밀번호 확인
	@RequestMapping("member/join_update_pwdConfirm.do")
	public String member_join_update_pwdConfirm(HttpServletRequest request,HttpServletResponse response) {
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("type");
		boolean bCheck=false;
		HttpSession session=request.getSession();		
		String id=(String)session.getAttribute("id");
		
		MemberVO vo=MemberDAO.memberInfoData(id);
		
		
		if(vo.getPwd().equals(pwd)) {
			bCheck=true;
		}
		request.setAttribute("type",type);
		request.setAttribute("bCheck", bCheck);
		return "../member/join_update_pwdConfirm.jsp";
	}
	
	// 회원수정 화면
	@RequestMapping("member/join_update.do")
	public String member_join_update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();		
		String id=(String)session.getAttribute("id");
		
		MemberVO vo=MemberDAO.memberInfoData(id);
		String tel1=vo.getTel().substring(3,7);
		String tel2=vo.getTel().substring(7);
		vo.setTel1(tel1);
		vo.setTel2(tel2);
		request.setAttribute("page", "update");
		request.setAttribute("vo", vo);
		request.setAttribute("mypage_jsp", "../member/join_update.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	} 
	
	// 회원 수정 완료
	@RequestMapping("member/join_update_success.do")
	  public String member_join_update_success(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   String id=request.getParameter("id");
		   String email=request.getParameter("email");
		   String post=request.getParameter("post");
		   String addr1=request.getParameter("addr1");
		   String addr2=request.getParameter("addr2");
		   String tel1=request.getParameter("tel1");
		   String tel2=request.getParameter("tel2");
		   
		   MemberVO vo=new MemberVO();

		   vo.setId(id);
		   vo.setEmail(email);
		   vo.setPost(post);
		   vo.setAddr1(addr1);
		   vo.setAddr2(addr2);
		   vo.setTel("010"+tel1+tel2);
		  
		   //  수정 (DAO)
		   MemberDAO.memberUpdate(vo);
		   return "redirect:../mypage/mypage.do";
	   }
	
	//회원 탈퇴
	@RequestMapping("member/join_delete.do")
	public String memeber_join_delete(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// DAO연동
		MemberDAO.memberDelete(id);
		session.invalidate();

		return "redirect:../main/main.do";
	}
	
	//[마이페이지] 좋아요 목록 조회
	@RequestMapping("mypage/like_list.do")
	public String place_like_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		//페이지네이션
		String page = request.getParameter("page");
		if(page==null)
			page="1";
		int curPage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize*curPage)-(rowSize-1);
		int end = rowSize*curPage;
		
		int totalL = PlaceLikeDAO.placeLikeCount(member_id);
		int totalPage = (int)Math.ceil((double)totalL/5.0);
		final int BLOCK = 5;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("member_id", member_id);
		List<Integer> list = PlaceLikeDAO.placeLikeGetNo(map);

		List<PlaceVO> pList = new ArrayList<PlaceVO>();
		for(int pno:list) {
			PlaceVO vo = PlaceLikeDAO.placeLikeListData(pno);
			pList.add(vo);
		}
		
		request.setAttribute("page", "likelist");
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pList", pList);
		request.setAttribute("mypage_jsp", "../mypage/like_list.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	//[마이페이지] 유저가 작성한 문의글 목록
	@RequestMapping("mypage/ask_list.do")
	public String mypage_ask_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
	    if(page==null)
	    	page = "1";
	    HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
	    
	    //페이지네이션
		int curPage = Integer.parseInt(page);
	    int rowSize = 5;
	    int start = rowSize*curPage-(rowSize-1);
	    int end = rowSize*curPage;
	    int totalCount = AskDAO.user_askTotalCount(member_id);
		int totalPage = (int)Math.ceil((double)totalCount/10.0);
	    final int BLOCK = 5;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1; //1~5까지 0*BLOCK+1로 처리됨
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
	    Map map = new HashMap();
	    map.put("start", start);
	    map.put("end", end);
	    map.put("member_id", member_id);
		List<AskVO> list = AskDAO.user_askList(map);
		for(AskVO vo:list) {
			   String data = vo.getContent();
			   if(data.length()>20) {
				   data = data.substring(0,20)+"...";
				   vo.setContent(data);
			   }
		}
		request.setAttribute("page", "asklist");
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/ask_list.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	//[유저] 문의글 삭제 --마이페이지에서 삭제처리?
	@RequestMapping("mypage/ask_delete.do")
	public String mypage_ask_delete(HttpServletRequest request, HttpServletResponse response) {
		AskVO vo = new AskVO();
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		String no = request.getParameter("no");
		vo.setMember_id(member_id);
		vo.setNo(Integer.parseInt(no));
		AskDAO.user_askDelete(vo);
		
		return "redirect:../mypage/ask_list.do";
	}
	// 문의글 답변보기
	@RequestMapping("mypage/replyDetail.do")
	public String mypage_replyDetail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		AskVO vo=AskDAO.admin_askDetailData(Integer.parseInt(no));
		AskVO vo2=AskDAO.user_GetReply(vo);

		
		request.setAttribute("vo", vo2);
		return "../mypage/getReply.jsp";
	}

}
