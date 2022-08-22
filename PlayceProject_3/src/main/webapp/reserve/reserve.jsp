<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $( function() {
	 /*  $('#prevMonth').click(function(){
			let year=$('#year').text();
			year = parseInt(year.trim());
			let month=$('#month').text();
			month = parseInt(month.trim());
			if(month-1===0){
				$('#year').text(year-1);
				$('#month').text(12);
			}else{
				$('#year').text(year);
				$('#month').text(month-1);
			}
			$.ajax({
				type:'post',
				url:'../reserve/reserve.do',
				data:{"year":year,"month":month-1},
				success:function(result){
					$('#print_cal').html(result);
				}
			})
		})
		$('#nextMonth').click(function(){
			let year=$('#year').text();
			year = parseInt(year.trim());
			let month=$('#month').text();
			month = parseInt(month.trim());
			if(month+1===13){
				$('#year').text(year+1);
				$('#month').text(1);
			}else{
				$('#year').text(year);
				$('#month').text(month+1);
			}
			$.ajax({
				type:'post',
				url:'../reserve/reserve.do',
				data:{"year":year,"month":month+1},
				success:function(result){
					$('#print_cal').html(result);
				}
			})
		})  */
	  $('.date-pick').css("cursor","pointer");
		$('.date-pick').click(function(){
			$('.date-pick').css("background-color","white");
			$(this).css("background-color","#2964D9");
			let dateno = $(this).attr("data-no");
			let place_no = $('#place_no').val();
			place_no = parseInt(place_no.trim());
			let year = $('#year').text();
			let month = $('#month').text();
			let selectDate = year+"-"+month+"-"+dateno;
			$('#r_date').val(selectDate); //input 데이터삽입
			$.ajax({
				type:'post',
				url:'../reserve/select_time.do', 
				data:{"place_no":place_no, "selectDate":selectDate},
				success:function(result){
					$('#print_time').html(result);
				}
			})
		})
  } );
  </script>
</head>
<body>
<c:if test="${sessionScope.id==null }">
	<p class="de-text-desc">로그인 후 이용해 주세요.</p>
</c:if>
<c:if test="${sessionScope.id!=null }">
  <label class="sche">날짜 선택</label>
  <div class="row" id="print_cal">
  <div style="height:20px"></div>
      <table>
        <tr><td>
          	<!-- <a id="prevMonth">&lt;</a> -->
          	<div style="color:#2964D9;font-size: x-large;text-align: -webkit-center;"><span id="year">${year }</span>.<span id="month">${month }</span></div>
          	<!-- <a id="nextMonth">&gt;</a> -->
          	<input type="hidden" id="place_no" value="${place_no }">
          </td></tr>
      </table>
      <div style="height:15px"></div>
      <table class="table">
      	<tr class="success">
      		<c:forEach var="sw" items="${strWeek }" varStatus="s">
      			<c:choose>
      			<c:when test="${s.index==0 }">
      				<c:set var="color" value="red"/>
      			</c:when>
      			<c:when test="${s.index==6 }">
      				<c:set var="color" value="blue"/>
      			</c:when>
      			<c:otherwise>
      				<c:set var="color" value="black"/>
      			</c:otherwise>
      			</c:choose>
      			<th class="text-center"><h3 style="color:${color}">${sw }</h3></th>
      		</c:forEach>
      	</tr>
      	<c:forEach var="i" begin="1" end="${lastday }">
      		<c:if test="${i==1 }">
      			<tr height="50px">
      			<c:forEach var="j" begin="1" end="${week }">
      				<td>&nbsp;</td>
      			</c:forEach>
      			<%-- 요일만큼 공백을 만들어 줌 --%>
      		</c:if>
      		<td class="text-center date-pick" data-no="${i }" style="color:${days[i]==1||i<day?'#d4d4d4':'' }; pointer-events:${days[i]==1||i<day?'none':''}">${i }</td> <%--1 일부터 출력 --%>
      		<c:set var="week" value="${week+1 }"/>
      		<c:if test="${week>6 }"><%--일요일 다음에 출력 --%>
      			</tr>
      			<c:set var="week" value="0"/>
      			<tr height="50px">
      		</c:if>
      	</c:forEach>
      </table>
    </div>
  <div id="print_time"></div>
  <div id="print_duration"></div>
  <div id="print_option"></div>
 <form method="post" action="../reserve/reserve_ok.do">
<input type=hidden name="place_no" id="r_pno">
<input type=hidden name="r_capa" id="r_capa">
<input type=hidden name="r_parking" id="r_parking">
<input type=hidden name="r_date" id="r_date">
<input type=hidden name="r_time" id="r_time">
<input type=hidden name="r_duration" id="r_duration">
<button type="submit" id="reserveBtn" class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;">예약하기</button>
</form> 
</c:if>
</body>
</html>