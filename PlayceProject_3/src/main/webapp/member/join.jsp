<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="hero page-inner overlay" style="background-image: url('../images/hero_bg_1.jpg'); height: 50vh;">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading_signup" data-aos="fade-up">플레이스에 오신 것을 환영합니다</h1>

				</div>
			</div>
		</div>
	</div>

	<div class="section sec-testimonials">
		<div class="container">
			
			<div class="row">
				<div class="col-lg-4" style="width: 100%;">
					<form action="index.html" method="post" id="member">

						<h1 style="text-align: center;">회원가입</h1>
					  
						<fieldset>
						  <legend><span class="number">1</span> 기본 정보</legend>
						  <label for="name">아이디:</label>
						  <input type="text" id="id" name="id">

						  <label for="password">비밀번호:</label>
						  <input type="password" id="password" name="password">

						  <label for="password">비밀번호 확인:</label>
						  <input type="password" id="password" name="password">

						  <label for="name">이름:</label>
						  <input type="text" id="name" name="name">
					  
						  <label for="mail">이메일:</label>
						  <input type="email" id="email" name="email">
					 
						  <label class="sex">성별:</label>
						  <input type="radio"  value="남성" name="sex"><label  class="sex">남성</label>
						  <input type="radio"  value="여성" name="sex"><label  class="sex">여성</label>
						  <label></label>


						  <label for="name">전화번호:</label>
						  <input type="text" id="tel" name="tel">

						  <label for="name">주소:</label>
						  <input type="text" id="post" name="post" value="우편번호"><input type="text" id="addr1" name="addr1"><input type="button" value="검색" class="btn btn-primary">

						  <label for="name">상세 주소:</label>
						  <input type="text" id="addr2" name="addr2">
						</fieldset>
					  
						<fieldset>
						  <legend><span class="number">2</span> 마이 프로필</legend>
						
						  <label for="bio">자기소개:</label>
						  <textarea id="bio" name="user_bio"></textarea>
						</fieldset>
					  
					  
						<label>약관동의</label>
						<label class="light" for="development">약관 동의합니까?</label><input type="checkbox" id="development" value="interest_development" name="user_interest"><br>

						<button type="submit" class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;">회원가입</button>
					  
					  </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>