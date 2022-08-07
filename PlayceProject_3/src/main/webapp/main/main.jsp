<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="../images/favicon.png">

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
    
<title>Property &mdash; Free Bootstrap 5 Website Template by Untree.co</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="${main_jsp }"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
    	<div class="spinner-border" role="status">
    		<span class="visually-hidden">Loading...</span>
    	</div>
    </div>
    
    <script src="../layout/js/bootstrap.bundle.min.js"></script>
    <script src="../layout/js/tiny-slider.js"></script>
    <script src="../layout/js/aos.js"></script>
    <script src="../layout/js/navbar.js"></script>
    <script src="../layout/js/counter.js"></script>
    <script src="../layout/js/custom.js"></script>
  </body>
</html>
