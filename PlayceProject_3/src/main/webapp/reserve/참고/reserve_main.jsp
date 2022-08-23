<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#reserveMain{
	width:100%;
	height:500px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<table id="reserveMain">
		<tr>
			<td width="30%" rowspan="4">
				<h2>예약한 장소 정보</h2>
			</td>
		</tr>
		<tr>
			<td width="30%">
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
				      			<!-- 요일만큼 공백을 만들어 줌  -->
				      		</c:if>
				      		<td class="text-center date-pick" data-no="${i }" style="color:${days[i]==1||i<day?'#d4d4d4':'' }; pointer-events:${days[i]==1||i<day?'none':''}">${i }</td>
				      		<!--  1 일부터 출력 -->
				      		<c:set var="week" value="${week+1 }"/>
				      		<c:if test="${week>6 }"><!-- 일요일 다음에 출력 -->
				      			</tr>
				      			<c:set var="week" value="0"/>
				      			<tr height="50px">
				      		</c:if>
				      	</c:forEach>
				      </table>
				    </div>
			</td>
			<td width="30%">
				옵션주차
			</td>
		</tr>
		<tr>
			<td width="30%"><div id="print_time"></div></td>
			<td width="30%"><div id="print_option"></div></td>
		</tr>
		<tr>
			<td width="30%"><div id="print_duration"></div></td>
			<td width="30%">금액예약</td>		
		</tr>
	</table>
</body>
</html>