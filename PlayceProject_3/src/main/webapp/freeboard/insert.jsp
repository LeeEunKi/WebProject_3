<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.button {
border:1x solid white;    
color:black;   
width:120;height:70; 
background-color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$('#frm').submit();
	})
})
</script>
</head>
<body>

<div class="hero page-inner overlay" style="background-image: url('../images/hero_bg_1.jpg'); height:40vh;">
<!--
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading_signup" data-aos="fade-up"></h1>
				</div>
			</div>
		</div> -->
	</div>

<div class="section section-properties" >
	  <div class="container">
	   	<div class="two_third first" style="height:600px">
     <div class="col-lg-12">
		   <h2 class="font-weight-bold text-primary heading">글쓰기</h2><br>
       	<div class="two_third first">
       	<form method=post action="../freeboard/insert_ok.do" id="frm">
       		<table class="table">
       			<tr>
	       			<th width=10% class="text-right">이름</th>
		       			<td width=80%>
		       				<input type=text name=name size=15 class="input-sm" id="name" style="width:80%; height:50px">
		       			</td>
	       			</tr>
       			<tr>
       			<th width=20% class="text-right">제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="input-sm" id="subject">
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">비밀번호</th>
	       			<td width=80%>
	       				<input type="password" name=pwd size=10 class="input-sm" id="pwd">
	       			</td>
       			</tr>
       			<tr>
	       			<td colspan="2" class="text-center">
	       				<div class="wrap">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>
	       				
	       			</td>
       			</tr>
       		</table>
       		</form>
       	</div>
       	</div>
       	</div>
       	</div>


</div>
</body>
</html>