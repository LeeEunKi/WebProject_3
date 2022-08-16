<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.title{
	position: relative;
    margin-bottom: 24.5px;
    padding-bottom: 18.5px;
    border-bottom: 1px solid rgb(216, 222, 229);
}
.title h2{
	margin-right: 18px;
    color: rgb(35, 35, 35);
    font-size: 24px;
    font-family: Regular, sans-serif;
    letter-spacing: -0.6px;
}
.content{
    margin-left: 15%;
}
.sub-content{
    padding: 36px 0px 16px;
    color: rgb(185, 185, 185);
    font-size: 16px;
    font-family: Light, sans-serif;
    letter-spacing: -0.4px;
    line-height: 27px;
    border-bottom: 1px solid rgb(239, 239, 239);
    text-align: center;
}
.sub-content-2{
	margin: 85px 0px 47px;
    color: rgb(94, 94, 94);
    font-size: 18px;
    font-family: Regular, sans-serif;
    letter-spacing: -0.45px;
    line-height: 26px;
    text-align: center;
}
.pwd-box{
	display: block;
    width: 364px;
    height: 150px;
    margin: 0px auto;
    border: 1px solid rgb(216, 222, 229);
    border-radius: 4px;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
}
.pwd-input{
    display: flex;
    width: -webkit-fill-available;
    height: 47px;
    padding: 0px 20px;
    border: 1px solid rgb(216, 222, 229);
    border-radius: 4px;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
}
.pwd-input input{
    width: 70% !important;
    color: rgb(35, 35, 35);
    font-size: 16px;
    font-family: Regular, sans-serif;
    letter-spacing: -0.4px;
    display: block;
}
button{
    width: 100%;
    height: 47px;
    margin-top: 30px;
    margin-left: 0px;
	background: rgb(0, 119, 237);
    color: rgb(255, 255, 255);
    font-size: 18px;
    font-family: Medium, sans-serif;
    letter-spacing: -0.9px;
    border-radius: 4px;
    box-shadow: rgb(142 161 200 / 16%) 0px 3px 33px 0px;
}
</style>
</head>
<body>
 <div>
  <div class="title">
   <h2>ȸ�� Ż��</h2>
  </div> 
  <div class="content">
    <div class="sub-content">
     "ȸ������ ���� ������ �����ϰ� ��ȣ�ϰ� �ֽ��ϴ�."
     <br>
     "ȸ������ ���� ���� ȸ�������� ��3�ڿ��� �������� �ʽ��ϴ�."
    </div>
    <div class="sub-content-2">
     "������ ���� ���� ��ȣ�� ����"
     <br>
     "��й�ȣ�� �Է� ��, �̿��� �����մϴ�."
    </div>
    <form method="post" action="../member/join_update_pwdConfirm.do">
    <div class="pwd-box">
     <label for="pwd">
      <span>��й�ȣ</span>
      <input type="password" id="pwd" name="pwd" placeholder="��й�ȣ�� �Է����ּ���.">
      <input type="hidden" id="type" name="type" value="2">
     </label>
     <button type="submit">ȸ�� Ż��</button>
    </div>
    </form>
  </div>
 </div>
</body>
</html>