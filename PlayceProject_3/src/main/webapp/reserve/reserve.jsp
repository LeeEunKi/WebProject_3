<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  $( function() {
	  $('.date-pick').css("cursor","pointer");
		$('.date-pick').click(function(){
			let dateno = $(this).attr("data-no");
			//$(this).css("background-color":"red");
			let place_no = $('#place_no').val();
			place_no = parseInt(place_no.trim());
			let year = $('#year').text();
			let month = $('#month').text();
			let selectDate = year+"-"+month+"-"+dateno;
			console.log(selectDate);
			console.log(place_no);
			$.ajax({
				type:'post',
				url:'../reserve/select_time.do', 
				data:{"place_no":place_no, "selectDate":selectDate},
				success:function(result){
					$('#print_time').html(result);
				}
			})
		})
  } );
  </script>
</head>
<body>
  <h3>날짜 선택</h3>
  <div id="print_calendar"></div>
  <h3>시작시간/대여시간 선택</h3>
  <div id="print_time"></div>
  <h3>인원/주차 선택</h3>
  <div id="print_option"></div>
 <form method="post" action="../reserve/reserve_ok.do">
<input type=hidden name="place_no" id="r_pno">
<input type=hidden name="r_capa" id="r_capa">
<input type=hidden name="r_parking" id="r_parking">
<input type=hidden name="r_date" id="r_date">
<input type=hidden name="r_time" id="r_time">
<input type=hidden name="r_duration" id="r_duration">
</form> 
</body>
</html>