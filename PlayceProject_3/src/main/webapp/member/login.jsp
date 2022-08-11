<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<title>CodePen - login/signup form animation</title>
<link rel="stylesheet" href="./login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
		$('#tabs').tabs();
	
  		$('#joinBtn').on("click",function(){
  			parent.location.href="../member/join.do";
  			parent.Shadowbox.close();
		})
		
		$('#logBtn').click(function () {
			let id=$('#id').val();
			if(id.trim()==""){
				$('#id').focus();
				return;
			}
			let pwd=$('#pwd').val();
			if(pwd.trim()==""){
				$('#pwd').focus();
				return;
			}

			$.ajax({
				type:'post',
				url:'../member/login_ok.do',
				data:{"id":id,"pwd":pwd},
				success:function(result){
					let res=result.trim();
					// NOID, NOPWD, OK ==> Model => JSP에 출력
					if(res==='NOID'){
						// id가 없는 경우
						alert("아이디가 존재하지 않습니다!");
						$('#id').val("");
						$('#pwd').val("");
						$('#id').focus();
					}
					else if(res==='NOPWD'){
						// pwd가 틀린 경우
						alert("비밀번호가 틀렸습니다!");
						$('#pwd').val("");
						$('#pwd').focus();
					}
					else{
						// 로그인 성공
						parent.location.href="../main/main.do";
					}
				}			
			})
		})
		
		$('#idFindBtn').on('click',function(){
			//1. 이름여부
			let name=$('#id_find_name').val();
			if(name.trim()===""){ //!== ES6
				$('#id_find_name').focus();
				$('#id_find_result').text("이름을 입력하세요!");
				$('#id_find_result').css("color", "red");
				return;
			}
			//2. 이메일
			let email=$('#id_find_email').val();
			if(email.trim()===""){ //!== ES6
				$('#id_find_email').focus();
				$('#id_find_result').text("이메일을 입력하세요!");
				$('#id_find_result').css("color", "red");
				return;
			}
			//3. ajax=>이름 => 전화번호 전송 ====> 결과값을 출력 ==>axios
			$.ajax({
				type:'post',
				url:'../member/id_find.do',
				data:{"name":name,"email":email},
				//4. 출력된 결과값을 읽어온다.
				success:function(result){
					$('#id_find_result').text(result);
					$('#id_find_result').css("color", "red");
				}
			})					
		})
		
})
</script>
<style type="text/css">
.find-row{
    margin-left: -50px;
    width: 330px;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="form-structor">
	<div class="signup">
		<h2 class="form-title" id="signup"><span>or</span>Log in</h2>
		<div class="form-holder">
			<input type="text" class="input" placeholder="ID" id="id" />
			<input type="password" class="input" placeholder="Password" id="pwd"/>
		</div>
		<button class="submit-btn" id="logBtn">로그인</button>
		<button class="submit-btn" id="joinBtn">회원가입</button>
	</div>
	<div class="login slide-up">
		<div class="center">
			<h2 class="form-title" id="login" style="margin-bottom: 35px;"><span>or</span>ID/Password 찾기</h2>
			<div class="find-row">
				<div id="tabs">
				  <ul>
				    <li><a href="#tabs-1">아이디 찾기</a></li>
				    <li><a href="#tabs-2">비밀번호 찾기</a></li>
				  </ul>
				  <div id="tabs-1">
				  	<div class="form-holder">
						<input type="text" class="input" id="id_find_name" placeholder="이름" />
						<input type="text" class="input" id="id_find_email" placeholder="이메일" />
					</div>
					<span class="input" id="id_find_result"></span>
					<button class="submit-btn" id="idFindBtn">찾기</button>
				  </div>
				  <div id="tabs-2">
				  	<div class="form-holder">
						<input type="text" class="input" id="pwd_find_name" placeholder="이름" />
						<input type="text" class="input" id="pwd_find_email" placeholder="이메일" />
					</div>
					<span class="input" id="pwd_find_result"></span>
					<button class="submit-btn" id="pwdFindBtn">찾기</button>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- partial -->
  <script  src="./login_script.js"></script>
</body>
</html>