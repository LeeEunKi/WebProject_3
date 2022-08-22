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
	$('#selectDuration').click(function(){
		let du = $(this).val().trim();
		$('#r_duration').val(du);//input데이터삽입
		console.log(du);
		let place_no = $('#place_no').val();
		$('#r_pno').val(place_no);//input데이터삽입
		$.ajax({
			type:'post',
			url:'../reserve/select_option.do',
			data:{"place_no":place_no, "duration":du},
			success:function(result){
				$('#print_option').html(result);
			}
		})
	})
})
</script>
</head>
<body>
	<h3>대여시간</h3>
	<select id="selectDuration">
		<optgroup>
		  <c:forEach var="i" begin="1" end="${durations }" step="1">
		  	 <option class="durations" value="${i }">${i}시간</option>
		  </c:forEach>
		</optgroup> 
	</select>
</body>
</html>