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
<h2 class="sectiontitle">나의 찜 목록</h2>
  <c:if test="${totalL==0 }">
  	  <div class="text-center">
	 	<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
	 	<p class="de-text-desc">찜한 공간이 없습니다. <br> 마음에 드는 공간을 찜해보세요!</p>
	 </div>
  </c:if>
  <c:if test="${totalL!=0 }">
  <table class="table"> 
    <tr> 
      <th width="25%" class="text-center"></th> 
      <!-- <th width="25%" class="text-center">장소 번호</th> -->
      <th width="50%" class="text-center">장소 이름</th>
      <th width="25%" class="text-center"></th>
    </tr>
    <c:forEach var="pvo" items="${pList }">
	    <tr style="vertical-align:middle">
	      <td width="25%" class="text-center">
	       <a href="../place/detail.do?no=${pvo.no }"><img src="${pvo.rep_image }" style="width: 100px;height: 100px;"></a>  
	      </td>
	      <%-- <td width="5%" class="text-center">${pvo.no }</td> <!-- 번호 --> --%>
	      <td width="50%" class="text-center"><a href="../place/detail.do?no=${pvo.no }">${pvo.name }</a></td><!-- 문의 장소 -->
	      <td width="25%" class="text-center"><a href="../mypage/like_cancel.do?no=${pvo.no }&page=${curPage}" class="btn btn-primary text-white">찜하기 취소</a></td> 
	    </tr>
    </c:forEach>
  </table>
  <!-- 페이지네이션 시작 -->
  <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../mypage/like_list.do?page=${startPage-1 }">&laquo;</a>
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
  		<a ${style } href="../mypage/like_list.do?page=${i}" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../mypage/like_list.do?page=${endPage+1 }">&raquo;</a>
   		</c:if>
	</div>
	<!-- 페이지네이션 끝 -->
 </c:if>	
</body>
</html>