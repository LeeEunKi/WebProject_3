<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
a{
 color: black;
 font-size: 15px;
/* } */
</style>
</head>
<body>
 <h2 class="sectiontitle">문의 사항</h2>
  <table class="table"> 
    <tr>
      <th width="10%" class="text-center">번호</th>
      <th width="30%" class="text-center">문의내용</th>
      <th width="10%" class="text-center">아이디</th>
      <th width="10%" class="text-center">작성일</th>
      <th width="20%" class="text-center"></th> 
      <th width="20%" class="text-center">문의 장소</th>
    </tr>
    <c:forEach var="vo" items="${list }">
	    <tr>
	      <td width="10%" class="text-center">${vo.no }</td>
	      <td width="30%"><a href="#">${vo.content }</a></td>
	      <td width="10%" class="text-center">${vo.member_id }</td>
	      <td width="10%" class="text-center">${vo.dbday }</td>
	      
	      <td width="20%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }">
	         <img src="${vo.place_img }" style="width: 100px;height: 100px;">
	       </a>  
	      </td>	      
	      <td width="20%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }">
	         ${vo.place_name }
	       </a>  
	      </td>	      
	    </tr>
    </c:forEach>
  </table>
</body>
</html>