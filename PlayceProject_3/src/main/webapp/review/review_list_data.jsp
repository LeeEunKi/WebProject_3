<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	
	
	$('.likeBtn').click(function () {
		alert("로그인 후 추천이 가능합니다");
	})
})
</script>
<c:forEach var="rvo" items="${rList }">
		<div>
		<!-- <div class="col-lg-8" style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div> -->
	  	  	<p class="de-text-reviewer">${rvo.member_id }</p>
	   	  	<span class="score">
				<c:choose>
					<c:when test="${rvo.score==1 }">
						★
					</c:when>
					<c:when test="${rvo.score==2 }">
						★★
					</c:when>
					<c:when test="${rvo.score==3 }">
						★★★
					</c:when>
					<c:when test="${rvo.score==4 }">
						★★★★
					</c:when>
					<c:otherwise >
						★★★★★
					</c:otherwise>
				</c:choose>
			</span>&nbsp;<p class="de-text-date">${rvo.dbday }</p>
	  	 	 <p class="de-text-desc">${rvo.content }</p>
	  	    <c:if test="${sessionScope.id!=null }">
	  	        <a href="../review/review_like.do?rno=${rvo.no }&place_no=${rvo.place_no }" class="btn btn-sm btn-success py-2 px-3"><img src="../review/unlike.png" style="width: 16px;height: 16px; display: inline; margin-bottom: 4px; color: #888"><span style="margin-left: 10px">${rvo.rcount }</span></a>
		  	</c:if>
	  	    <c:if test="${sessionScope.id==null }">
	  	        <span class="btn btn-sm btn-success py-2 px-3 likeBtn"><img src="../review/unlike.png" style="width: 16px;height: 16px; display: inline; margin-bottom: 4px; color: #888"><span style="margin-left: 10px">${rvo.rcount }</span></span>
		  	</c:if>
		</div>
		
</c:forEach>