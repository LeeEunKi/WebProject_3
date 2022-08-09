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
	let checked=0;
	
	$('#joinBtn').click(function(){

		/* let id=$('#id').val();
		let pwd=$('#pwd').val();
		let pwd2=$('#pwd2').val();
		let name=$('#name').val();
		let email=$('#email').val();
		let addr1=$('#addr1').val();
		
		//유효성 검사
		if(id.trim()=="")
		{
			$("#id").focus();
			$('#idPrint').text("필수 입력사항 입니다!")
			return;
		}	
		else{
			$('#idPrint').text("")
		}		
		if(pwd.trim()=="")
		{
			$("#pwd").focus();
			$('#pwdPrint').text("필수 입력사항 입니다!")
			return;
		}
		else{
			$('#pwdPrint').text("")
		}
		if(pwd2.trim()=="")
		{
			$("#pwd2").focus();
			$('#confirmPrint').text("필수 입력사항 입니다!")
			return;
		}
		else{
			$('#confirmPrint').text("")
		}
		if(email.trim()==""){
			$("#email").focus();
			$('#emailPrint').text("필수 입력사항 입니다!")
			return;
		}
		else{
			$('#emailPrint').text("");
		}
			
		if(name.trim()=="")
		{
			$("#name").focus();
			$('#namePrint').text("필수 입력사항 입니다!")
			return;
		}
		else{
			$('#namePrint').text("")
		}
		if(addr1.trim()=="")
		{
			$("#addr1").focus();
			$('#addrPrint').text("필수 입력사항 입니다!")
			return;
		}
		else{
			$('#addrPrint').text("")
		} */
		
		if(idCheck==1 && emailCheck==1){
			$('#member').submit(); // <input type="submit">
		}
		else if(idCheck==0){
			alert("ID 중복체크하세요!");
		}
		else if(emailCheck==0){
			alert("email 중복체크하세요!");
		}

	})
		
	$('#idBtn').click(function() {
		let id=$('#id').val();
		
		if(id.trim()=="")
		{
			$("#id").focus();
			$('#idPrint').text("필수 입력사항 입니다!")
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
						$('#idPrint').text("이미 사용중인 Id입니다.");
						$('#id').val("");
						$('#id').focus();

					}	
					else{
						$('#idPrint').text("사용가능한 ID입니다.");
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
			$('#emailPrint').text("필수 입력사항 입니다!")
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
						$('#email').val("");
						$('#email').focus();
					}
					else{
						$('#emailPrint').text("사용 가능한 이메일입니다.");
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
 body {
  min-height: 100vh;

  background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
  background: -webkit-linear-gradient(bottom left, white 0%, #062138 100%);
  background: -moz-linear-gradient(bottom left, #d5e2ed 0%, #062138 100%);
  background: -o-linear-gradient(bottom left, #d5e2ed 0%, #062138 100%);
  background: linear-gradient(to top right, #d5e2ed 0%, #062138 100%);
} 
#id,#email{
    background: rgba(255, 255, 255, 0.1);
    border: none;
    font-size: 16px;
    height: 45px;
    margin: 0;
    outline: 0;
    padding: 15px;
    width: 76%;
    background-color: #e8eeef;
    color: #8a97a0;
    box-shadow: 0 1px 0 rgb(0 0 0 / 3%) inset;
    margin-bottom: 10px;
    margin-right: 3px;
}
#pwd,#pwd2,#addr2 {
    background: rgba(255, 255, 255, 0.1);
    border: none;
    font-size: 16px;
    height: 45px;
    margin: 0;
    outline: 0;
    padding: 15px;
    width: 100%;
    background-color: #e8eeef;
    color: #8a97a0;
    box-shadow: 0 1px 0 rgb(0 0 0 / 3%) inset;
    margin-bottom: 10px;
}

#tel1,#tel2,#tel3 {
    background: rgba(255, 255, 255, 0.1);
    border: none;
    font-size: 16px;
    height: 20px;
    margin: 0;
    outline: 0;
    padding: 15px;
    width: 100%;
    background-color: #e8eeef;
    color: #8a97a0;
    box-shadow: 0 1px 0 rgb(0 0 0 / 3%) inset;
    margin-bottom: 10px;
}
.btn-detail{
    padding-top: 7px;
    padding-bottom: 5px;
    padding-left: 17px;
    padding-right: 15px;
    width: fit-content; 
    height: fit-content; 
}
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
						  <input type="button" class="btn btn-primary btn-detail" id="idBtn" value="중복체크">			  
						  <span id="idPrint" style="display:block; color: red;"></span>

						  <label for="password">비밀번호:</label>
						  <input type="password" id="pwd" name="pwd" required>
						  <span id="pwdPrint" style="display:block; color: red;"></span>

						  <label for="password">비밀번호 확인:</label>
						  <input type="password" id="pwd2" required="required">
						  <span id="confirmPrint" style="display:block; color: red;"></span>

						  <label for="email">이메일:</label>
						  <input type="email" id="email" name="email" required="required">
						  <input type="button" class="btn btn-primary btn-detail" id="emailBtn" value="중복체크">
						  <span id="emailPrint" style="display:block; color: red;"></span>
						  
						  <label for="name">이름:</label>
						  <input type="text" id="name" name="name" required="required">
						  <span id="namePrint" style="display:block; color: red;"></span>
					 
						  <label class="sex">성별:</label>
						  <input type="radio"  value="남자" name="sex" checked="checked">남성
						  <input type="radio"  value="여자" name="sex">여성

						  <label for="name">전화번호:</label>
						  <input type="text" id="tel1" value="010" style="width: 20%" readonly="readonly"> &nbsp;-
						  <input type="text" id="tel1" name="tel1" style="width: 20%"> &nbsp;-
						  <input type="text" id="tel2" name="tel2" style="width: 20%">

						  <label for="name">주소:</label >
						  <input type="text" id="post" name="post" value="post" style="width: 20%; margin-bottom: 10px;" readonly="readonly">
						  <input type="text" id="addr1" name="addr1" style="width: 61%; margin-right: 0px; margin-bottom: 10px;" readonly="readonly" required="required">
						  <input type="button" id="postBtn" value="검색" class="btn btn-primary btn-detail">
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