<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	
	let page_no = 1;
	let place_no = ${place_no};
	$.ajax({
		type:'post',
		url:'../ask/ask_page.do',
		data:{"page_no":page_no,"place_no":place_no},
		success:function(result){
			$('#ask_data_div').html(result);
		}
	})
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
	var myArray = [
			<c:forEach var="qvo" items="${qList}" >
			            {member_id: "${qvo.member_id}",
			            content:"${qvo.content}",
			            place_no: "${qvo.place_no}"},
			</c:forEach>
			        ];
	$('.page-no').click(function(e){
		/* $("html, body").animate({scrollTop: 2633.140625}, 400);  */
		
		page_no = parseInt(e.target.innerText.trim());
		place_no = ${place_no};
		$.ajax({
			type:'post',
			url:'../ask/ask_page.do',
			data:{"page_no":page_no,"place_no":place_no},
			success:function(result){
				$('#ask_data_div').html(result);
			}
		})
	})
});
</script>
<style type="text/css">
#askBtn{
	border: none;
    background: none;
    text-align: left;
    color: #2964D9;
}
#askContent{
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
</style>
</head>
<body>
	<div class="col-lg-8">
		<h2 class="heading text-primary"style="padding-top: 30px; padding-bottom: 10px;" id="ask">Q&A&nbsp;&nbsp;<span><h3 class="count">${total_userQ }</h3></span></h2>
	    <!-- <p class="meta">California, United States</p> -->
	    <c:if test="${total_userQ==0 }">
	    	<div class="text-center">
	    		<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
	    		<p class="de-text-desc">등록된 문의가 없습니다.</p>
	    	</div>
	    </c:if>
	    <c:if test="${total_userQ!=0 }">
	    <div id="ask_data_div">
		    
		</div>
			<div class="row align-items-center py-5">
			<div class="col-lg-12 text-center">
			<!-- 페이지네이션 시작 --> 
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
     				<a ${style } class="page-no" value="${i }">${i }</a>
      			</c:forEach>
       				<c:if test="${endPage<totalPage }">
       					<a href="../place/detail.do?no=${place_no }&page=${endPage+1 }">&raquo;</a>
      				</c:if>
				</div>
			<!-- 페이지네이션 끝 -->
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
					<textarea id="askContent" rows=5 cols=50 name="askContent"></textarea>
					<br>
					<button type="submit" class="btn btn-primary text-white" style="width: 15%; font-size:10px;">문의하기</button>
				</form>
			</c:if>	
			</div>
		</div>
	</div>
</body>
</html>