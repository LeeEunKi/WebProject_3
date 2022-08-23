<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('.likeBtn').click(function () {
		alert("로그인 후 추천이 가능합니다");
	})
})
</script>
</head>
<body>		
		  <div class="col-lg-8">
			   
				    <h2 class="heading text-primary" style="padding-top: 30px; display: inline-block;" id="review">장소 리뷰&nbsp;&nbsp;</h2>
				    <h2 class="count" style="padding-top: 30px;">${rtotal }</h2>
				    <h2 class="star" style="color: orange; display: inline-block; padding-left: 25px; position: relative; top: -2px;">★</h2>
				    <c:if test="${avg!=null }">
				      <h3 class="avg" style="padding-left: 5px; display: inline-block; position: relative; top: -3px;">${avg }</h3>
				    </c:if>
				    <c:if test="${avg==null }">
				      <h3 class="avg" style="padding-top: 30px;padding-left: 5px; display: inline-block; position: relative; top: -3px;">0</h3>
				    </c:if>
					  <c:if test="${sessionScope.id!=null}">
					      <form method="post" action="../review/review_insert.do" style="margin-top: 30px; float: right;">
						      <input type="hidden" name=member_id value="${sessionScope.id }"/>
							  <input type="hidden" name=place_no value="${place_no }"/>
							  <p><input type="submit" class="btn btn-primary text-white py-2 px-3" value="리뷰 남기기"/></p>
						  </form>
					   </c:if>
				

				    <!-- <p class="meta">California, United States</p> -->
				    <div class="row-cols-md-auto"> 
					   <a href="#"><img src="../images/img_1.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_2.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_3.jpg" class="img-de-thumbnail"></a>
					</div>  
					
					<c:forEach var="rvo" items="${rList }">
					<div>
					<div class="col-lg-8" style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
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
				  	        <a href="../review/review_like.do?rno=${rvo.no }&pno=${place_no }" class="btn btn-sm btn-success py-2 px-3"><img src="../review/unlike.png" style="width: 16px;height: 16px; display: inline; margin-bottom: 4px; color: #888"><span style="margin-left: 10px">${rvo.rcount }</span></a>
					  	</c:if>
				  	    <c:if test="${sessionScope.id==null }">
				  	        <span class="btn btn-sm btn-success py-2 px-3 likeBtn"><img src="../review/unlike.png" style="width: 16px;height: 16px; display: inline; margin-bottom: 4px; color: #888"><span style="margin-left: 10px">${rvo.rcount }</span></span>
					  	</c:if>
					</div>
					
				    </c:forEach>
						    <!-- 페이지네이션 시작 --> 
						<div class="custom-pagination text-center">
						 <c:if test="${startPage>1 }">
		         				<a href="../place/detail.do?no=${place_no }&page=${startPage-1 }">&laquo;</a>
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
		     				<a ${style } class="page-no" value="${i }">${i }</a>
		      			</c:forEach>
		       				<c:if test="${endPage<totalPage }">
		       					<a href="../place/detail.do?no=${place_no }&page=${endPage+1 }">&raquo;</a>
		      				</c:if>
						</div>
					<!-- 페이지네이션 끝 -->
	
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			    </div>
			    
</body>