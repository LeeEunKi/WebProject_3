<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})

$(function(){
	let emailCheck=1;
	
	$('#editBtn').click(function(){	
		if(!$("#email").val()){
			$("#email").focus();
		    return;
		}
		if(!$("#tel1").val()){
			$("#tel1").focus();
		    return;
		}
		if(!$("#tel2").val()){
			$("#tel2").focus();
		    return;
		}
		if(!$("#post").val()){
			$("#addr2").focus();
		    return;
		}
		if(!$("#addr1").val()){
			$("#addr2").focus();
		    return;
		}
		
 		if(emailCheck==1){
 			$('#editForm').submit();
 			alert("회원정보가 변경되었습니다!");
		}
		else if(emailCheck==0){
			alert("email 중복체크하세요!");
		} 

	})
	
	$('#emailBtn').click(function() {	
		let email=$('#email').val();
		let exptext= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
		if(email.trim()==""){
			$("#email").focus();
			$('#emailPrint').text("필수 입력사항 입니다!");
			$("#emailPrint").css("color", "red");
			return;
		}
		else
		{
			if(exptext.test(email)==false){
				$('#emailPrint').text("이메일 형식이 올바르지 않습니다.");
				$("#emailPrint").css("color", "red");
				$('#email').focus();
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
							$('#email').val("");
							$('#email').focus();
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
	$('#email').keydown(function() {
		emailCheck=0;
		$('#emailPrint').text("");
	})
		
	$('#postBtn').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
})
</script>
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
    display: flex;
    border-bottom: 1px solid rgb(239, 239, 239);
    -webkit-box-align: center;
    align-items: center;
    padding-bottom: 24.5px;
}
.sub-content img{
	width: 84px;
    height: 83px;
    margin-right: 37px;
    border-radius: 10px;
}
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
</style>
</head>
<body>
 <div>
  <div class="title">
   <h2>개인 정보 수정</h2>
  </div> 
  <div class="content">
    <figure class="sub-content" style="margin: 0px;">
      <img src="https://img.shareit.kr:13443/data/character/1.png" alt="${vo.name}">
      <figcaption>
       <b>${vo.name }</b>
       "님"
      </figcaption>
    </figure>
    <div class="sub-content-2">
    <form method="post" action="../member/join_update_success.do" id="editForm">
      <div>
        <input type="hidden" name="id" value="${vo.id }">
	    <label for="name">전화번호:</label>
		<input type="text" id="tel0" value="010"  readonly="readonly">
		<input type="text" id="tel1" name="tel1"  maxlength="4" value="${vo.tel1 }"> 
		<input type="text" id="tel2" name="tel2"  maxlength="4" value="${vo.tel2 }">
	  </div>
      <div>
       	<label for="email">이메일:</label>
		<input type="email" id="email" name="email" required="required" value="${vo.email }">
		<input type="button" class="btn btn-primary" id="emailBtn" value="중복체크">
		<span id="emailPrint" style="display:block;"></span>
      </div>
      <div>
       	<label for="name">주소:</label >
		<input type="text" id="post" name="post" value="post"  readonly="readonly" value="${vo.post }">
		<input type="text" id="addr1" name="addr1" readonly="readonly" required="required" value="${vo.addr1 }">
		<input type="button" id="postBtn" value="검색" class="btn btn-primary">
		<span id="addrPrint" style="display:block; color: red;"></span>
		<label for="name">상세 주소:</label>
		<input type="text" id="addr2" name="addr2" value="${vo.addr2 }">
	  </div>
	  <div>
	    <button type="button" id="editBtn" class="btn btn-primary text-white" style="width:100%; margin-top: 20px;">수정</button>
	  </div>
	</form>  
    </div>
  </div>
 </div>
</body>
</html>