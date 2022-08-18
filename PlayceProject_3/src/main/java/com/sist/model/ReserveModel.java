package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PlaceDAO;
import com.sist.dao.ReserveDAO;
import com.sist.vo.PlaceVO;

@Controller
public class ReserveModel {
	@RequestMapping("reserve/reserve.do")
	public String reserve(HttpServletRequest request, HttpServletResponse response) {
		
		return "../reserve/reserve.jsp";
	}
	//달력 만들기(기본달력 띄워줌)
	@RequestMapping("reserve/select_date.do")
	public String select_date(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		List<String> list = ReserveDAO.reserveGetDate(Integer.parseInt(place_no));
		
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
		
		//예약된 날짜 거르기
		int[] days = new int[32];
		for(String s:list) {
			StringTokenizer st1 = new StringTokenizer(s,"-");
			String reserved_year = st1.nextToken();
			String reserved_month = st1.nextToken();
			String reserved_day = st1.nextToken();
			System.out.println(reserved_day);
			int d = Integer.parseInt(reserved_day);
				if(d>=day)
					days[d] = 1;
		}
		request.setAttribute("days", days);
		request.setAttribute("place_no", place_no);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week-1);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);
		return "../reserve/reserve.jsp"; 
	}

	@RequestMapping("reserve/select_time.do")
	public static String select_time(HttpServletRequest request, HttpServletResponse response) {
		String day = request.getParameter("day");
		String place_no = request.getParameter("place_no");
		String selectDate = request.getParameter("selectDate");
		System.out.println(place_no);
		//예약가능한 시간 가져오기
		Map map = new HashMap();
		map.put("place_no", Integer.parseInt(place_no));
		map.put("check_date", selectDate);
		List<String> times = ReserveDAO.reserveGetTime(map);

		request.setAttribute("times",times);
		return "../reserve/select_time.jsp";
	}
	
	//인원 수, 주차 대수 옵션 선택 출력
	@RequestMapping("reserve/select_option.do")
	public String select_option_capa(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		PlaceVO pvo = PlaceDAO.placeDetailData(Integer.parseInt(place_no)); //예시용 임시 데이터
		request.setAttribute("pvo", pvo);
		return "../reserve/select_option.jsp";
	}

}
