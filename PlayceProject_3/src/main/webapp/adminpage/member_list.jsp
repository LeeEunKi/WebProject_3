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
a{
 color: black;
 font-size: 15px;
 }
 
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
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

.wrap {
	position: absolute;
	top: 50%;
	left: 30%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".board_info").hover(function(){
		$(this).css("backgroundColor","#FC6").css("cursor","pointer")
	//else면
	},function(){
		$(this).css("backgroundColor","#FFF").css("cursor","none")
	})
	
	$('#fd').keyup(function(){
		let fd=$('#fd').val();
		$('tbody > tr').hide();
		let temp=$('tbody > tr > td:nth-child(6n+1):contains("'+fd+'")')
		$(temp).parent().show()
	})
	// $('.details').click(function(){})
	
})
</script>
</head>
<body>
  <div class="title">
    <h2>회원 목록</h2>
    <div id="board-search">
       	 <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">회원 검색</label>
                        <input type=text size=45 class="input-sm" id="fd" name="fd" placeholder="아이디를 입력해주세요.">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
  </div> 
  <table class="table"> 
   <thead>
    <tr> 
      <th width="10%" class="text-center" >ID</th>
      <th width="10%" class="text-center">이름</th>
      <th width="10%" class="text-center">성별</th>
      <th width="20%" class="text-center">이메일</th>
      <th width="30%" class="text-center">주소</th>
      <th width="10%" class="text-center">연락처</th>
      <th width="10%" class="text-center"></th>
    </tr>
   </thead>
   <tbody> 
    <c:forEach var="vo" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="10%" class="text-center">${vo.id }</td>
	      <td width="10%" class="text-center">${vo.name }</td>
	      <td width="10%" class="text-center">${vo.sex }</td>
	      <td width="20%" class="text-center">${vo.email }</td>
	      <td width="30%" class="text-center">${vo.addr1 } &nbsp; ${vo.addr2 }</td>
		  <td width="10%" class="text-center">${vo.tel }</td>
	      <td width="10%" class="text-center"><a href="../admin/join_delete.do?id=${vo.id }" style="color:#2964D9; font-size: 14px;">탈퇴</a></td>
	    </tr>
	    <tr class="printReply-${askVO.no }" style="vertical-align:middle;" onoff="0">
	    </tr>
    </c:forEach>
   </tbody> 
  </table>
  <!-- 페이지네이션 시작 -->
 <div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../adminpage/reserve.do?page=${startPage-1 }&type=1">&laquo;</a>
  	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
	    	<c:when test="${i==curPage }">
	       		<c:set var="style" value="class=active"/>
	     	</c:when>
	    	<c:otherwise>
	       		<c:set var="style" value=""/>
	    	</c:otherwise>
	    </c:choose>
  		<a ${style } href="../adminpage/reserve.do?page=${i}&type=1" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../adminpage/reserve.do?page=${endPage+1 }&type=1">&raquo;</a>
   		</c:if>
	</div> 
	<!-- 페이지네이션 끝 -->
</body>
</html>