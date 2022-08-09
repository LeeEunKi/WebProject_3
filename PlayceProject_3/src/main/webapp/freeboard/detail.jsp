<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.balloon-left {
  position: relative;
  display: inline-block;
  margin: 1.5em 0 1.5em 15px;
  padding: 7px 10px;
  width: 1200px;
  height : auto;
  color: #555;
  font-size: 16px;
  background: #FFF;
  border: solid 3px #999;
  
  box-sizing: border-box;
}

.balloon-left:before {
  content: "";
  position: absolute;
  top: 50%;
  left: -24px;
  margin-top: -12px;
  border: 12px solid transparent;
  border-right: 12px solid #FFF;
  z-index: 2;
}

.balloon-left:after {
  content: "";
  position: absolute;
  top: 50%;
  left: -30px;
  margin-top: -14px;
  border: 14px solid transparent;
  border-right: 14px solid #555;
  z-index: 1;
}

.balloon-left p {
  margin: 0;
  padding: 0;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
let u=0;
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
				if(res=="yes")// 정상 수행 (비밀번호가 같다)
				{
					location.href="../freeboard/list.do"; // sendRedirect()
				}
				else
				{
					alert("비밀번호가 틀립니다!")
					$('#delPwd').val("");
					$('#delPwd').focus();
				}
			},
			error:function(request, status, error)
			{
				alert(error);
			}
			
		})
	})
	
	$('.up').click(function(){
		$('.updates').hide();
		let no=$(this).attr("data-no");
		if(u==0)
		{
			$('#update'+no).show();
			u=1;
		}
		else
		{
            $('#update'+no).hide();
            u=0;
		}
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
	   	<div class="two_third first" style="height:auto">
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
      
      <div id="comments">    
        <h2>댓글</h2>
        <ul>
         <c:forEach var="rvo" items="${list }">
         
          
          <div class="balloon-left">
            <article>
              <header>
                <figure class="avatar">
            
                 <c:if test="${sessionScope.id==rvo.id}"><%-- 본인이면 --%>
                  <span class="button" style="color:black" data-no="${rvo.no }">수정</span>
                  <a href="../reply/reply_delete.do?no=${rvo.no }&bno=${vo.no}" class="button" style="color:black">삭제</a>
                 </c:if>
                </figure>
                
                <address>
                By <a href="#">${rvo.name }&nbsp;(${rvo.dbday })</a>
                </address>
              </header>
              <div class="comcont">
              <p><pre style="white-space: pre-wrap; background-color: white;">${rvo.msg }</pre></p>
              </div>
              
              
            </article>
            
             </div>
       
         
            <div style="display:none" id="update${rvo.no }" class="updates">
	            <table class="table">
		          <tr>
		            <td>
		             <form method=post action="../reply/reply_update.do">
		               <input type=hidden name=bno value="${vo.no }">
		               <input type=hidden name=type value="1">
		               <input type=hidden name=no value="${rvo.no }">
		               <textarea rows="5" cols="70" name="msg" style="float: left">${rvo.msg }</textarea>
		               <input type=submit class="btn btn-sm btn-primary" style="height: 105px"
		                value="댓글수정">
		              </form>
		            </td>
		          </tr>
		        </table>
	        </div>
          </c:forEach>
          
        </ul> 
       </div>
     
       <c:if test="${sessionScope.id!=null }">
        <table class="table">
          <tr>
            <td>
             <form method=post action="../reply/reply_insert.do">
               <input type=hidden name=bno value="${vo.no }">
               <input type=hidden name=type value="1">
               <textarea rows="5" cols="100" name="msg" style="float: left"></textarea>
               <input type=submit class="btn btn-sm btn-primary" style="height: 105px"
                value="댓글쓰기">
              </form>
            </td>
          </tr>
        </table>
        </c:if>
       </div>
       
      </div>
            
       		
       	</div>
       	</div>
       	</div>


</body>
</html>