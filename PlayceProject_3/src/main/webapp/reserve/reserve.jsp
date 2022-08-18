<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $( function() {
	  $('.date-pick').css("cursor","pointer");
		$('.date-pick').click(function(){
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
  <h3>날짜 선택</h3>
  <div class="row">
      <table class="table">
        <tr>
          <td>
          	<a id="prevMonth">&lt;</a><span id="year">${year }</span>.<span id="month">${month }</span><a id="nextMonth">&gt;</a>
          	<input type="hidden" id="place_no" value="${place_no }">
          </td>
        </tr>
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
      		<td class="text-center date-pick" data-no="${i }" style="background-color:${days[i]==1||i<day?'gray':'' }">${i }</td> <%--1 일부터 출력 --%>
      		<c:set var="week" value="${week+1 }"/>
      		<c:if test="${week>6 }"><%--일요일 다음에 출력 --%>
      			</tr>
      			<c:set var="week" value="0"/>
      			<tr height="50px">
      		</c:if>
      	</c:forEach>
      </table>
    </div>
  <h3>시작시간/대여시간 선택</h3>
  <div id="print_time"></div>
  <h3>인원/주차 선택</h3>
  <div id="print_option"></div>
 <form method="post" action="../reserve/reserve_ok.do">
<input type=hidden name="place_no" id="r_pno">
<input type=hidden name="r_capa" id="r_capa">
<input type=hidden name="r_parking" id="r_parking">
<input type=hidden name="r_date" id="r_date">
<input type=hidden name="r_time" id="r_time">
<input type=hidden name="r_duration" id="r_duration">
<button type="submit" id="reserveBtn">예약하기</button>
</form> 
</body>
</html>