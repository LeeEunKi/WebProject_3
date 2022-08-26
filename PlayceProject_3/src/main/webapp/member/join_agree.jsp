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
    font-family: Dotum, "돋움", sans-serif;
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
     PLAYCE의 회원으로 가입하세요.
     <br>
     회원님의 회원정보는 회원약관과 개인정보보호정책에 의해 철저히 관리됩니다,
     <br>
     회원가입전, 아래의 이용자약관 및 개인정보보호정책을 반드시 읽어보시기 바랍니다.
   </h3>
   <div class="login_input">
    <p style="font-size: 13px">가입을 원하시면 아래의 <strong>회원약관</strong>을 반드시 확인 하신 후 <strong>동의</strong>를 체크해주세요. </p>
    <textarea class="txt_box" rows="10" cols="62" readonly="readonly">
[메일계정 관리 정책]

1. 안내 사항
  · 메일 주소는 1인 1개가 원칙입니다.
  · 계정(아이디) 변경은 계정 삭제 후 신규계정을 생성해야 합니다.

2. 휴면계정 처리
  · 대상: 6개월 이상 웹메일에 접속하지 않은 계정
  · 적용: 수신메일 차단 및 반송 (사용자 본인 인증 후 사용 가능)

3. 계정 중지 처리
  · 대상: 스팸 발송 등 비밀번호 유출이 의심되는 이상활동 감지로 사용자 확인이 필요한 계정
  · 적용: 메일계정 중지 (관리자 확인 및 비밀번호 변경 후 사용 가능)

4. 계정 삭제
  · 대상: 휴면계정 전환 후 3년 이상 경과한 계정 및 위반행위 계정
  · 적용: 메일계정 삭제 (사용자 고지 및 백업 후 삭제)
  · 위반행위: 지속적인 광고 및 스팸 발송, 정품 소프트웨어 유출, 음란물 배포 등
    </textarea>
    <p>
     <label for="checked_agree" style="cursor: pointer;">
       <input type="checkbox" id="checked_agree" name="mem_agree" title="동의" style="float:left ; margin-right: 5px;">
       회원약관에 동의합니다.
     </label>
    </p>    
   </div>
  <div class="bt_area" style="text-align: center;">
     <button type="button" id="btn-agree" class="bt_blue">동의</button>
     <button type="button" class="bt_s_gray" onclick="location.href='../main/main.do'">동의하지 않습니다.</button>
  </div> 
 </div>
</body>
</html>