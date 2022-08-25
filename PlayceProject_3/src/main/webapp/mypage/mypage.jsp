<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
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
.active_a{
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
					<h2 class="font-weight-bold heading text-primary mb-4">마이 페이지</h2>
					<hr>
				</div>
			</div>

		</div>
</div>

<div class="section pt-0">
	<div class="container">
		<div class="row justify-content-between mb-5">
				<div class="col-lg-3 side" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">예약 내역</h3>
            			<a href="../mypage/reserve_list.do" class="${page=='reservelist1'?'active_a':'item' }"><i class="angle right icon"></i>
              				진행중 </a>
			            <a href="../mypage/reserve_list_checked.do" class="${page=='reservelist2'?'active_a':'item' }"><i class="angle right icon"></i>
			                완료 </a>
			            <!-- <a class="item"><i class="angle right icon"></i>
			                취소/환불 </a>-->
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">My 활동</h3>
            			<a href="../mypage/ask_list.do" class="${page=='asklist'?'active_a':'item' }"><i class="angle right icon"></i>
              				문의 내역 </a>
			            <a href="../mypage/like_list.do" class="${page=='likelist'?'active_a':'item' }"><i class="angle right icon"></i>
			                찜 목록 </a>
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 35px">
         			   <h3 class="subject">회원 정보</h3>
            			<a href="../member/join_update_ok.do" class="${page=='update'?'active_a':'item' }"><i class="angle right icon"></i>
              				개인정보 수정 </a>
			            <a href="../member/join_delete_ok.do" class="${page=='delete'?'active_a':'item' }"><i class="angle right icon"></i>
			                회원탈퇴 </a>
          			</div>
			    </div>
		     	<div class="col-lg-9">
				   <jsp:include page="${mypage_jsp}"></jsp:include>
			    </div>
		 </div>
		</div>
	</div>
</body>
</html>