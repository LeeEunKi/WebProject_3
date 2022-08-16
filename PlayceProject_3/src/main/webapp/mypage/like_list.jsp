<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="sectiontitle">문의 사항</h2>
  <table class="table"> 
    <tr> 
      <th width="20%" class="text-center"></th> 
      <th width="5%" class="text-center">장소번호</th>
      <th width="25%" class="text-center">문의장소</th>
      <th width="30%" class="text-center">문의내용</th>
      <th width="10%" class="text-center">작성자</th>
      <th width="10%" class="text-center">작성일</th>
    </tr>
    <c:forEach var="pvo" items="${pList }">
	    <tr style="vertical-align:middle">
	      <td width="20%" class="text-center">
	       <a href="../place/detail.do?no=${pvo.no }"><img src="${pvo.rep_image }" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="5%" class="text-center">${pvo.no }</td> <!-- 번호 -->
	      <td width="25%" class="text-center"><a href="../place/detail.do?no=${pvo.no }">${pvo.name }</a></td><!-- 문의 장소 -->	   
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