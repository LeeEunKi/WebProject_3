<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
h3 {
    font-size: 12px;
    font-weight: normal;
    padding: 24px 0 23px;
    line-height: 20px;
}
.login_input {
    padding: 32px 40px;
    border: 2px solid #e0e0e0;
    position: relative;
}
label {
    display: block;
    margin-bottom: 0px;
    margin-top: 0px;
}
}
.list_box {
    margin: 14px 0 12px;
}
ul{
 padding-left: 0rem;
}
.li{
	margin: 0px;
}
dt {
    font-weight: bold;
    width: 123px;
    float: left;
    margin-top: 6px;
}
dl {
    word-break: break-all;
    font-family: Dotum, "����", sans-serif;
}
input[type=text],input[type=password],input[type=submit]{
    border: 1px solid #d0d0d0;
    color: #999;
    height: 33px;
    font-size: 12px;
    line-height: 33px;
    padding: 0 12px;
    font-family: Dotum, "����", sans-serif;
    width: 70%;
}
.btn_blue{
    background: #4d7be5;
    width: 256px;
    height: 44px;
    font-size: 16px;
    font-weight: bold;
    border: 1px solid #3e6dda;
    
    margin-top:10px;
    color: #fff;
    font-family: Dotum, "����";
    font-size: 14px;
    width: 100%;
}
.bt_input {
    font-size: 12px;
    color:white;
    margin: 0;
    height: 35px;
    line-height: 35px;
    padding: 0 8px;
    vertical-align: middle;
    background: #bdbdbd;
    border: 1px solid #b1b1b1;
}
p{
	margin-left: 125px;
	font-size: 12px;
}


</style>
</head>
<body>
<div class="tab_form" style="display: block;">
  <form  action="../member/join_ok.do" method="post" id="member_join" name="member_join">
    <h3>�⺻������ ����մϴ�.</h3>
    <div class="login_input">
     <p>ȸ�������� ����������޹�ħ�� ���� �����ϰ� ��ȣ�Ǹ� ȸ������ ����� ���� ���� ���� �Ǵ� �� 3�ڿ��� �������� �ʽ��ϴ�.</p>
     <div class="list_box">
       <ul>
        <li>
         <dl>
          <dt>
           <label for="member_id">���̵�</label>
          </dt>
          <dd>
           <input type="text" title="���̵�" placeholder="���̵�" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 55%" id="member_id" name="id">
           <button type="button" class="bt_input" id="idBtn">�ߺ�Ȯ��</button>
           <p id="idPrint"></p>    
          </dd>
         </dl>
        </li>
        <li>
          <dl>
          <dt>
           <label for="member_pwd">��й�ȣ</label>
          </dt>
          <dd>
           <input type="password" title="��й�ȣ" placeholder="��й�ȣ" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208);" id="member_pwd" name="pwd">
          </dd>
         </dl>
        </li>
        <li>
          <dl>
          <dt>
           <label for="member_pwd_confirm">��й�ȣ Ȯ��</label>
          </dt>
          <dd>
           <input type="password" title="��й�ȣ" placeholder="��й�ȣ Ȯ��" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208);" id="member_pwd2">
           <p id="confirmPrint"></p>   
          </dd>
         </dl>
        </li>
        <li>
          <dl>
          <dt>
           <label for="member_name">�̸�</label>
          </dt>
          <dd>
           <input type="text" title="�̸�" placeholder="�̸�" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208);" id="member_name" name="name">
          </dd>
         </dl>
        </li>
        <li>
         <dl>
          <dt>
           <label for="member_sex" style="margin-top: -7px;">����</label>
          </dt>
          <dd>
           <input type="radio" value="����" name="sex" checked="checked">����
           <input type="radio" value="����" name="sex">����
          </dd>
         </dl>
        </li>
        <li>
         <dl>
          <dt>
           <label for="member_email">�̸���</label>
          </dt>
          <dd>
           <input type="text" title="�̸���" placeholder="�̸���" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 55%" id="member_email" name="email">
           <button type="button" class="bt_input" id="emailBtn">�ߺ�Ȯ��</button>
           <p id="emailPrint"></p>    
          </dd>
         </dl>
        </li>
        <li>
         <dl>
          <dt>
           <label for="member_tel">��ȭ��ȣ</label>
          </dt>
          <dd>
           <input type="text" title="��ȭ��ȣ" placeholder="��ȭ��ȣ" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 70%" id="member_tel" name="tel">   
           <p> - ���� �Է��ϼ���</p>    
          </dd>
         </dl>
        </li>
        <li>
         <dl>
          <dt>
           <label for="member_address">�ּ�</label>
          </dt>
          <dd>
           <input type="text" title="�����ȣ" placeholder="�����ȣ" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 15%" readonly="readonly" id="member_post" name="post">
           <input type="text" title="�ּ�" placeholder="�ּ�" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 46%" readonly="readonly" id="member_addr1" name="addr1">
           <button type="button" class="bt_input" id="postBtn" >�˻�</button>    
           <input type="text" title="���ּ�" placeholder="���ּ�" onfocus="this.style.borderColor='#3e6dda'"
               style="border-color: rgb(208, 208, 208); width: 72%;margin-left: 122px; margin-top: 10px;" id="member_addr2" name="addr2">
          </dd>
         </dl>
        </li>
       </ul>
     </div>
    </div>
    <div class="btn_area">
      <button type="button" class="btn_blue" id="joinBtn">�����ϱ�</button>
    </div>
  </form>
</div>  
</body>
</html>