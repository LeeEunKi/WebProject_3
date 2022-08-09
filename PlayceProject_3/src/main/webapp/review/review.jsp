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
				    <h2 class="heading text-primary"style="padding-top: 30px;" id="review">장소 리뷰&nbsp;&nbsp;<span><h3 class="count">${rcount }</h3></span></h2>
				    <!-- <p class="meta">California, United States</p> -->
				    
					   <a href="#"><img src="../images/img_1.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_2.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_3.jpg" class="img-de-thumbnail"></a>
					   
					<c:forEach var="rvo" items="${rList }">
					<div>
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
						</span><p class="de-text-date">${rvo.dbday }</p>
				  	 	 <p class="de-text-desc">${rvo.content }</p>
					</div>
				    </c:forEach>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			    </div>
</body>
</html>