<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .container{
    margin-top:50px;
  }
  .row{
    margin: 0px auto;
  }
</style>
</head>
<body>
<h2 class="sectiontitle">답변</h2>
<div class="container">
	<div class="row">
		<div class="item">
		<div class="testimonial">
			<h3 class="h5 text-primary">no:${ask_no } | ${askVO.member_id }님의 문의사항</h3>
			<img src="${askVO.place_img }" alt="Image" class="img-fluid w-25 mb-4">
			<p class="text-black-50">문의 장소 | ${askVO.place_name }</p>
			<p class="text-black-50">문의 날짜 | ${askVO.dbday }</p>
			<p class="text-black-50" style="white-space:pre-wrap; background-color:white; border:none; font-family:''">${askVO.content }</p>

		</div>
		</div>
		<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	</div>
</div>
  <div class="container">
    <div class="row">
      <div class="text-right">
      </div>
    </div>
    <div style="height:20px"></div>
    <div class="row">
      <form method="post" action="../adminpage/askReply_insert_ok.do">
      <table class="table">
        <tr>
          <th width="15%" class="text-right">이름</th>
          <td width="85%">
            <input type=text name="name" size="15" class="input-sm" value="${sessionScope.name }">
            <input type=hidden name="ask_no" value="${ask_no}"> <%-- ask_no 숨기기 --%>
            <input type=hidden name="pno" value="${askVO.place_no}"> <%-- place_no 숨기기 --%>
            <input type=hidden name="member_id" value="${sessionScope.id }"> <%-- member_id 숨기기 --%>
          </td>
        </tr>
        <tr>
          <th width="15%" class="text-right">답변 내용</th>
          <td width="85%">
            <textarea rows="10" cols="60" name="replyContent" required></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
          	<button type="submit" class="btn btn-primary text-white" style="width: 20%;">답변 등록</button>
            <input type="button" value="취소" class="btn btn-sm btn-warning" style="width: 20%;" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>