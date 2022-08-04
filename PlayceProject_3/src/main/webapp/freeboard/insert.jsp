<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
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
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">커뮤니티</a></li>
      <li><a href="#">자유게시판</a></li>
    </ul>
  </div>
</div>

<div class="wrapper row3">
  <main class="container clear"> 
     <h2 class="seciontitle">글쓰기</h2>
       	<div class="two_third first">
       	<form method=post action="../freeboard/insert_ok.do" id="frm">
       		<table class="table">
       			<tr>
	       			<th width=20% class="text-right">이름</th>
		       			<td width=80%>
		       				<input type=text name=name size=15 class="input-sm" id="name">
		       			</td>
	       			</tr>
       			<tr>
       			<th width=20% class="text-right">제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="input-sm" id="subject">
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">비밀번호</th>
	       			<td width=80%>
	       				<input type="password" name=pwd size=10 class="input-sm" id="pwd">
	       			</td>
       			</tr>
       			<tr>
	       			<td colspan="2" class="text-center">
	       				<input type=button value="글쓰기" class="btn btn-sm btn-success" id="writeBtn">
	       				<input type=button value="취소" class="btn btn-sm btn-info" onclick="javascipt:history.back()">
	       			</td>
       			</tr>
       		</table>
       		</form>
       	</div>
        <div class="one_third">2/3</div>
  </main>
</div>
</body>
</html>