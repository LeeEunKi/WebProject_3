<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
  border-collapse: collapse;
  border-spacing: 0;
}
hr {
  color: #2964D9;
   width : 40%;
  height : 30px;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}


	background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
	background-size: cover;
	background-repeat: no-repeat;
   font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;
}

.wrap {
	position: absolute;
	top: 50%;
	left: 30%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}


a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 90px;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px 10px;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

  .answer {
    display: none;
    padding-bottom: 30px;
  }
  #faq-title {
    font-size: 25px;
  }
  .faq-content {
    border-bottom: 1px solid #e0e0e0;
  }
  .question {
    font-size: 19px;
    padding: 30px 0;
    cursor: pointer;
    border: none;
    outline: none;
    background: none;
    width: 100%;
    text-align: left;
  }
  .question:hover {
    color: #2962ff;
  }
  [id$="-toggle"] {
    margin-right: 15px;
  }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

	// $('.details').click(function(){})
	 const items = document.querySelectorAll('.question');

	  function openCloseAnswer() {
	    const answerId = this.id.replace('que', 'ans');

	    if(document.getElementById(answerId).style.display === 'block') {
	      document.getElementById(answerId).style.display = 'none';
	      document.getElementById(this.id + '-toggle').textContent = '+';
	    } else {
	      document.getElementById(answerId).style.display = 'block';
	      document.getElementById(this.id + '-toggle').textContent = '-';
	    }
	  }

	  items.forEach(item => item.addEventListener('click', openCloseAnswer));
	
})

</script>
</head>
<body>

<%-- 요기는 헤더! --%>
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

<%-- 요기부터 메인! --%>
<div class="section section-properties">
	  <div class="container">
	   	<div class="two_third first" style="height:auto">
		  <div class="col-lg-6">
		   <h2 class="font-weight-bold text-primary heading">공지사항</h2>
		   <hr/><br><br>
				
			    <c:forEach var="vo" items="${list }">
			<div class="faq-content" style="width:1100px;">
			  <button class="question" id="que-1"><span id="que-1-toggle">+</span>
			 
	       			<tr>
	       				<td width="10%" class="text-center">${vo.no }</td>
	       				<td width="45%">${vo.subject }</td>
	       			</tr>
			 </button>
			  <div class="answer" id="ans-1">${vo.content}</div>
			  
			</div>
			</c:forEach>
			

			<div class="faq-content">
			  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>'CSS'란 무엇인가요?</span></button>
			  <div class="answer" id="ans-2">캐스케이딩 스타일 시트(Cascading Style Sheets)입니다.</div>
			</div>
			<div class="faq-content">
			  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>'JavaScript'란 무엇인가요?</span></button>
			  <div class="answer" id="ans-3">자바스크립트는 객체(Object)를 기초로 하는 스크립트 프로그래밍 언어입니다.</div>
			</div>
					   
		   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
   			<table>
       			<tr>
       				<td>
       				<c:if test="${sessionScope.admin == 'y' }">
       					<div class="wrap">
					  		<a href="../noticeboard/insert.do" class="button">새글</a>
							<%--<a href="../main/main.do" class="button">홈</a> --%>
						</div>
						</c:if>
       				</td>
       				<!-- 페이지 나누는 기능 => 공지사항에서는 일단 비활성화 -->
       				<!-- <td class="text-right inline">
       				    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	       					<a href="#" class="btn btn-sm btn-success">이전</a>
	       					${curpage } page / ${totalpage } pages
	       					<a href="#" class="btn btn-sm btn-success">다음</a>
       					</td>  -->
       			</tr>
       		</table>
        </div>
    </div>
   </div>
   </div>
  </div>
</div>
    




</body>
</html>