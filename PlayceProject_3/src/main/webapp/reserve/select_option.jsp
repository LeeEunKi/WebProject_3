<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#selectCapa').click(function(){
		let capa = $(this).val().trim();
		$('#r_capa').val(capa);//input 데이터삽입
	})
	$('#selectParking').click(function(){
		let parking = $(this).val().trim();
		$('#r_parking').val(parking);//input 데이터삽입
		$('#reserveBtn').css("background-color","#2964D9");
		$('#reserveBtn').css("pointer-events","");
	})
})
</script>
</head>
<body>
<label class="sche">인원/주차 선택</label>
<h3>총 인원</h3>
<select id="selectCapa" name="user_job">
	<optgroup>
	  <c:forEach var="i" begin="1" end="${pvo.capa }" step="1">
	  	<c:if test="${i!=pvo.capa }">
	  	 <option value="${i } ">${i }명</option>
	  	</c:if>
		<c:if test="${i==pvo.capa }">
	  	 <option value="${i }">${i }명(최대)</option>
	  	</c:if>
	 </c:forEach>
	</optgroup> 
</select>
<br>
<c:if test="${pvo.parking!=0 }">
	<h3>주차 대수</h3>
	<select id="selectParking" name="user_job">
		<optgroup>
		  <c:forEach var="i" begin="1" end="${pvo.parking }" step="1">
		  	<c:if test="${i!=pvo.parking }">
		  	 <option value="${i }">${i }대</option>
		  	</c:if>
			<c:if test="${i==pvo.parking }">
		  	 <option value="${i }">${i }대(최대)</option>
		  	</c:if>
		  </c:forEach>
		</optgroup> 
	</select>
</c:if>
<c:if test="${pvo.parking==0 }">
	<select style="display:none">
		<optgroup>
		  	 <option value="0">0대</option>
		</optgroup> 
	</select>
</c:if>
<c:choose>
  <c:when test="${price==0 }">
    <p class="de-price">별도 문의</p>
  </c:when>
  <c:otherwise>
  	<p class="de-price">
    <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</p>
  </c:otherwise>
</c:choose>
</body>
</html>