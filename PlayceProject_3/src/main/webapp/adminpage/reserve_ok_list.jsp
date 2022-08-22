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
<style type="text/css">
.title{
	position: relative;
    margin-bottom: 24.5px;
    padding-bottom: 18.5px;
    border-bottom: 1px solid rgb(216, 222, 229);
}
.title h2{
	margin-right: 18px;
    color: rgb(35, 35, 35);
    font-size: 24px;
    font-family: Regular, sans-serif;
    letter-spacing: -0.6px;
}
a{
 color: black;
 font-size: 15px;
 } 
</style>
</head>
<body>
  <div class="title">
    <h2>예약 완료 목록</h2>
  </div> 
  <table class="table"> 
   <thead>
    <tr> 
      <th width="5%" class="text-center" >no</th>
      <th width="20%" class="text-center" colspan="2">문의장소</th>
      <th width="10%" class="text-center">회원 ID</th>
      <th width="10%" class="text-center">예약일</th>
      <th width="10%" class="text-center">예약시간</th>
      <th width="5%" class="text-center">인원</th>
      <th width="5%" class="text-center">주차</th>
      <th width="10%" class="text-center">가격</th>
      <th width="10%" class="text-center">등록일</th>
    </tr>
   </thead>
   <tbody> 
    <c:forEach var="vo" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="5%" class="text-center">${vo.no }</td>
	      <td width="10%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }"><img src="${vo.rep_image}" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="10%" class="text-center"><a href="../place/detail.do?no=${vo.place_no }">${vo.name }</a></td><!-- 문의 장소 -->	   
	      <td width="10%" class="text-center">${vo.member_id }</td>
	      <td width="10%" class="text-center">${vo.rdate }</td>
	      <td width="10%" class="text-center">${vo.rtime }</td>
	      <td width="5%" class="text-center">${vo.capa }명</td>
	      <td width="5%" class="text-center">${vo.parking }대</td>
		  <td width="10%" class="text-center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />원</td>
	      <td width="10%" class="text-center">${vo.dbday }</td>
	    </tr>
	    <tr class="printReply-${askVO.no }" style="vertical-align:middle;" onoff="0">
	    </tr>
    </c:forEach>
   </tbody> 
  </table>
  <!-- 페이지네이션 시작 -->
 <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../adminpage/reserve.do?page=${startPage-1 }&type=1">&laquo;</a>
  	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
	    	<c:when test="${i==curPage }">
	       		<c:set var="style" value="class=active"/>
	     	</c:when>
	    	<c:otherwise>
	       		<c:set var="style" value=""/>
	    	</c:otherwise>
	    </c:choose>
  		<a ${style } href="../adminpage/reserve.do?page=${i}&type=1" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../adminpage/reserve.do?page=${endPage+1 }&type=1">&raquo;</a>
   		</c:if>
	</div> 
	<!-- 페이지네이션 끝 -->
</body>
</html>