<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label class="sche">총 인원</label>
<select id="selectCapa" name="user_job">
	<optgroup>
	  <c:forEach var="i" begin="1" end="${pvo.capa }" step="1">
	  	<c:if test="${i!=pvo.capa }">
	  	 <option value="i">${i }명</option>
	  	</c:if>
		<c:if test="${i==pvo.capa }">
	  	 <option value="i">${i }명(최대)</option>
	  	</c:if>
	 </c:forEach>
	</optgroup> 
</select>
<br>
<c:if test="${pvo.parking!=0 }">
	<label class="sche">주차 대수</label>
	<select id="selectParking" name="user_job">
		<optgroup>
		  <c:forEach var="i" begin="1" end="${pvo.parking }" step="1">
		  	<c:if test="${i!=pvo.parking }">
		  	 <option value="i">${i }대</option>
		  	</c:if>
			<c:if test="${i==pvo.parking }">
		  	 <option value="i">${i }대(최대)</option>
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
<button type="submit" class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;">예약하기</button>
</body>
</html>