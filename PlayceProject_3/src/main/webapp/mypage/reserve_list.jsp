<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <h2>나의 예약 내역</h2>
  </div> 
  <table class="table"> 
    <tr> 
      <th width="25%" class="text-center" colspan="2"></th>
      <th width="20%" class="text-center">예약일자</th>
      <th width="20%" class="text-center">예약시간</th>
      <th width="15%" class="text-center">신청일</th>
      <th width="10%" class="text-center">예약상태</th>
      <th width="10%" class="text-center"></th>
    </tr>
    <c:forEach var="vo" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="10%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }">이미지</a>  
	      </td>	      
	      <td></td>
	      <td width="20%" class="text-center">${vo.rdate }</td>
	      <td width="20%" class="text-center">${vo.rtime }</td>
	      <td width="15%" class="text-center">${vo.dbday }</td><!-- 예약신청한 날짜 -->
	      <c:if test="${vo.state==0 }">
	        <td width="10%" class="text-center">예약대기</td>
	      </c:if>
    	  <c:if test="${vo.state==1 }">
	        <td width="10%" class="text-center">예약완료</td>
	      </c:if>
	      <td width="10%" class="text-center"><a href="../mypage/reserve_cancel.do?no=${vo.no }" style="color:#2964D9; font-size: 14px;">취소</a></td>
	    </tr>
    </c:forEach>
  </table>
  <!-- 페이지네이션 시작 -->
  <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../mypage/reserve_list.do?page=${startPage-1 }">&laquo;</a>
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
  		<a ${style } href="../mypage/reserve_list.do?page=${i}" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../mypage/reserve_list.do?page=${endPage+1 }">&raquo;</a>
   		</c:if>
	</div> 
	<!-- 페이지네이션 끝 -->
</body>
</html>