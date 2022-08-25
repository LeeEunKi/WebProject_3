<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	
	let page_no = 1;
	let place_no = ${place_no};
	$.ajax({
		type:'post',
		url:'../review/review_page.do',
		data:{"page_no":page_no,"place_no":place_no},
		success:function(result){
			$('#review_data').html(result);
		}
	})
	$('.page-no').click(function(e){
		page_no = parseInt(e.target.innerText.trim());
		place_no = ${place_no};
		$.ajax({
			type:'post',
			url:'../review/review_page.do',
			data:{"page_no":page_no,"place_no":place_no},
			success:function(result){
				$('#review_data').html(result);
			}
		})
	})
})
</script>
</head>
<body>		
		  <div class="col-lg-8">
			   
				    <h2 class="heading text-primary" style="padding-top: 30px; display: inline-block;" id="review">장소 리뷰&nbsp;&nbsp;</h2>
				    <h2 class="count" style="padding-top: 30px;">${rtotal }</h2>
				    <h2 class="star" style="color: orange; display: inline-block; padding-left: 25px; position: relative; top: -2px;">★</h2>
				    <c:if test="${avg!=null }">
				      <h3 class="avg" style="padding-left: 5px; display: inline-block; position: relative; top: -3px;">${avg }</h3>
				    </c:if>
				    <c:if test="${avg==null }">
				      <h3 class="avg" style="padding-top: 30px;padding-left: 5px; display: inline-block; position: relative; top: -3px;">0</h3>
				    </c:if>
				    <c:if test="${totalR==0 }">
				    	<div class="text-center">
				    		<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
				    		<p class="de-text-desc">등록된 리뷰가 없습니다.</p>
				    	</div>
				    </c:if>
					 <!-- <c:if test="${sessionScope.id!=null}">
					      <form method="post" action="../review/review_insert.do" style="margin-top: 30px; float: right;">
						      <input type="hidden" name=member_id value="${sessionScope.id }"/>
							  <input type="hidden" name=place_no value="${place_no }"/>
							  <p><input type="submit" class="btn btn-primary text-white py-2 px-3" value="리뷰 남기기"/></p>
						  </form>
					   </c:if> -->
				

				    <!-- <p class="meta">California, United States</p> -->
				   <!--  <div class="row-cols-md-auto"> 
					   <a href="#"><img src="../images/img_1.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_2.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="../images/img_3.jpg" class="img-de-thumbnail"></a>
					</div>   -->
					 <c:if test="${totalR!=0 }">
					<div id="review_data">
		    
					</div>
					
						    <!-- 페이지네이션 시작 --> 
						<div class="custom-pagination text-center">
						 <c:if test="${startPageR>1 }">
		         				<a href="../place/detail.do?place_no=${place_no }&page_no=${startPageR-1 }">&laquo;</a>
		       			 </c:if>
						<c:forEach var="i" begin="${startPageR }" end="${endPageR }">
							<c:choose>
						     <c:when test="${i==curPageR }">
						       <c:set var="style" value="class=active"/>
						     </c:when>
						     <c:otherwise>
						       <c:set var="style" value=""/>
						     </c:otherwise>
						    </c:choose>
		     				<a ${style } class="page-no" value="${i }">${i }</a>
		      			</c:forEach>
		       				<c:if test="${endPageR<totalPageR }">
		       					<a href="../place/detail.do?place_no=${place_no }&page_no=${endPageR+1 }">&raquo;</a>
		      				</c:if>
						</div>
					<!-- 페이지네이션 끝 -->
					</c:if>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			    </div>
			    
</body>