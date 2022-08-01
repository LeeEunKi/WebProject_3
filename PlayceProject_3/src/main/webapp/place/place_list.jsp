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
<div class="hero" style="background-image: url('../images/hero_bg_1.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">${type }</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page">Properties</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<div class="section section-properties">
		<div class="container">
			<div class="row">
			<c:forEach var="vo" items="${list }">
			<!-- 하나 출력 -->
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
					<div class="property-item mb-30">

						<a href="property-single.html" class="img">
							<img src="${vo.img }" alt="Image" class="img-fluid">
						</a>

						<div class="property-content">
						  <div class="price mb-2">
						    <span>${vo.name }</span>
						  </div>
						  <div>
						  	<span class="city d-block mb-3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.price}" />원</span>
						    <span class="d-block mb-2 text-black-50">${vo.address }</span>
						    <div class="specs d-flex mb-4">
						      <span class="d-block d-flex align-items-center me-3">
						        <span class="icon-bed me-2"></span>
						        <span class="caption">${vo.capa }명</span>
						      </span>
						      <span class="d-block d-flex align-items-center">
						        <span class="icon-bath me-2"></span>
						        <span class="caption">${vo.parking }대</span>
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
					Pagination (1 of 10)
				</div>
				<div class="col-lg-6 text-center">
					<div class="custom-pagination">
					 <c:if test="${startPage>1 }">
          				<a href="../place/place_list.do?tno=${tno }&page=${startPage-1 }">&laquo;</a>
         			 </c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
          					<a href="../place/place_list.do?tno=${tno}&page=${i }" >${i }</a>
          				</c:forEach>
          				   <c:if test="${endPage<totalPage }">
          					<a href="../place/place_list.do?tno=${tno }&page=${endPage+1 }">&raquo;</a>
         				  </c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- Preloader 
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>-->
</body>
</html>