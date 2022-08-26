<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.login_input {
    padding: 32px 40px;
    border: 2px solid #e0e0e0;
    position: relative;
}
h3 {
    font-size: 12px;
    font-weight: normal;
    padding: 24px 0 23px;
    line-height: 20px;
}
.login_wrap .login_input.join_form .txt_box {
    border: 1px solid #cdcbcb;
    overflow-y: auto;
    height: 118px;
    color: #000;
    margin: 14px 0 12px;
    width: 93%;
    font-family: Dotum, "����", sans-serif;
    padding: 14px 16px;
    line-height: 18px;
}
.bt_area {
    padding: 18px 0 22px;
    border: 0;
}
strong{
  color: #4d7be5;
}
</style>
</head>
<body>
 <div style="display: block;">
   <h3>
     PLAYCE�� ȸ������ �����ϼ���.
     <br>
     ȸ������ ȸ�������� ȸ������� ����������ȣ��å�� ���� ö���� �����˴ϴ�,
     <br>
     ȸ��������, �Ʒ��� �̿��ھ�� �� ����������ȣ��å�� �ݵ�� �о�ñ� �ٶ��ϴ�.
   </h3>
   <div class="login_input">
    <p style="font-size: 13px">������ ���Ͻø� �Ʒ��� <strong>ȸ�����</strong>�� �ݵ�� Ȯ�� �Ͻ� �� <strong>����</strong>�� üũ���ּ���. </p>
    <textarea class="txt_box" rows="10" cols="62" readonly="readonly">
[���ϰ��� ���� ��å]

1. �ȳ� ����
  �� ���� �ּҴ� 1�� 1���� ��Ģ�Դϴ�.
  �� ����(���̵�) ������ ���� ���� �� �ű԰����� �����ؾ� �մϴ�.

2. �޸���� ó��
  �� ���: 6���� �̻� �����Ͽ� �������� ���� ����
  �� ����: ���Ÿ��� ���� �� �ݼ� (����� ���� ���� �� ��� ����)

3. ���� ���� ó��
  �� ���: ���� �߼� �� ��й�ȣ ������ �ǽɵǴ� �̻�Ȱ�� ������ ����� Ȯ���� �ʿ��� ����
  �� ����: ���ϰ��� ���� (������ Ȯ�� �� ��й�ȣ ���� �� ��� ����)

4. ���� ����
  �� ���: �޸���� ��ȯ �� 3�� �̻� ����� ���� �� �������� ����
  �� ����: ���ϰ��� ���� (����� ���� �� ��� �� ����)
  �� ��������: �������� ���� �� ���� �߼�, ��ǰ ����Ʈ���� ����, ������ ���� ��
    </textarea>
    <p>
     <label for="checked_agree" style="cursor: pointer;">
       <input type="checkbox" id="checked_agree" name="mem_agree" title="����" style="float:left ; margin-right: 5px;">
       ȸ������� �����մϴ�.
     </label>
    </p>    
   </div>
  <div class="bt_area" style="text-align: center;">
     <button type="button" id="btn-agree" class="bt_blue">����</button>
     <button type="button" class="bt_s_gray" onclick="location.href='../main/main.do'">�������� �ʽ��ϴ�.</button>
  </div> 
 </div>
</body>
</html>