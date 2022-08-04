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
	$('#writeBtn').hide();
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
	/*
	    vuejs 
	    axios.get('url',{
	    	params:{
	    		no:1,
	    		pwd:'1234'
	    	}
	    }).then(result=>{})
	*/
	$('#pwd').keyup(function(){
		let pwd=$('#pwd').val();
		let no=$('#no').val();
		$.ajax({
			type:'post',
            url:'../freeboard/pwd_check.do',
            data:{"pwd":pwd,"no":no},
            // 404 , 500 , 412... success:200
            success:function(result)
            {
            	let res=result.trim();
            	if(res==="yes")
            	{
            		$('#writeBtn').show();
            		$('#print').text("")
            	}
            	else
            	{
            		$('#print').text("비밀번호가 틀립니다!!");
            	    
            	}
            }
		})
	})
})
</script>
</head>
<body>

<%-- 요기는 헤더 --%>
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
	
	
<div class="section section-properties">
	  <div class="container">
	   	<div class="two_third first" style="height:600px">
		  <div class="col-lg-12">
		   <h2 class="font-weight-bold text-primary heading">자유게시판</h2><br>
    <div class="two_third first">
     <form method=post action="../freeboard/update_ok.do" id="frm">
      <table class="table">
        <tr>
          <th width=20% class="text-right">이름</th>
          <td width=80%>
            <input type=text name=name size=15 class="input-sm" id="name" value="${vo.name }">
            <input type=hidden name=no value="${vo.no }" id="no">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">제목</th>
          <td width=80%>
            <input type=text name=subject size=150 class="input-sm" id="subject" value="${vo.subject }">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">내용</th>
          <td width=80%>
            <textarea rows="10" cols="150" name=content id="content">${vo.content }</textarea>
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">비밀번호</th>
          <td width=80% class="inline">
            <input type="password" name=pwd size=10 class="input-sm" id="pwd">
            <span id="print" style="color:red"></span>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=button value="글쓰기" class="button" id="writeBtn">
            <input type=button value="취소" class="button"
              onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
  
</div>
</div>
</div>
</body>
</html>