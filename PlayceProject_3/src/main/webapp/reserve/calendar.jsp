<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top:50px;
}
.row{
	margin: 0px auto;
	width: 300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/calendar_select.do',
		success:function(result){
			$('#print_cal').html(result);
		}
	})
	$('#prevMonth').click(function(){
		let year=$('#year').text();
		year = parseInt(year.trim());
		let month=$('#month').text();
		month = parseInt(month.trim());
		if(month-1===0){
			$('#year').text(year-1);
			$('#month').text(12);
		}else{
			$('#year').text(year);
			$('#month').text(month-1);
		}
		$.ajax({
			type:'post',
			url:'../reserve/calendar_select.do',
			data:{"year":year,"month":month-1},
			success:function(result){
				$('#print_cal').html(result);
			}
		})
	})
	$('#nextMonth').click(function(){
		let year=$('#year').text();
		year = parseInt(year.trim());
		let month=$('#month').text();
		month = parseInt(month.trim());
		if(month+1===13){
			$('#year').text(year+1);
			$('#month').text(1);
		}else{
			$('#year').text(year);
			$('#month').text(month+1);
		}
		$.ajax({
			type:'post',
			url:'../reserve/calendar_select.do',
			data:{"year":year,"month":month+1},
			success:function(result){
				$('#print_cal').html(result);
			}
		})
	})
})
</script>
</head>
<body>
 <div class="container">
    <%-- <h1 class="text-center">${year }년 ${month }월 ${day }일</h1> --%>
    <label class="sche">스케줄</label>
    <div class="row">
      <table class="table">
        <tr>
          <td>
          	<a id="prevMonth">&lt;</a><span id="year">${year }</span>.<span id="month">${month }</span><a id="nextMonth">&gt;</a>
          </td>
        </tr>
      </table>
      <div style="height:15px"></div>
      <div id="print_cal"></div>
    </div>
  </div>
</body>
</html>