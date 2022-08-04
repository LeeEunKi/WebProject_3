<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('#del').click(function(){
		if(i==0)
		{
			$('#delTr').show("slow");
			$('#del').text("취소")
			i=1;
		}
		else
		{
			$('#delTr').hide();
			$('#del').text("삭제")
			i=0;
		}
	})
	

	$('#delBtn').on("click",function(){
		let pwd=$('#delPwd').val();
		let no=$(this).attr("data-no");
		if(pwd.trim()=="")
		{
			$("#delPwd").focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../freeboard/delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim(); 
				if(res=="yes")//정상 수행(비밀번호가 같다)
				{
					location.href="../freeboard/list.do";//sendRedirect()
				}
				else
				{
					alert("비밀번호가 틀립니다!")
					//확인버튼 누르면 비밀번호 한번 지워줌
					$('#delPwd').val("");
					//포커스 두고 다시 입력할수있게 맞춰줌
					$('#delPwd').focus();
				}
			},
			fail:function(err)
			{
				alert(err);
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
				</div>>
			</div>
		</div> -->
	</div>

<div class="section section-properties">
	  <div class="container">
	   	<div class="two_third first" style="height:600px">
		  <div class="col-lg-12">
		  <h2 class="font-weight-bold text-primary heading">게시글 상세보기</h2><br>
       	<div class="two_third first">
       		<table class="table">
       			<tr>
       				<th width=20% class="text-center">번호</th>
       				<td width=30% class="text-center">${vo.no }</td>
       				<th width=20% class="text-center">작성일</th>
       				<td width=30% class="text-center">${vo.dbday }</td>
       			</tr>
       			<tr>
       				<th width=20% class="text-center">이름</th>
       				<td width=30% class="text-center">${vo.name }</td>
       				<th width=20% class="text-center">조회수</th>
       				<td width=30% class="text-center">${vo.hit }</td>
       			</tr>
       			<tr>
       				<th width=20% class="text-center">제목</th>
       				<td colspan="3">${vo.subject }</td>
       			</tr>
       			<tr>
       				<td colspan="4" height="200" valign="top" class="text-center">
       					<pre style="white-space: pre-wrap; background-color: white; border:none">${vo.content }</pre>
       				</td>
        		</tr>
        		<tr>
        			<td colspan="4" class="text-right">
        				<a href="../freeboard/update.do?no=${vo.no }" class="btn btn-xs btn-danger">수정</a>
        				<span class="btn btn-xs btn-info" id="del">삭제</span>
        				<a href="../freeboard/list.do" class="btn btn-xs btn-warning">목록</a>
        			</td>
        		</tr>
        		<tr id="delTr" style="display:none">
        			<td colspan="4" class="text-right inline">
        				<span>비밀번호:</span><input type=password name=pwd size=10 class="input-sm" id="delPwd">
        				<input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-no=${vo.no }>
        			</td>
        		</tr>
       		</table>
       	</div>
       	</div>
       	</div>
       	</div>
       	
</div>
</body>
</html>