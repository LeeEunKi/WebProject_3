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
				url:'../mypage/replyDetail.do',
				data:{"no":no},
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
</style>
</head>
<body>
  <div class="title">
    <h2>���� ���� ����</h2>
  </div> 
  <c:if test="${totalCount==0 }">
  	  <div class="text-center">
	 	<img src="https://shareit.kr/static/media/img-no-qna.0463e10d.png" style="width:30%;">
	 	<p class="de-text-desc">������ ������ �����ϴ�.</p>
	 </div>
  </c:if>
  <c:if test="${totalCount!=0 }">
  <table class="table"> 
    <tr> 
      <th width="25%" class="text-center" colspan="2">�������</th>
      <th width="30%" class="text-center">���ǳ���</th>
      <th width="15%" class="text-center">�ۼ���</th>
      <th width="10%" class="text-center">�亯����</th>
      <th width="10%" class="text-center"></th>
    </tr>
    <c:forEach var="askVO" items="${list }">
	    <tr style="vertical-align:middle">
	      <td width="10%" class="text-center">
	       <a href="../place/detail.do?no=${askVO.place_no }#ask"><img src="${askVO.place_img }" style="width: 100px;height: 100px;"></a>  
	      </td>	      
	      <td width="25%" class="text-center"><a href="../place/detail.do?no=${askVO.place_no }#ask">${askVO.place_name }</a></td><!-- ���� ��� -->	   
	      <td width="30%">${askVO.content }</td><!-- ���� ���� -->
	      <td width="15%" class="text-center">${askVO.dbday }</td><!-- ���� ��¥ -->
	      <c:if test="${askVO.isReply!=1 }">
	        <td width="10%" class="text-center" >�亯���</td>
	      </c:if>
    	  <c:if test="${askVO.isReply==1 }">
	        <td width="10%" class="text-center"><a class="showReply" style="cursor: pointer; color: #2964D9; font-size: 14px;" 
	          data-no="${askVO.no }">�亯�Ϸ�</a></td>
	      </c:if>
	      <td width="10%" class="text-center"><a href="../mypage/ask_delete.do?no=${askVO.no }" style="color:#2964D9; font-size: 14px;">����</a></td>
	    </tr>
	    <tr class="printReply-${askVO.no }" style="vertical-align:middle;" onoff="0">
	    </tr>
    </c:forEach>
  </table>
  <!-- ���������̼� ���� -->
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
	<!-- ���������̼� �� -->
  </c:if>	
</body>
</html>