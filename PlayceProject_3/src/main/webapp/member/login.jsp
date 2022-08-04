<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - login/signup form animation</title>
  <link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
  		$('#joinBtn').on("click",function(){
  			parent.location.href="../member/join.do";
  			parent.Shadowbox.close();
		})
})
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="form-structor">
	<div class="signup">
		<h2 class="form-title center" id="signup">P L A Y C E</h2>
		<form action="">
		  <div class="form-holder">
		 	<input type="text" class="input" placeholder="ID" />
			<input type="password" class="input" placeholder="Password" />
		  </div>
		</form>
		<button class="submit-btn">LOGIN</button>
	</div>
	<div class="login slide-up">
		<div class="center" style="width: 85%;">
		  <a href="#" class="btn btn-info" role="button" id="joinBtn">회원가입</a> 
		  <a href="#" class="btn btn-info" role="button">아이디찾기</a> 
		  <a href="#" class="btn btn-info" role="button">비밀번호찾기</a>
		</div>
	</div>
</div>
<!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>
