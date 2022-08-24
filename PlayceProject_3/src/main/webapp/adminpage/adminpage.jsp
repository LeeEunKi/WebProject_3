<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.subject{
	position: relative;
    color: rgb(103, 114, 148);
    font-size: 18px;
    font-family: Medium, sans-serif;
    font-weight: bold;
    letter-spacing: -0.45px;
     margin-bottom: 15px; 
}
.side{
    width: 200px;
    border-right-style: inherit;
    border-right-width: thin;
    border-right-color: graytext;
}
.active{
   font-weight: bold;
   color: #2964D9;
}
</style>
</head>
<body>
<div class="hero" style="background-image: url('../images/topSkin.png'); height: 40vh; min-height: 0px;">
		<div class="container">
	    </div>
</div>
<div class="section" style="padding-bottom:0px">
		<div class="container">
			<div class="row text-left mb-5">
				<div class="col-12">
					<h2 class="font-weight-bold heading text-primary mb-4">관리자 페이지</h2>
					<hr>
				</div>
			</div>

		</div>
</div>

<div class="section pt-0">
	<div class="container"> 
		<div class="row justify-content-between mb-5">
				<div class="col-lg-3 side" style="border-right-style: solid;border-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">게시판 관리</h3>
            			<a href="../adminpage/askReply.do" class="${page=='asklist'?'active':'item' }"><i class="angle right icon"></i>
              				문의사항 관리 </a>
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">예약 관리</h3>
            			<a href="../adminpage/reserve.do?type=0" class="${page=='reserveWait'?'active':'item' }"><i class="angle right icon"></i>
              				예약 승인 대기 </a>
			            <a href="../adminpage/reserve.do?type=1" class="${page=='reserveOk'?'active':'item' }"><i class="angle right icon"></i>
			                예약 승인 완료 </a>
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">회원 정보</h3>
            			<a href="../admin/member_list.do" class="${page=='memberlist'?'active':'item' }"><i class="angle right icon"></i>
              				회원 관리 </a>
          			</div>
			    </div>
		     	<div class="col-lg-9">
				   <jsp:include page="${admin_jsp }"></jsp:include>
			    </div>			    
		 </div>
		</div>
	</div>
</body>
</html>