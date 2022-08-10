<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
let i=0;
$(function(){
	$('#askBtn').click(function(){
		if(i==0){
			$('#askForm').show("slow");
			$('#askBtn').text("취소");
			i=1;
		}else{
			$('#askForm').hide();
			$('#askBtn').text("문의 남기기");
			i=0;
		}
	})
	$('')
});
</script>
<style type="text/css">
#askBtn{
	border: none;
    background: none;
    text-align: left;
    color: #2964D9;
}
</style>
</head>
<body>
	<div class="col-lg-8">
		<h2 class="heading text-primary"style="padding-top: 30px; padding-bottom: 10px;" id="ask">Q&A&nbsp;&nbsp;<span><h3 class="count">${totalQ }</h3></span></h2>
	    <!-- <p class="meta">California, United States</p> -->
	    <c:if test="${totalQ==0 }">
	    	<div class="text-center">
	    		<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
	    		<p class="de-text-desc">등록된 문의가 없습니다.</p>
	    	</div>
	    </c:if>
	    <c:if test="${totalQ!=0 }">
		    <c:forEach var="qvo" items="${qList }">
				<div style="margin-top:10px;">
			   		<p class="de-qna-name" style="font-weight:bold;">${qvo.member_id }님</p><p class="de-text-date"> ${qvo.dbday }</p>
			   		<p class="de-text-desc">${qvo.content }</p>
				</div>
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			</c:forEach>
			<div class="row align-items-center py-5">
			<div class="col-lg-12 text-center">
				<div class="custom-pagination">
				 <c:if test="${startPage>1 }">
         				<a href="../place/detail.do?no=${place_no }&page=${startPage-1 }">&laquo;</a>
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
     				<a ${style } href="../place/place_list.do?tno=${tno}&page=${i }" >${i }</a>
      			</c:forEach>
       				<c:if test="${endPage<totalPage }">
       					<a href="../place/place_list.do?tno=${tno }&page=${endPage+1 }">&raquo;</a>
      				</c:if>
				</div>
			</div>
		</div>
		</c:if>
		<div id="askArea" style="">
			<button type="button" id="askBtn" style="width: 15%; font-size:10px;">문의 남기기</button>
			<div id="askForm" style="display:none;">
			<c:if test="${sessionScope.id==null }">
				<p class="de-text-desc text-center">로그인 후 이용해 주세요!</p>
			</c:if>
			<c:if test="${sessionScope.id!=null }"> 
				<form method="post" action="../ask/ask_insert.do">
					<input type="hidden" name=member_id value="${sessionScope.id }"/>
					<input type="hidden" name=place_no value="${place_no }"/>
					<textarea rows=5 cols=50 name="askContent"></textarea>
					<button type="submit" class="btn btn-primary text-white" style="width: 15%; font-size:10px;">문의하기</button>
				</form>
			</c:if>	
			</div>
		</div>
	</div>
</body>
</html>