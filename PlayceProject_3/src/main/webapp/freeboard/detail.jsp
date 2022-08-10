<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

table {
  border-collapse: collapse;
  border-spacing: 0;
}
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


button {
    margin: 20px;
    align:left;
    float: left;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}

.w-btn-green {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2 {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-green-outline {
    border: 3px solid #77af9c;
    color: darkgray;
}

.w-btn-green2-outline {
    border: 3px solid #519d9e;
    color: darkgray;
}

.w-btn-green-outline:hover {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2-outline:hover {
    background-color: #519d9e;
    color: #9dc8c8;
}


.w-btn-gray {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red {
    background-color: #ff5f2e;
    color: #e1eef6;

}


.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}

.w-btn-red-outline {
    border: 3px solid #ff5f2e;
    color: #6e6e6e;
}



.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red-outline:hover {
    background-color: #ff5f2e;
    color: #e1eef6;
}



.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}



@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}


.w-btn-neon2:hover::after {
    content: "";
    width: 30px;
    height: 30px;
    border-radius: 100%;
    border: 6px solid #00ffcb;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: ring 1.5s infinite;
}

.button {
border:1x solid white;    
color:black;   
width:10px;height:50px; 
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
.find-btn{
	text-align: center;
	width: 100%;
}

hr {
  color: #2964D9;
   width : 20%;
  height : 30px;
}

button {
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}

button:hover {
    border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}

button:active {
    box-shadow: inset 1px 1px 1px #DFDFDF;   
}



#test_btn1{
	margin-right: 5px;
	display:inline-block;
	margin-top: 0px;
	margin-bottom: 0px;
}
#test_btn2{
	margin-left: -3px;
	display:inline-block;
	margin-top: 0px;
	margin-bottom: 0px;
}

#btn-group {
	width: 100%;
	text-align: center;
	
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
		  <h2 class="font-weight-bold text-primary heading"><b>게시판 상세보기</b></h2>
		  <hr/>
		  <br><br>
		  
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
        			<td colspan="4" class="text-center">
        		    	<button class="w-btn w-btn-green" type="button" style=" display: inline-block;" >
        				<a href="../freeboard/update.do?no=${vo.no }">수정</a>
        				</button>
        				<button class="w-btn w-btn-indigo" type="button" style=" display: inline-block;">
        				<span id="del">삭제</span>
        				</button>
        				<button class="w-btn w-btn-gray" type="button" style=" display: inline-block;">
        				<a href="../freeboard/list.do">목록</a>
        				</button>
        			</td>
        		</tr>
        		<tr id="delTr" style="display:none">
        			<td colspan="4" class="text-right inline">
        				<span style="color: red">  비밀번호를 입력하세요! :  </span><input type=password name=pwd size=10 class="input-sm" id="delPwd">
        				<input type=button value="삭제" class="w-btn w-btn-red" id="delBtn" data-no=${vo.no }>
        			</td>
        		</tr>
       		</table>
      	<br>
      <div id="comments">    
        <h2><b>댓글</b></h2>
        <hr/>
        <ul>
         <c:forEach var="rvo" items="${list }">
         
          
          <div class="balloon-left">
            <article>
              <header>
                <address>
                By <a href="#">${rvo.name }&nbsp;(${rvo.dbday })</a>
                </address>
              </header>
              <div class="comcont">
              <p><pre style="white-space: pre-wrap; background-color: white; font-size: 3">${rvo.msg }</pre></p>
              </div>
              <figure class="avatar">
            	
            	
                 <c:if test="${sessionScope.id==rvo.id}"><%-- 본인이면 --%>
                 <div class="btn-group">
                 <button id="test_btn1">
                   <span class="up" style="color:black" data-no="${rvo.no }">수정</span>
                   </button>
                   <button id="test_btn2">
                  <a href="../reply/reply_delete.do?no=${rvo.no }&bno=${vo.no}" style="color:black">삭제</a>
                  </button>
                  </div>
                 </c:if>
                </figure>
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
		               <textarea rows="5" cols="130" name="msg" style="float: left">${rvo.msg }</textarea>
		               &emsp;
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
            <td>
             <form method=post action="../reply/reply_insert.do">
               <input type=hidden name=bno value="${vo.no }">
               <input type=hidden name=type value="1">
               <textarea rows="5" cols="150" name="msg" style="float: left"></textarea>
               &emsp;
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