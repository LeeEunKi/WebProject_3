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
	$('#selectTime').change(function(){
		let timeno = $(this).val().trim();
		$('#r_time').val(timeno);//input데이터삽입
	})
	$('#selectDuration').change(function(){
		let du = $(this).val().trim();
		$('#r_duration').val(du);//input데이터삽입
		console.log(du);
		let place_no = $('#place_no').val();
		$('#r_pno').val(place_no);//input데이터삽입
		$.ajax({
			type:'post',
			url:'../reserve/select_option.do',
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
	<label class="sche">시작시간</label>
	<select id="selectTime" name="user_job">
		<optgroup>
		  <c:forEach var="time" items="${times }" varStatus="s">
		  	 <option class="times" value="${s.index+1 }">${time }~</option>
		  </c:forEach>
		</optgroup> 
	</select>
	<br>
	<label class="sche">대여시간</label>
	<select id="selectDuration">
		<optgroup>
		  <c:forEach var="i" begin="1" end="10" step="1">
		  	 <option class="durations" value="${i }">${i}시간</option>
		  </c:forEach>
		</optgroup> 
	</select>
</body>
</html>