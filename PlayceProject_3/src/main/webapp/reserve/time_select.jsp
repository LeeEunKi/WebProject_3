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
$(function(){
 	$('.times').css("cursor","pointer");
	$('.times').click(function(){
		let time = $(this).text();
		//$(this).css("background-color":"red");
		let place_no = $('#place_no').val();
		place_no = parseInt(place_no.trim());
		console.log(place_no);
		$.ajax({
			type:'post',
			url:'../reserve/option_select.do',
			data:{"place_no":place_no},
			success:function(result){
				$('#print_option').html(result);
			}
		})
	})
})
</script>
</head>
<body>
	<c:forEach var="time" items="${times }" varStatus="s">
		<span class="btn btn-sm btn-warning times" time-data="${s.index+1 }">${time.time }&nbsp;</span>
	</c:forEach>
</body>
</html>