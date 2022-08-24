<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%-- 요기는 헤더! --%>
<div class="hero page-inner overlay" style="background-image: url('../images/hero_bg_1.jpg'); height:40vh;">
<!--
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading_signup" data-aos="fade-up"></h1>
				</div>
			</div>
		</div> -->
	</div>

<div class="section section-properties">
	  <div class="container">
		  <div class="col-lg-6">
		     <h2 class="font-weight-bold text-primary heading">"${addr }" 으로 검색된</h2>
		     <span class="sub-title"><span style="color:#132F66; font-weight:bold;">${totalCount }</span>개의 장소</span><br/>
		  </div>
			<div class="row" style="margin-top:20px">
			<c:forEach var="vo" items="${list }">
			<!-- 하나 출력 -->
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
					<div class="property-item mb-30">

						<a href="../place/detail.do?no=${vo.no }" class="img">
							<img src="${vo.rep_image }" alt="Image" class="img-fluid">
						</a>

						<div class="property-content">
						  <span class="d-block mb-2 text-black-50" style="font-size: 15px;">${vo.host_name }</span>
						  <div class="price mb-2">
						    <a href="../place/detail.do?no=${vo.no }" class="price mb-2"><span>${vo.name }</span></a>
						  </div>
						  <div>
						  	<span class="city d-block mb-3"> 
						  		 <c:choose>
								     <c:when test="${vo.price==0 }">
								       별도 문의
								     </c:when>
								     <c:otherwise>
								       <fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />원
								     </c:otherwise>
								   </c:choose>
						  	</span>
						    <span class="d-block mb-2 text-black-50">${vo.address }</span>
						    <div class="specs d-flex mb-4">
						      <span class="d-block d-flex align-items-center me-3">
						      	<img src="../images/capa.png" style="width:18px"/>
						        <span class="caption">&nbsp;${vo.capa }명</span>
						      </span>
						      <span class="d-block d-flex align-items-center">
							      <c:choose>
								     <c:when test="${vo.parking==0 }">
								       <img src="../images/noparking.png" style="width:18px"/>
								     </c:when>
								     <c:otherwise>
								       <img src="../images/parking.png" style="width:18px"/>
								     </c:otherwise>
								   </c:choose>
						        <span class="caption">&nbsp;${vo.parking }대</span>
						      </span>
						    </div>
						    <!-- <a href="property-single.html" class="btn btn-primary py-2 px-3">See details</a>-->
						  </div>
						</div>
					</div> <!-- .item -->
				</div>
			</c:forEach>

			</div>
			<div class="row align-items-center py-5">
				<div class="col-lg-3">
					Pagination (${curpage } of ${totalpage })
				</div>
				<div class="col-lg-6 text-center">
					<div class="custom-pagination">
					 <c:if test="${startPage>1 }">
          				<a href="../place/place_find.do?addr=${addr }&page=${startPage-1 }">&laquo;</a>
         			 </c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:choose>
						     <c:when test="${i==curpage }">
						       <c:set var="style" value="class=active"/>
						     </c:when>
						     <c:otherwise>
						       <c:set var="style" value=""/>
						     </c:otherwise>
						   </c:choose>
          					<a ${style } href="../place/place_find.do?addr=${addr }&page=${i}">${i }</a>
          				</c:forEach>
          				   <c:if test="${endPage<totalpage }">
          					<a href="../place/place_find.do?addr=${addr }&page=${endPage+1 }">&raquo;</a>
         				  </c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--     Preloader
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div> -->
</body>
</html>