<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.hero{
	height: 600px !important;
}
.subject{
	position: relative;
    color: rgb(103, 114, 148);
    font-size: 18px;
    font-family: Medium, sans-serif;
    font-weight: bold;
    letter-spacing: -0.45px;
     margin-bottom: 15px; 
}
.side{
    width: 200px;
    border-right-style: inherit;
    border-right-width: thin;
    border-right-color: graytext;
}
.active{
   font-weight: bold;
   color: #2964D9;
}
</style>
</head>
<body>
<div class="hero" style="background-image: url('../images/hero_bg_3.jpg');">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading aos-init aos-animate" data-aos="fade-up">관리자 페이지</h1>
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
<div class="section">
		<div class="container">
			<div class="row text-left mb-5">
				<div class="col-12">
					<h2 class="font-weight-bold heading text-primary mb-4">관리자 페이지</h2>
					<hr>
				</div>
			</div>

		</div>
</div>

<div class="section pt-0">
	<div class="container">
		<div class="row justify-content-between mb-5">
				<div class="col-lg-3 side" style="border-right-style: solid;">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">게시판 관리</h3>
            			<a href="../adminpage/askReply.do" class="item"><i class="angle right icon"></i>
              				문의사항 관리 </a>
			            <a class="item"><i class="angle right icon"></i>
			                자유게시판 관리 </a>
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">예약 관리</h3>
            			<a class="item"><i class="angle right icon"></i>
              				예약 대기 </a>
			            <a class="item"><i class="angle right icon"></i>
			                예약 승인 </a>
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">회원 정보</h3>
            			<a class="item"><i class="angle right icon"></i>
              				블랙리스트 관리 </a>
			            <a class="item"><i class="angle right icon"></i>
			                회원 활동정지 관리 </a>
          			</div>
			    </div>
		     	<div class="col-lg-9">
				   <jsp:include page="${admin_jsp }"></jsp:include>
			    </div>			    
		 </div>
		</div>
	</div>
</body>
</html>