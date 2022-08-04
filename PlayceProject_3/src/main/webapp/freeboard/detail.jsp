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
	
	//삭제
	/*
		$('$delBtn')
		let btn=document.querySelector("delBtn")
		=> 태그명($(태그명)), 아이디명($(#아이디명)), 클래스명($(.클래스명))
		인접($(태그명+태그명)), 후손($(태그명 태그명)), 자손(태그명>태그명)
		
		이벤트
		- onclick
		    $("태그명").click(function(){
		    	처리내용
		    })
		    $("태그명").on("click",function(){
		    	처리내용
		    })
		    
		- onmouseover : hover와 비슷한 기능
		
		- hover
			$("태그명").hover(function(){
				
			})
			
		- onchange
			<select> 에서 많이 사용됨 => 예약(달력)
			$('태그명').change(function(){
				
			})
			
		- onkeydown, onkeyup => 채팅(엔터눌렀을때..), 서치바
		
		<input value> ==> value ==> val()
		<td>JQuery</td> ==> $("td").text()
		<a href="data" class=""><img src="data">
		$("a").attr("href") $("img").attr("src")
		            ======= href일수도, class일수도 있으니까 속성명을 꼭 넣어줘야함
		                     => class 태그에서 가져오고 싶으면 class 넣어주기
		                     
		
	*/
	$('#delBtn').on("click",function(){
		let pwd=$('#delPwd').val();
		let no=$(this).attr("data-no");
		if(pwd.trim()=="")
		{
			$("#delPwd").focus();
			return;
		}
		
		//alert("password:"+pwd+"\n번호"+no)
		//ajax => 요청, 데이터 받기
		// 번호 받는지 확인하는 코드 => alert("password:"+pwd+"\n번호"+no)
		/*
			type
			url
			data
			success:function(result)
			{
				
			}
			error:function(ex)
			{
				
			}
		*/
		
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
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">커뮤니티</a></li>
      <li><a href="#">상세보기</a></li>
    </ul>
  </div>
</div>

<div class="wrapper row3">
  <main class="container clear"> 
     <h2 class="seciontitle">내용보기</h2>
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
        				<a href="" class="btn btn-xs btn-warning">목록</a>
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
   	
        <div class="one_third">2/3</div>
  </main>
</div>
</body>
</html>