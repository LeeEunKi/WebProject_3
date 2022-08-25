<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('.showReply').on("click",function () {
		let no=$(this).attr("data-no");
		
		if( $('.printReply-'+no).attr("onoff") ==0){
		
		    $('.printReply-'+no).show();
			$.ajax({
				type:'post',
				url:'../adminpage/askReply_insert.do',
				data:{"ask_no":no},
				success:function(result){
					$('.printReply-'+no).html(result);
				}
			})
			$('.printReply-'+no).attr("onoff","1");
		}
		else{
			$('.printReply-'+no).hide();
			$('.printReply-'+no).attr("onoff","0");
		}
	})
	
})
</script>
<style type="text/css">
a{
 color: black;
 font-size: 15px;
 } 
 
.bt_blue{
    background: #4d7be5;
    width: 100px;
    height: 40px;
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: bold;
    border: 1px solid #3e6dda;
    color: #fff;
    font-family: Dotum, "돋움";
    font-size: 14px;
}
.bt_s_gray{
    width: 100px;
    height: 40px; 
    font-size: 16px;
    font-weight: bold;
    background: #bdbdbd;
    border: 1px solid #b1b1b1;
    color: #fff;
    font-family: Dotum, "돋움";
    font-size: 14px;
}
</style>
</head>
<body>
 <h2 class="sectiontitle">문의 사항<span style="color:red; font-size: 20px;">&nbsp;(총 ${totalCount }건)</span></h2>
 <form method="post" action="../adminpage/askReply_insert_ok.do">
  <table class="table"> 
   <thead>
    <tr> 
      <th width="5%" class="text-center">번호</th>
      <th width="30%" class="text-center" colspan="2">문의장소</th>   
      <th width="30%" class="text-center">문의내용</th>
      <th width="10%" class="text-center">작성자</th>
      <th width="10%" class="text-center">작성일</th>
    </tr>
   </thead>
   <tbody>
    <c:forEach var="vo" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="5%" class="text-center">${vo.no }</td> <!-- 번호 -->
	      <td width="10%" class="text-center">
	       <a href="../place/detail.do?no=${vo.place_no }"><img src="${vo.place_img }" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="20%" class="text-center"><a href="../place/detail.do?no=${vo.place_no }">${vo.place_name }</a></td><!-- 문의 장소 -->
	      <td width="30%">
	        <a class="showReply" style="cursor: pointer; font-size: 14px;" data-no="${vo.no }">${vo.content }</a>
	      </td>   
	      <%-- <td width="30%"><a href="../adminpage/askReply_insert.do?ask_no=${askVO.no }">${askVO.content }</a></td><!-- 문의 내용 --> --%>
	      <td width="10%" class="text-center">${vo.member_id }</td><!-- 문의한 유저 아이디 -->
	      <td width="10%" class="text-center">${vo.dbday }</td><!-- 문의 날짜 -->
	    </tr>
   	    <tr class="printReply-${vo.no }" style="vertical-align:middle;" onoff="0">

		</tr>
    </c:forEach>
   </tbody> 
  </table>
 </form> 
  <!-- 페이지네이션 시작 -->
<div class="custom-pagination" style="text-align:center">
	<c:if test="${startPage>1 }">
 		<a href="../adminpage/askReply.do?page=${startPage-1 }">&laquo;</a>
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
  		<a ${style } href="../adminpage/askReply.do?page=${i}" value="${i }">${i }</a>
   	</c:forEach>
    	<c:if test="${endPage<totalPage }">
    		<a href="../adminpage/askReply.do?page=${endPage+1 }">&raquo;</a>
   		</c:if>
	</div>
	<!-- 페이지네이션 끝 -->
</body>
</html>