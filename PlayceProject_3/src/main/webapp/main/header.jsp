<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />


<link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})

$(function() {
	$('.loginImg').css("cursor","pointer")
	$('.logoutImg').css("cursor","pointer")
	//login창 쉐도우박스
	$('.loginImg').click(function() {
		Shadowbox.open({
			content:'../member/login.do',
			player:'iframe',
			title:'',
			width:350,
			height:552
		})
	})
	
	$('.logoutImg').click(function() {
		location.href="../member/logout.do";	
	})
	
})
</script>

<title>Insert title here</title>
</head>
<body>
<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap">
				<div class="site-navigation">
					<span>
					<a href="../main/main.do" class="logo m-0 float-start active">P L A Y C E</a>

					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">			
						<li class="has-children">
							<a href="#">모든 카테고리</a>
							<ul class="dropdown">
								<li class="has-children">
									<a href="#">체육시설</a>
									<ul class="dropdown">
										<li><a href="../place/place_list.do?tno=1">실내체육시설</a></li>
										<li><a href="../place/place_list.do?tno=2">실외 체육시설</a></li>
									</ul>
								</li>
								<li><a href="../place/place_list.do?tno=3">강당/세미나실</a></li>
								<li><a href="../place/place_list.do?tno=4">레스토랑</a></li>
								<li><a href="../place/place_list.do?tno=5">공연장</a></li>
								<li><a href="../place/place_list.do?tno=6">스튜디오</a></li>
								<li><a href="../place/place_list.do?tno=7">파티룸</a></li>
								<li><a href="../place/place_list.do?tno=8">글램핑</a></li>
								<li><a href="../place/place_list.do?tno=9">스터디 카페</a></li>
								<li><a href="../place/place_list.do?tno=10">갤러리</a></li>
							</ul>
						</li>
						<li><a href="../review/img_review.do">사진 리뷰</a></li>
						<li><a href="../freeboard/list.do">커뮤니티</a></li>
						<li><a href="../noticeboard/list.do">공지사항</a></li>
						<c:if test="${sessionScope.id == null }">
						  <li><a class="loginImg">로그인</a></li>
						</c:if>
						<c:if test="${sessionScope.id != null }">
						  <li class="has-children">
						    <a href="#">${sessionScope.name }&nbsp;님</a>
							<ul class="dropdown">
								<li class="has-children">
								<c:if test="${sessionScope.admin == 'n' }">
								  <li><a href="../mypage/mypage.do">마이페이지</a></li>
								</c:if>
								<c:if test="${sessionScope.admin == 'y' }">
								  <li><a href="../adminpage/adminpage.do">관리자페이지</a></li>
								</c:if>
								<li><a class="logoutImg">로그아웃</a></li>
							</ul>
						  </li>											    
						</c:if>  
					</ul>

					<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>
				    </span>
				</div>
			</div>
		</div>
	</nav>

</body>
</html>