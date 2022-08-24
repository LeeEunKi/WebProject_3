<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $( function() {
	   $('#prevMonth').click(function(e){
		    e.preventDefault();
			let year=$('#year').text();
			year = parseInt(year.trim());
			let month=$('#month').text();
			month = parseInt(month.trim());
			if(month-1<8){
				alert("이전 달은 볼 수 없습니다.")
				return;
			}
			let place_no = $(this).attr("place_no");
			$.ajax({
				type:'post',
				url:'../reserve/select_date.do',
				data:{"place_no":place_no, "year":year,"month":month-1},
				success:function(result){
					$('#print_cal').html(result);
				},
				error:function(request,status,error){
					console.log("error!!!");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
					}
			})
		})
		$('#nextMonth').click(function(e){
			e.preventDefault();
			let year=$('#year').text();
			year = parseInt(year.trim());
			let month=$('#month').text();
			month = parseInt(month.trim());
			let place_no = $(this).attr("place_no");
			$.ajax({
				type:'post',
				url:'../reserve/select_date.do',
				data:{"place_no":place_no, "year":year,"month":month+1},
				success:function(result){
					$('#print_cal').html(result);
				},
				error:function(request,status,error){
					console.log("error!!!");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
					}
			})
		})  
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
 <div style="height:20px"></div>
      <table>
        <tr><td>
        <div style="color:#2964D9;font-size: x-large;text-align: -webkit-center;">
          	<img src="../images/left-arrow.png" id="prevMonth" place_no="${place_no }" style="width:15px;height:15px">
          	<span id="year">${year }</span>.<span id="month">${month }</span>
          	<img src="../images/right-arrow.png" id="nextMonth" place_no="${place_no }" style="width:15px;height:15px">
          	<input type="hidden" id="place_no" value="${place_no }">
         </div>
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
      		<%--1 일부터 출력 --%>
      		<td class="text-center date-pick" data-month="${month }" data-no="${i }"
      		 style="color:${days[i]==1||(sm>month&&sy==year)||(i<day&&sm==month&&sy==year)?'#d4d4d4':'' }; pointer-events:${days[i]==1||(sm>month&&sy==year)||(i<day&&sm==month&&sy==year)?'none':''}">${i }</td> 
      		<c:set var="week" value="${week+1 }"/>
      		<c:if test="${week>6 }"><%--일요일 다음에 출력 --%>
      			</tr>
      			<c:set var="week" value="0"/>
      			<tr height="50px">
      		</c:if>
      	</c:forEach>
      </table>
</body>
</html>