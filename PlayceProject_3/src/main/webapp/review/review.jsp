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
				<div class="col-lg-8">

				    <h2 class="heading text-primary" style="padding-top: 30px; display: inline-block;" id="review">장소 리뷰&nbsp;&nbsp;</h2>
				    <h2 class="count" style="padding-top: 30px; display: inline-block;">${rcount }</h2>
				    <h2 class="star" style="color: orange;padding-top: 30px; display: inline-block; padding-left: 35px;">★</h2>
				    <c:if test="${avg!=null }">
				      <h3 class="avg" style="padding-top: 30px;padding-left: 5px; display: inline-block;">${avg }</h3>
				    </c:if>
				    <c:if test="${avg==null }">
				      <h3 class="avg" style="padding-top: 30px;padding-left: 5px; display: inline-block;">0</h3>
				    </c:if>
				    <c:if test="${sessionScope.id!=null}">
				      <form method="post" action="../review/review_insert.do" style="display: inline-block; margin-top: 50px; float: right;">
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
				  	 	 
					  	 	 <form method="post" action="../review/review_like.do?rno=${rvo.no }&place_no=${rvo.place_no }" style="margin-top: 5px;">
						  	 	 <p><input type="submit" id="likeBtn" class="btn btn-success text-white py-1 px-4" style="color: #888 !important;" value="도움돼요 ${rLikeCount }">
						  	 	 
						  	 	 <input type="hidden" name=member_id value="${sessionScope.id }"/>
								 <input type="hidden" name=review_no value="${rno }"/>
					  	 	 </form>
					  	 
					</div>
					
				    </c:forEach>
	
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			    </div>
			    
</body>
</html>