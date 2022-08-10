<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
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
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})

$(function(){
	let idCheck=0;
	let emailCheck=0;
	let pwdCheck=0;
	
	$('#joinBtn').click(function(){	
		if(!$("#id").val()){
		    $("#id").focus();
		    return;
		}
		if(!$("#pwd").val()){
			$("#pwd").focus();
		    return;
		}
		if(!$("#pwd2").val()){
			$("#pwd2").focus();
		    return;
		}
		if(!$("#name").val()){
			$("#name").focus();
		    return;
		}
		if(!$("#email").val()){
			$("#email").focus();
		    return;
		}
		if(!$("#tel1").val()){
			$("#tel1").focus();
		    return;
		}
		if(!$("#tel2").val()){
			$("#tel2").focus();
		    return;
		}
		if(!$("#post").val()){
			$("#addr2").focus();
		    return;
		}
		if(!$("#addr1").val()){
			$("#addr2").focus();
		    return;
		}
		if(!($("#development").prop("checked"))){
			alert("약관의 동의해주세요!");
		    return;
		}
 		if(idCheck==1 && emailCheck==1 && pwdCheck==1){
 			$('#member').submit();
 			alert("회원가입을 축하합니다! 로그인해주세요.");
		}
		else if(idCheck==0){
			alert("ID 중복체크하세요!");
		}
		else if(emailCheck==0){
			alert("email 중복체크하세요!");
		} 
		else if(pwdCheck==0){
			alert("비밀번호를 확인하세요!");
		} 

	})

	$("#pwd2").on('focusout', function(){
		if($("#pwd").val() == $("#pwd2").val()){
			$("#confirmPrint").text("비밀번호가 일치합니다.");
			$("#confirmPrint").css("color", "blue");
			pwdCheck=1;
		}
		else if($("#pwd").val() != $("#pwd2").val()){
			$("#confirmPrint").text("비밀번호가 일치하지 않습니다.");
			$("#confirmPrint").css("color", "red");	
			pwdCheck=0;
		}
			
	});
	
	
	$('#idBtn').click(function() {
		let id=$('#id').val();
		
		if(id.trim()=="")
		{
			$("#id").focus();
			$('#idPrint').text("필수 입력사항 입니다!");
			$("#idPrint").css("color", "red");
			return;
		}
		else{			
			$.ajax({
				type:'post',
				url:'../member/id_check.do',
				data:{"id":id},
				success:function(result)
				{
					
					let count=parseInt(result.trim());
					if(count==1)
					{
						$('#idPrint').text("이미 사용중인 ID입니다.");
						$("#idPrint").css("color", "red");
						$('#id').val("");
						$('#id').focus();

					}	
					else{
						$('#idPrint').text("사용가능한 ID입니다.");
						$("#idPrint").css("color", "blue");
						idCheck=1;				
					}
				}
			 })	
		}
	})
	
	// 아이디를 다시 입력하면 iCheck값 초기화
	$('#id').keydown(function() {
		idCheck=0;
		$('#idPrint').text("");
	})
		
	$('#emailBtn').click(function() {	
		let email=$('#email').val();
		
		if(email.trim()==""){
			$("#email").focus();
			$('#emailPrint').text("필수 입력사항 입니다!");
			$("#emailPrint").css("color", "red");
			return;
		}
		else
		{
			$.ajax({
				type:'post',
				url:'../member/email_check.do',
				data:{"email":email},
				success:function(result)
				{			
					let count=parseInt(result.trim());
					if(count==1)
					{
						$('#emailPrint').text("이미 사용중인 이메일입니다.");
						$("#emailPrint").css("color", "red");
						$('#email').val("");
						$('#email').focus();
					}
					else{
						$('#emailPrint').text("사용 가능한 이메일입니다.");
						$("#emailPrint").css("color", "blue");
						emailCheck=1;
					}		
				}
			 })	
		}
	})
	
	// 이메일을 다시 입력하면 emailCheck값 초기화
	$('#id').keydown(function() {
		emailCheck=0;
		$('#emailPrint').text("");
	})
		
	$('#postBtn').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
})
</script>  
<style>
/* body {
  min-height: 100vh;

  background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
  background: -webkit-linear-gradient(bottom left, white 0%, #062138 100%);
  background: -moz-linear-gradient(bottom left, #d5e2ed 0%, #062138 100%);
  background: -o-linear-gradient(bottom left, #d5e2ed 0%, #062138 100%);
  background: linear-gradient(to top right, #d5e2ed 0%, #062138 100%);
} */
</style>
</head>
<body>
	<div class="hero page-inner overlay" style="background-image: url('../images/hero_bg_1.jpg'); height: 50vh;">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h2 class="heading_signup" data-aos="fade-up">플레이스에 오신 것을 환영합니다</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="section sec-testimonials">
		<div class="container">
			
			<div class="row">
				<div class="col-lg-6" style="width: 100%;">
					<form action="../member/join_ok.do" method="post" id="member" name="member">
						<h1 style="text-align: center; margin-top: 20px;">회원가입</h1>
						<hr>			  
						<fieldset>
						  <label for="name">아이디:</label>
						  <input type="text" id="id" name="id" required="required">	
						  <input type="button" class="btn btn-primary" id="idBtn" value="중복체크">			  
						  <span id="idPrint" style="display:block;"></span>
						  
						  <label for="password">비밀번호:</label>
						  <input type="password" id="pwd" name="pwd" required>
						  <span id="pwdPrint" style="display:block;"></span>

						  <label for="password">비밀번호 확인:</label>
						  <input type="password" id="pwd2" required="required">
						  <span id="confirmPrint" style="display:block;"></span>

						  <label for="email">이메일:</label>
						  <input type="email" id="email" name="email" required="required">
						  <input type="button" class="btn btn-primary" id="emailBtn" value="중복체크">
						  <span id="emailPrint" style="display:block;"></span>
						  
						  <label for="name">이름:</label>
						  <input type="text" id="name" name="name" required="required">
						  <span id="namePrint" style="display:block; color: red;"></span>
					 
						  <label class="sex">성별:</label>
						  <input type="radio"  value="남자" name="sex" checked="checked">남성
						  <input type="radio"  value="여자" name="sex">여성

						  <label for="name">전화번호:</label>
						  <input type="text" id="tel0" value="010"  readonly="readonly">
						  <input type="text" id="tel1" name="tel1"  maxlength="4"> 
						  <input type="text" id="tel2" name="tel2"  maxlength="4"> 

						  <label for="name">주소:</label >
						  <input type="text" id="post" name="post" value="post"  readonly="readonly">
						  <input type="text" id="addr1" name="addr1" readonly="readonly" required="required">
						  <input type="button" id="postBtn" value="검색" class="btn btn-primary">
						  <span id="addrPrint" style="display:block; color: red;"></span>
						  <label for="name">상세 주소:</label>
						  <input type="text" id="addr2" name="addr2">
						</fieldset>			
					  
						<label>약관동의</label>
						<label class="light" for="development">약관 동의합니까?</label><input type="checkbox" id="development" value="interest_development" name="user_interest"><br>
						<button type="button" id="joinBtn" class="btn btn-primary text-white" style="width: 100%; margin-top: 20px;">회원가입</button>				  
					  </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>