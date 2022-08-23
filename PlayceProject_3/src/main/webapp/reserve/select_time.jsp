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
	$('#selectTime').click(function(){
		let timeno = $(this).val().trim();
		console.log(timeno);
		$('#r_time').val(timeno);//input데이터삽입
		$.ajax({
			type:'post',
			url:'../reserve/select_duration.do',
			data:{"timeno":timeno},
			success:function(result){
				$('#print_duration').html(result);
			}
		})
	})
})
</script>
</head>
<body>
<label class="sche">시작시간/대여시간 선택</label>
	<h3>시작시간</h3>
	<select id="selectTime" name="user_job">
		<optgroup>
		  <c:forEach var="time" items="${times }" varStatus="s">
		  	 <option class="times" value="${s.index+1 }">${time }~</option>
		  </c:forEach>
		</optgroup> 
	</select>
</body>
</html>