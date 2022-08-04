<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="hero" style="background-image: url('../images/hero_bg_1.jpg');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading aos-init aos-animate" data-aos="fade-up">My page</h1>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item "><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active text-white-50" aria-current="page">Properties</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
</div>


<!-- 
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">커뮤니티</a></li>
      <li><a href="#">자유게시판</a></li>
    </ul>
  </div>
</div>


 -->

<div class="wrapper row3">
  <main class="container clear"> 
     <h2 class="seciontitle">자유게시판</h2>
       	<div class="two_third first" style="height:450px">
       		<table class="table">
       			<tr>
       				<td>
       					<a href="../freeboard/insert.do" class="btn btn-xs btn-danger">새글</a>
       				</td>
       			</tr>
       		</table>
       		
       		<table class="table">
       			<tr>
       				<th width="10%" class="text-center">번호</th>
       				<th width="45%" class="text-center">제목</th>
       				<th width="15%" class="text-center">이름</th>
       				<th width="20%" class="text-center">작성일</th>
       				<th width="10%" class="text-center">조회수</th>
       			</tr>
       			<c:forEach var="vo" items="${list }">
       			<tr>
       				<td width="10%" class="text-center">${vo.no }</td>
       				<td width="45%"><a href="../freeboard/detail.do?no=${vo.no }">${vo.subject }</a>
       					&nbsp;&nbsp;
       					<c:if test="${vo.rcount>0 }">
       						(${vo.rcount })
       					</c:if>
       				</td>
       				<td width="15%" class="text-center">${vo.name }</td>
       				<td width="20%" class="text-center">${vo.dbday }</td>
       				<td width="10%" class="text-center">${vo.hit }</td>
       			</tr>
       			</c:forEach>
       		</table>
       		
       		<table>
       			<tr>
       				<td class="text-left inline">
       					<input type="checkbox" name=fd value="name">이름
       					<input type="checkbox" name=fd value="subject">제목
       					<input type="checkbox" name=fd value="content">내용
       					<input type=text name=ss size=15 class="input-sm">
       					<input type=button value=검색 class="btn btn-sm btn-primary">
       				</td>
       				<td class="text-right inline">
       					<a href="#" class="btn btn-sm btn-success">이전</a>
       					${curpage } page / ${totalpage } pages
       					<a href="#" class="btn btn-sm btn-success">다음</a>
       				</td>
       			</tr>
       		</table>
       	</div>
       	
        <div class="one_third">2/3</div>
  </main>

</div>
</body>
</html>