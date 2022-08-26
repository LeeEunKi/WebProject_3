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
	
	$('#btn-agree').click(function() {
		if(!($("#checked_agree").prop("checked"))){
			alert("약관의 동의해주세요!");		  
		}
		else{
			location.href="../member/join_form.do";
		}
		return;
	})

	$('#joinBtn').click(function(){	
		if(!$("#member_id").val()){
		    $("#member_id").focus();
		    return;
		}
		if(!$("#member_pwd").val()){
			$("#member_pwd").focus();
		    return;
		}
		if(!$("#member_pwd2").val()){
			$("#member_pwd2").focus();
		    return;
		}
		if(!$("#member_name").val()){
			$("#member_name").focus();
		    return;
		}
		if(!$("#member_email").val()){
			$("#member_email").focus();
		    return;
		}
		if(!$("#member_tel").val()){
			$("#member_tel").focus();
		    return;
		}
		if(!$("#member_post").val()){
			$("#member_addr2").focus();
		    return;
		}
		if(!$("#member_addr1").val()){
			$("#member_addr2").focus();
		    return;
		}
 		if(idCheck==1 && emailCheck==1 && pwdCheck==1){
 			$('#member_join').submit();
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

	$("#member_pwd2").on('focusout', function(){
		if($("#member_pwd").val() == $("#member_pwd2").val()){
			$("#confirmPrint").text("비밀번호가 일치합니다.");
			$("#confirmPrint").css("color", "blue");
			pwdCheck=1;
		}
		else if($("#member_pwd").val() != $("#member_pwd2").val()){
			$("#confirmPrint").text("비밀번호가 일치하지 않습니다.");
			$("#confirmPrint").css("color", "red");	
			pwdCheck=0;
		}
			
	});
	
	
	$('#idBtn').click(function() {
		let id=$('#member_id').val();
		
		if(id.trim()=="")
		{
			$("#member_id").focus();
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
						$('#member_id').val("");
						$('#member_id').focus();

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
	$('#member_id').keydown(function() {
		idCheck=0;
		$('#idPrint').text("");
	})

	
	$('#emailBtn').click(function() {	
		let email=$('#member_email').val();
		let exptext= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
		if(email.trim()==""){
			$("#member_email").focus();
			$('#emailPrint').text("필수 입력사항 입니다!");
			$("#emailPrint").css("color", "red");
			return;
		}
		else
		{
			if(exptext.test(email)==false){
				$('#emailPrint').text("이메일 형식이 올바르지 않습니다.");
				$("#emailPrint").css("color", "red");
				$('#member_email').focus();
			}
			else{
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
							$('#member_email').val("");
							$('#member_email').focus();
						}
						else{
							$('#emailPrint').text("사용 가능한 이메일입니다.");
							$("#emailPrint").css("color", "blue");
							emailCheck=1;
						}		
					}
				 })
			} 
		}
	})
	
	// 이메일을 다시 입력하면 emailCheck값 초기화
	$('#member_email').keydown(function() {
		emailCheck=0;
		$('#emailPrint').text("");
	})
		
	$('#postBtn').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#member_post').val(data.zonecode)
				$('#member_addr1').val(data.address)
			}
		}).open()
	})
	
	$('#btn-main').click(function () {
		location.href="../main/main.do";
	})
	
	$('#btn-login').click(function () {
		Shadowbox.open({
			content:'../member/login.do',
			player:'iframe',
			title:'',
			width:350,
			height:552
		})
	})
})
</script>  
<style>
.tab_list {
    border-bottom: 2px dashed #e0e0e0;
    padding: 80px 0;
    margin-left: -1px;
    padding-top: 15px;
}
.tab_list li {
    float: left;
    margin-left: 10px;
    z-index: 1;
}
ul, li {
    list-style: none;
}
.bt_blue{
    background: #4d7be5;
    width: 256px;
    height: 44px;
    font-size: 16px;
    font-weight: bold;
    border: 1px solid #3e6dda;
    
    color: #fff;
    font-family: Dotum, "돋움";
    font-size: 14px;
}
.bt_s_gray{
    width: 256px;
    height: 44px;
    font-size: 16px;
    font-weight: bold;
    background: #bdbdbd;
    border: 1px solid #b1b1b1;
    margin-left: 10px;
    
    color: #fff;
    font-family: Dotum, "돋움";
    font-size: 14px;
}
</style>
</head>
<body>
	<div class="hero page-inner overlay round" style="background-image: url('https://place.onoffmix.com/images/main/topSkin.png?20191216'); height: 50vh;">
		<div class="container">
			<div class="row justify-content-center align-items-center" style="height: 39vh;">
				<div class="col-lg-9 text-center mt-5">
					<h2 class="heading_signup" style="padding-bottom: 150px;" data-aos="fade-up">플레이스에 오신 것을 환영합니다</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="section sec-testimonials">
		<div class="container">		
			<div class="row" style="place-content: center;">
				<div class="col-lg-6" style="width: 45%;">
				  <div>
				   <h1 style="text-align: center; margin-top: 20px;">회원가입</h1>
					<hr>			 
					<ul class="tab_list">
					 <c:choose>
	    				<c:when test="${page == 'agree'}">
	       					<c:set var="over1" value="_over"/>
	       					<c:set var="over2" value=""/>
	       					<c:set var="over3" value=""/>
	     				</c:when>
	     				<c:when test="${page == 'form'}">
	       					<c:set var="over1" value=""/>
	       					<c:set var="over2" value="_over"/>
	       					<c:set var="over3" value=""/>
	     				</c:when>
	     				<c:when test="${page == 'greeting'}">
	       					<c:set var="over1" value=""/>
	       					<c:set var="over2" value=""/>
	       					<c:set var="over3" value="_over"/>
	     				</c:when>
	    			 </c:choose>
					  <li><img class="agree" src="../images/join/join_bt1${over1 }.png" alt="회원약관"></li>
					  <li><img class="form" src="../images/join/join_bt2${over2 }.png" alt="정보입력"></li>
					  <li><img class="greeting" src="../images/join/join_bt3${over3 }.png" alt="가입완료"></li>
					</ul>
					<jsp:include page="${join_jsp }"></jsp:include>
				  </div>	  
				</div>
			</div>
		</div>
	</div>
</body>
</html>