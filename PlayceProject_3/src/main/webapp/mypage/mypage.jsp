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
div#menu a{
  letter-spacing: -0.05em; 
  text-decoration: none !important;
  display: inline-block; 
  width: 100%;
}

.popup_menu .m_acco {
  margin-top: 15px;
}

.popup_menu ul {
  margin-bottom: 0;
  list-style-type: none;
  padding-left: 0
}

.popup_menu li a {
  padding: 15px 0px 15px 16px;
}

.popup_menu .m_acco>ul>li {
  border-bottom: 1px solid #d7d8da;

}

.popup_menu .m_acco>ul>li>a {
  color:  #2964D9;
  letter-spacing: -0.1em; 
  margin-right: 10px; 
  font-weight: bold;
  position: relative;
}

</style>




</head>
<body>
<div class="hero" style="background-image: url('../images/hero_bg_1.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading aos-init aos-animate" data-aos="fade-up">My page</h1>
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

<div class="section bg-light">
		<div class="container">
			<div class="row">
			<table width="100%" border:none>
		    	<tr>
		    		<td style="width: 20%">
		    			<div id="menu" class="popup_menu">
							<div class="m_acco">
  								 <ul>
			  						<img src="../images/person_2-min.jpg" alt="Image" class="img-fluid rounded-circle w-30 mb-5">
							   		 <li><a style="font-size: 23px; ">전체카테고리</a></li>
							   			 <li>
							      			<a style="font-size: 20px;" href="#">프로필관리</a><br>				     
							   			 </li> 
							   		
							   		<li>	
							     		 <a style="font-size: 20px;">예약내역</a><br>
							     			 <ul style="font-size: 15px;">
									     		 <li><a href="#">예약내역확인</a></li>
									     		 <li><a href="#">나의리뷰</a></li>
							     			</ul>
							    	</li>
							    	
							     	<li>
							      		<a style="font-size: 20px;" href="#">공간등록</a><br>
							    	</li>
							     
							     	<li>
							     		 <a style="font-size: 20px;" href="#">찜목록</a><br>
							    	</li>
				   				</ul>
				 		   </div>
						</div>
				</td>
			    
			     <td style="height:700px; text-align:center; width:80%">
			        	<p>Section 영역</p>
			     </td>
		   	 	</tr>
				</table>
			
			</div>
		</div>
	</div>




