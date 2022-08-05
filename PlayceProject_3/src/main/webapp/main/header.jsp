<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


<link rel="stylesheet" href="../layout/fonts/icomoon/style.css">
<link rel="stylesheet" href="../layout/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="../layout/css/tiny-slider.css">
<link rel="stylesheet" href="../layout/css/aos.css">
<link rel="stylesheet" href="../layout/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})

$(function() {
	$('.images').css("cursor","pointer")
	//login창 쉐도우박스
	$('.images').click(function() {
		Shadowbox.open({
			content:'../member/login.do',
			player:'iframe',
			title:'',
			width:400,
			height:650
		})
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
							<a href="properties.html">모든 카테고리</a>
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
						<li><a href="services.html">사진 리뷰</a></li>
						<li><a href="../freeboard/list.do">커뮤니티</a></li>
						<li><a href="index.html">공지사항</a></li>
						
						<li><a class="images">로그인</a></li>
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