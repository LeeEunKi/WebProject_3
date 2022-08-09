<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - login/signup form animation</title>
  <link rel="stylesheet" href="./login.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
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
					// NOID, NOPWD, OK ==> Model => JSP�� ���
					if(res==='NOID'){
						// id�� ���� ���
						alert("���̵� �������� �ʽ��ϴ�!");
						$('#id').val("");
						$('#pwd').val("");
						$('#id').focus();
					}
					else if(res==='NOPWD'){
						// pwd�� Ʋ�� ���
						alert("��й�ȣ�� Ʋ�Ƚ��ϴ�!");
						$('#pwd').val("");
						$('#pwd').focus();
					}
					else{
						// �α��� ����
						parent.location.href="../main/main.do";
					}
						
				}
				
			})
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
		 	<input type="text" class="input" placeholder="ID" id="id"/>
			<input type="password" class="input" placeholder="Password" id="pwd" />
		  </div>
		</form>
		<button class="submit-btn" id="logBtn">LOGIN</button>
	</div>
	<div class="login slide-up">
		<div class="center" style="width: 85%;">
		  <a href="#" class="btn btn-info" role="button" id="joinBtn">ȸ������</a> 
		  <a href="#" class="btn btn-info" role="button">���̵�ã��</a> 
		  <a href="#" class="btn btn-info" role="button">��й�ȣã��</a>
		</div>
	</div>
</div>
<!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>
