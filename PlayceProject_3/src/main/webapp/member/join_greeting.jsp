<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.greeting-img{
	width: 150px;
    height: 150px;
    margin-top: 50px;
}
.row-2{
	place-content: center;
}
h2{
    margin-top: 30px;
}
.btn-area{
	margin-top: 30px;
}
</style>
</head>
<body>
 <div class="container">
  <div class="row text-center row-2">
    <img src="../images/join/greeting.png" class="greeting-img">
    <h2>회원가입 완료</h2>
    <p>PLAYCE의 회원이 되신 것을 축하합니다!<br>로그인 후 이용해주세요!</p>
  </div>
  <div class="btn-area">
  	<button type="button" class="bt_s_gray" id="btn-main">메인으로</button>
  	<button type="button" class="bt_blue" id="btn-login">로그인</button>
  </div>
 </div>
</body>
</html>