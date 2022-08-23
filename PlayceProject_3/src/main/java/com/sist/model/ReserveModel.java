package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PlaceDAO;
import com.sist.dao.ReserveDAO;
import com.sist.vo.PlaceVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.TimeVO;

@Controller
public class ReserveModel {
	//달력 만들기(기본달력 띄워줌)
	@RequestMapping("reserve/reserve.do")
	public String reserve(HttpServletRequest request, HttpServletResponse response) {
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
//			System.out.println(reserved_day); //테스트출력
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
	
	//시간 선택
	@RequestMapping("reserve/select_time.do")
	public static String select_time(HttpServletRequest request, HttpServletResponse response) {
		String day = request.getParameter("day");
		String place_no = request.getParameter("place_no");
		String selectDate = request.getParameter("selectDate");
//		System.out.println(place_no); //테스트출력
		//예약가능한 시간 가져오기
		Map map = new HashMap();
		map.put("place_no", Integer.parseInt(place_no));
		map.put("check_date", selectDate);
		List<TimeVO> times = ReserveDAO.reserveGetTime(map);
		
		request.setAttribute("times",times);
		return "../reserve/select_time.jsp";
	}
	
	
	/*
	 *  
import java.util.Arrays;

public class IndexOfTest {
    public static void main(String[] args) {
		String[] arr = {"a","b","c"};
		System.out.println(Arrays.asList(arr).indexOf("b")); //1이 출력된다.
}
	 */
	//대여 시간 선택
	@RequestMapping("reserve/select_duration.do")
	public static String select_duration(HttpServletRequest request, HttpServletResponse response) {
		String[] options = request.getParameterValues("arr");
		String timeno = request.getParameter("timeno");
		String times = options[0].substring(4);
		String[] timeArr = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"};
		String[] strArray = null;  
		strArray = times.split(",");
		int tIndex = Arrays.asList(timeArr).indexOf(timeno);
		int sIndex = Arrays.asList(strArray).indexOf(timeno);
		System.out.println("유효성검사 시작");
		System.out.println("timeArrIndex:"+tIndex+",strArrayIndex:"+sIndex);
		for(String s:strArray) {
//			System.out.println(s);
		}
//		System.out.println(strArray.length);
		
		int durations = 17 - Integer.parseInt(timeno);
		int durations_ = 0;
		if(durations!=strArray.length) {
			boolean bCheck = true;
			for(int i=0;i<16;i++) {
				System.out.println("timeArr "+tIndex+"번째"+timeArr[tIndex]);
				System.out.println("strArray "+sIndex+"번째"+strArray[sIndex]);
				System.out.println("durations:"+durations_);
				if(timeArr[tIndex].equals(strArray[sIndex])) {
//					System.out.println(timeArr[tIndex]+","+strArray[sIndex]);
//					durations_++;
//					tIndex++;
//					sIndex++;
					bCheck = false;
					break;
				}
//				else {
//					System.out.println("else문:"+durations_);
//					durations = durations_;
//					break;
//				}
			}
			if(bCheck==true) {
				System.out.println("else문:"+durations_);
				durations = durations_;
			}else {
				System.out.println(timeArr[tIndex]+","+strArray[sIndex]);
				durations_++;
				tIndex++;
				sIndex++;
			}
		}
		request.setAttribute("durations", durations);
		return "../reserve/select_duration.jsp";
	}
	
	//인원 수, 주차 대수 옵션 선택 출력
	@RequestMapping("reserve/select_option.do")
	public String select_option_capa(HttpServletRequest request, HttpServletResponse response) {
		String place_no = request.getParameter("place_no");
		PlaceVO pvo = PlaceDAO.placeDetailData(Integer.parseInt(place_no)); //예시용 임시 데이터
		String duration = request.getParameter("duration");
		int du = Integer.parseInt(duration); 
//		System.out.println(du); //테스트출력
		int price = pvo.getPrice()*du;
//		System.out.println(price); //테스트출력
		request.setAttribute("price", price);
		request.setAttribute("pvo", pvo);
		return "../reserve/select_option.jsp";
	}
	
	@RequestMapping("reserve/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("id");
		String place_no = request.getParameter("place_no");
		String capa = request.getParameter("r_capa");
		if(capa=="")
			capa = "1";
		String parking = request.getParameter("r_parking");
		if(parking=="")
			parking = "0";
		System.out.println(parking);
		String reserve_date = request.getParameter("r_date");
		String r_time = request.getParameter("r_time");
		String duration = request.getParameter("r_duration");
		ReserveVO vo = new ReserveVO();
		PlaceVO pvo = PlaceDAO.placeDetailData(Integer.parseInt(place_no));
		vo.setPrice(pvo.getPrice());
		//예약데이터 입력
		int maxNo = ReserveDAO.reserveMaxNo();
		vo.setNo(maxNo+1);
		vo.setCheck_date(reserve_date);
		vo.setMember_id(member_id);
		vo.setPlace_no(Integer.parseInt(place_no));
		vo.setCapa(Integer.parseInt(capa));
		vo.setParking(Integer.parseInt(parking));
		int d = Integer.parseInt(duration);
		int rtime = Integer.parseInt(r_time);
		int start = rtime;
		int end = 0;
		int totalPrice = 0;
		for(int i=0; i<d; i++) {
			vo.setCheck_time(rtime);
			ReserveDAO.reserveInsert(vo);
			System.out.println(place_no+","+capa+","+parking+","+reserve_date+","+rtime+","+duration);
			rtime++;
			totalPrice += pvo.getPrice();
			end = rtime;
		}
		System.out.println(totalPrice);
		//조회용 데이터추가
		//tno를 time으로 변경
		String realStart = ReserveDAO.getRealTime(start);
		String realEnd = ReserveDAO.getRealTime(end);
		String timeSpan = realStart+"~"+realEnd;
		System.out.println(timeSpan);
		vo.setRdate(reserve_date);
		vo.setRtime(timeSpan);
		vo.setRep_image(pvo.getRep_image());
		vo.setTotalPrice(totalPrice);
		vo.setName(pvo.getName());
		ReserveDAO.reserveInfoInsert(vo);
		
		request.setAttribute("main_jsp", "../reserve/reserve_ok.jsp");
		return "../main/main.jsp";
	}

}
