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
a{
 color: black;
 font-size: 15px;
 } 
</style>
</head>
<body>
 <h2 class="sectiontitle">문의 사항<span style="color:red; font-size: 20px;">&nbsp;(총 ${totalCount }건)</span></h2>
  <table class="table"> 
   <thead>
    <tr> 
      <th width="20%" class="text-center"></th> 
      <th width="5%" class="text-center">번호</th>
      <th width="25%" class="text-center">문의장소</th>
      <th width="30%" class="text-center">문의내용</th>
      <th width="10%" class="text-center">작성자</th>
      <th width="10%" class="text-center">작성일</th>
    </tr>
   </thead>
   <tbody>
    <c:forEach var="askVO" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="20%" class="text-center">
	       <a href="../place/detail.do?no=${askVO.place_no }"><img src="${askVO.place_img }" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="5%" class="text-center">${askVO.no }</td> <!-- 번호 -->
	      <td width="25%" class="text-center"><a href="../place/detail.do?no=${askVO.place_no }">${askVO.place_name }</a></td><!-- 문의 장소 -->	   
	      <td width="30%"><a href="../adminpage/askReply_insert.do?ask_no=${askVO.no }">${askVO.content }</a></td><!-- 문의 내용 -->
	      <td width="10%" class="text-center">${askVO.member_id }</td><!-- 문의한 유저 아이디 -->
	      <td width="10%" class="text-center">${askVO.dbday }</td><!-- 문의 날짜 -->
	    </tr>
    </c:forEach>
   </tbody> 
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