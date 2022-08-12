package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PlaceDAO;
import com.sist.vo.PlaceVO;

@Controller
public class ReserveModel {
	//달력 만들기(기본달력 띄워줌)
	@RequestMapping("reserve/calendar.do")
	public String calendar(HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String today = sdf.format(date);
		
		StringTokenizer st = new StringTokenizer(today,"-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();
		
		String strYear = request.getParameter("year");
		if(strYear==null)
			strYear=sy;
		String strMonth = request.getParameter("month");
		if(strMonth==null)
			strMonth=sm;
		
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(sd);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		return "../reserve/calendar.jsp";
	}
	//이전/이후 달 달력 출력
	@RequestMapping("reserve/calendar_select.do")
	public String calendar_select(HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String today = sdf.format(date);
		
		StringTokenizer st = new StringTokenizer(today,"-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();
		
		String strYear = request.getParameter("year");
		if(strYear==null)
			strYear=sy;
		String strMonth = request.getParameter("month");
		if(strMonth==null)
			strMonth=sm;
		
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(sd);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		int week = cal.get(Calendar.DAY_OF_WEEK);//각 월 1일자의 요일을 가져온다.
		int lastday = cal.getActualMaximum(Calendar.DATE); //각 달의 마지막 날
		
		String[] strWeek = {"일","월","화","수","목","금","토"};
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week-1);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);
		
		return "../reserve/calendar_select.jsp";
	}
	//인원 수, 주차 대수 옵션 선택 출력
	@RequestMapping("reserve/option_select.do")
	public String option_select(HttpServletRequest request, HttpServletResponse response) {
		PlaceVO pvo = PlaceDAO.placeDetailData(2635); //예시용 임시 데이터
		request.setAttribute("pvo", pvo);
		return "../reserve/option_select.jsp";
	}
}
