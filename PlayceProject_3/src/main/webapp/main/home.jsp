<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="../../images/favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="..layout/fonts/icomoon/style.css">
<link rel="stylesheet" href="..layout/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="..layout/css/tiny-slider.css">
<link rel="stylesheet" href="..layout/css/aos.css">
<link rel="stylesheet" href="..layout/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<style type="text/css">
.background-img{
	background-repeat : no-repeat;
    background-size : cover;
   	background : (rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7));                                                                 
   	z-index:1;
}
.category-title{
	margin-top: 20px;
	max-width: 300px;
	color: white;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
     <div class="hero">
		<div class="hero-slide">
			<div class="img overlay" style="background-image: url('../images/hero_bg_3.jpg')"></div>
			<div class="img overlay" style="background-image: url('../images/hero_bg_2.jpg')"></div>
			<div class="img overlay" style="background-image: url('../images/hero_bg_1.jpg')"></div>
		</div>
	  
		
 		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center">
					<h1 class="heading" data-aos="fade-up">모임하기 좋은 곳을 찾았다!</h1>
					<h3 class="heading2" data-aos="fade-up">상상 가능한 모든 공간을 한 눈에 PLAYCE</h1>
					<form action="#" class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
						<input type="text" class="form-control px-4" placeholder="삼성동,성동구,강남대로 등">
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<div class="section">
	<div class="container">
		<div class="row mb-5 align-items-center">
			<div class="col-lg-6">
				<h2 class="font-weight-bold text-primary heading">오늘의 추천 장소</h2>
				<p class="sub-title">뜨기 전에 먼저 예약하세요</p>
			</div>
		</div>
		<div class="row">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
						<!-- item -->
						 <c:forEach var="rvo" items="${rlist }">
							<div class="property-item">
								<a href="property-single.html" class="img">
									<img src="${rvo.rep_image}" class="img-fluid">
								</a>
								<div class="property-content">
								    <span class="d-block mb-2 text-black-50" style="font-size: 15px;">${rvo.host_name }</span>
									<div class="price mb-2"><span>${rvo.name }</span></div>
									<div>
									 <span class="city d-block mb-3">
						  		      <c:choose>
								       <c:when test="${rvo.price==0 }">
								         별도 문의
								       </c:when>
								       <c:otherwise>
								         <fmt:formatNumber type="number" maxFractionDigits="3" value="${rvo.price}" />원
								       </c:otherwise>
								      </c:choose>
						  	         </span>
								 <span class="d-block mb-2 text-black-50">${rvo.address }</span>
							<div class="specs d-flex mb-4">
						      <span class="d-block d-flex align-items-center me-3">
						      	<img src="../images/capa.png" style="width:18px"/>
						        <span class="caption">&nbsp;${rvo.capa }명</span>
						      </span>
						      <span class="d-block d-flex align-items-center">
							      <c:choose>
								    <c:when test="${rvo.parking==0 }">
								      <img src="../images/noparking.png" style="width:18px"/>
								    </c:when>
								    <c:otherwise>
								      <img src="../images/parking.png" style="width:18px"/>
								    </c:otherwise>
								  </c:choose>
						          <span class="caption">&nbsp;${rvo.parking }대</span>
						       </span>
						    </div>
						</div>
					</div>
				</div>
			 </c:forEach>	
			</div>
			<div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
				<span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">Prev</span>
				<span class="next" data-controls="next" aria-controls="property" tabindex="-1">Next</span>
			</div>

		  </div>
	  </div>
   </div>
 </div>
</div>

	
<!-- 기획전 -->
	<div class="section-2">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6">
					<h2 class="font-weight-bold text-primary heading">기획전</h2>
		    		<p class="sub-title">지금 딱 내가 찾는 공간!</p>
					
			</div>
	
		<div class="news container">
		  <c:forEach var="vo" items="${list }" varStatus="s">
			<a href="../place/category_list.do?cno=${vo.no }" class="box vertical box${s.index+1 } background-img" style="background-image: url(${vo.poster});">
				<h3 class="category-title">${vo.title }</h3>
				<div>${vo.subject }<span style="color: yellow;">&nbsp;${categoryCnt.get(s.index) } 곳</span></div>
			</a>
		  </c:forEach>
		</div>
	  </div>
	 </div>
	</div>



	<div class="section sec-testimonials">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6">
					<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">베스트 리뷰</h2>
					<p class="sub-title">The latest and best lifstyle articles selected by our editorial office.</p>
				</div>
				<div class="col-md-6 text-md-end">
					<div id="testimonial-nav">
						<span class="prev" data-controls="prev">Prev</span>
						
						<span class="next" data-controls="next">Next</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4">
					
				</div>
			</div>
			<div class="testimonial-slider-wrap">
				<div class="testimonial-slider">
					<div class="item">
						<div class="testimonial">
							<img src="../images/person_1-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
							<div class="rate">
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">James Smith</h3>
							<blockquote>
								<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
							</blockquote>
							<p class="text-black-50">Designer, Co-founder</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							<img src="../images/person_2-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
							<div class="rate">
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">Mike Houston</h3>
							<blockquote>
								<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
							</blockquote>
							<p class="text-black-50">Designer, Co-founder</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							<img src="../images/person_3-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
							<div class="rate">
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">Cameron Webster</h3>
							<blockquote>
								<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
							</blockquote>
							<p class="text-black-50">Designer, Co-founder</p>
						</div>
					</div>

					<div class="item">
						<div class="testimonial">
							<img src="../images/person_4-min.jpg" alt="Image" class="img-fluid rounded-circle w-25 mb-4">
							<div class="rate">
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
								<span class="icon-star text-warning"></span>
							</div>
							<h3 class="h5 text-primary mb-4">Dave Smith</h3>
							<blockquote>
								<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
							</blockquote>
							<p class="text-black-50">Designer, Co-founder</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
</body>
</html>