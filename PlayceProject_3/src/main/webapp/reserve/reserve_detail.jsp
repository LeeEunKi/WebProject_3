<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height:30px"></div>
<table class="table">
	<tr>
		<td class="text-center" rowspan="7">
			<img src="${vo.rep_image }" style="width:250px;height:250px">
		</td>
	</tr>
	<tr>
		<td width="20%">예약 번호</td>
		<td width="80%">${vo.no }</td>
	</tr>
		<tr>
		<td width="20%">장소 이름</td>
		<td width="80%">${vo.name }</td>
	</tr>
	<tr>
		<td width="20%">주소</td>
		<td width="80%">${vo.address }</td>
	</tr>
	<tr>
		<td width="20%">예약시간</td>
		<td width="80%">${vo.rdate } / ${vo.rtime }</td>
	</tr>
	<tr>
		<td width="20%">인원/주차 대수</td>
		<td width="80%">${vo.capa }명 / ${vo.parking }대</td>
	</tr>
	<tr>
		<td width="20%">대여 금액</td>
		<c:choose>
		  <c:when test="${vo.price==0 }">
		    <td width="80%">별도 문의</td>
		  </c:when>
		  <c:otherwise>
		  	<td width="80%"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />원</td>
		  </c:otherwise>
		</c:choose>
	</tr>
</table>
</body>
</html>