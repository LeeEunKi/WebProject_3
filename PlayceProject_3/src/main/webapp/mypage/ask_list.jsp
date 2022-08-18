<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
    <h2>나의 문의 내역</h2>
  </div> 
  <table class="table"> 
    <tr> 
      <th width="25%" class="text-center" colspan="2">문의장소</th>
      <th width="30%" class="text-center">문의내용</th>
      <th width="15%" class="text-center">작성일</th>
      <th width="10%" class="text-center">답변상태</th>
      <th width="10%" class="text-center">문의삭제</th>
    </tr>
    <c:forEach var="askVO" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="10%" class="text-center">
	       <a href="../place/detail.do?no=${askVO.place_no }#ask"><img src="${askVO.place_img }" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="25%" class="text-center"><a href="../place/detail.do?no=${askVO.place_no }#ask">${askVO.place_name }</a></td><!-- 문의 장소 -->	   
	      <td width="30%">${askVO.content }</td><!-- 문의 내용 -->
	      <td width="15%" class="text-center">${askVO.dbday }</td><!-- 문의 날짜 -->
	      <td width="10%" class="text-center">${askVO.isReply==1?"답변완료":"답변대기"}</td>
	      <td width="10%" class="text-center"><a href="../mypage/ask_delete.do?place_no=${askVO.place_no }" style="color:#2964D9">삭제</a></td>
	    </tr>
    </c:forEach>
  </table>
  <!-- 페이지네이션 시작 -->
 <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../adminpage/askReply.do?page=${startPage-1 }">&laquo;</a>
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
  		<a ${style } href="../adminpage/askReply.do?page=${i}" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../adminpage/askReply.do?page=${endPage+1 }">&raquo;</a>
   		</c:if>
	</div> 
	<!-- 페이지네이션 끝 -->
</body>
</html>