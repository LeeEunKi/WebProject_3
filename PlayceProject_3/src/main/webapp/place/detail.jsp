<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg'); height: 30vh;"></div>


	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-8">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide">
							<img src="images/img_1.jpg" alt="Image" class="img-fluid">
							<img src="images/img_2.jpg" alt="Image" class="img-fluid">
							<img src="images/img_3.jpg" alt="Image" class="img-fluid">
						</div>
					</div>
				</div>

					<div class="col-lg-4 d-block agent-box p-5">
						
						<div class="text">
							<h3 class="host" style="display: inline;">쌍용스튜디오</h3>


							<h2 class="heading text-primary" style="padding-top: 20px; font-weight: 600;">쌍용 파티룸</h2>
							<p class="meta" style="display: inline;">서울시 역삼동</p>&nbsp;&nbsp;<p class="meta" style="display: inline;color: crimson;">♥&nbsp;114</p>
							<div></div>
							<p class="de-price">90,000</p><p class="won">원 / 시간 당</p>
							<label class="sche">스케줄</label>
							<label class="meta">시작 날짜 ~ 종료 날짜</label>
							<input type="date" id="birthday" name="birthday">
							<label class="sche">총 인원</label>
          					<select id="select" name="user_job">
            					<optgroup>
             						<option value="1">1명</option>
              						<option value="2">2명</option>
              						<option value="3">3명</option>
             						<option value="4">4명</option>
             						<option value="5">5명</option>
             						<option value="6">6명</option>
            					</optgroup>
          					</select>
							<button type="submit" class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;">예약하기</button>
						</div>	
					</div>
			</div>
			


<!-- ##################################################################### -->
        <div class="section">
			<div class="container">
				<div class="row justify-content-between">
				<div class="col-lg-8"><!-- 간격 유지 -->
					<div class="content-area">
						<nav class="detail-nav">
							<ul class="nav-tabs-detail">
								<li id="desc"><a href="#" class="n-tab active">장소 소개</a></li>
								<li ><a href="#" class="n-tab">이용규칙</a></li>
								<li ><a href="#" class="n-tab">리뷰</a></li>
								<li class="detail-li"><a href="#" class="n-tab">문의</a></li>
								
							</ul>
						</nav>	
					</div>
			   </div>
			   <div class="col-lg-8">
				<h2 class="heading text-primary" style="padding-top: 30px;">장소 소개</h2>
				<p class="meta">California, United States</p>
				<p class="de-text-black-50">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ratione laborum quo quos omnis sed magnam id, ducimus saepe, debitis error earum, iste dicta odio est sint dolorem magni animi tenetur.</p>
				<p class="de-text-black-50">Perferendis eligendi reprehenderit, assumenda molestias nisi eius iste reiciendis porro tenetur in, repudiandae amet libero. Doloremque, reprehenderit cupiditate error laudantium qui, esse quam debitis, eum cumque perferendis, illum harum expedita.</p>
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			   </div>
			   <div class="col-lg-8">
				<h2 class="heading text-primary" style="padding-top: 30px;">위치</h2>
				<p class="meta">California, United States</p>
				<div id="map" style="width:590px;height:450px;"></div>
				<p class="text-black-50">자세한 주소는 호스트 승인 후, 메세지로 문의 가능합니다.</p>
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			   </div>
				<div class="col-lg-8">
				    <h2 class="heading text-primary"style="padding-top: 30px;">장소 리뷰&nbsp;&nbsp;<span><h3 class="count">3</h3></span></h2>
				    <p class="meta">California, United States</p>
				    
					   <a href="#"><img src="images/img_1.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="images/img_2.jpg" class="img-de-thumbnail"></a>
					   <a href="#"><img src="images/img_3.jpg" class="img-de-thumbnail"></a>

					<div>
				  	  	<p class="de-text-reviewer">comsist</p>
				   	  	<span class="score">★★★★★</span><p class="de-text-date"> 2022.08.04</p>
				  	 	 <p class="de-text-desc">Perferendis eligendi reprehenderit, assumenda molestias nisi eius iste reiciendis porro tenetur in, repudiandae amet libero. Doloremque, reprehenderit cupiditate error laudantium qui, esse quam debitis, eum cumque perferendis, illum harum expedita.</p>
					</div>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>

					<div>
				    	<p class="de-text-reviewer">comsist</p>
				   		<span class="score">★★★★★</span><p class="de-text-date"> 2022.08.04</p>
				   		<p class="de-text-desc">Perferendis eligendi reprehenderit, assumenda molestias nisi eius iste reiciendis porro tenetur in, repudiandae amet libero. Doloremque, reprehenderit cupiditate error laudantium qui, esse quam debitis, eum cumque perferendis, illum harum expedita.</p>
					</div>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
					<div>
				    	<p class="de-text-reviewer">comsist</p>
				   		<span class="score">★★★★★</span><p class="de-text-date"> 2022.08.04</p>
				   		<p class="de-text-desc">Perferendis eligendi reprehenderit, assumenda molestias nisi eius iste reiciendis porro tenetur in, repudiandae amet libero. Doloremque, reprehenderit cupiditate error laudantium qui, esse quam debitis, eum cumque perferendis, illum harum expedita.</p>
					</div>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			    </div>

				<div class="col-lg-8">
					<h2 class="heading text-primary"style="padding-top: 30px;">문의하기&nbsp;&nbsp;<span><h3 class="count">10</h3></span></h2>
				    <p class="meta">California, United States</p>

					<div>
				   		<p class="de-qna-name">comsist</p><p class="de-text-date"> 2022.08.04</p>
				   		<p class="de-text-desc">Perferendis eligendi reprehenderit, assumenda molestias nisi eius iste reiciendis porro tenetur in, repudiandae amet libero. Doloremque, reprehenderit cupiditate error laudantium qui, esse quam debitis, eum cumque perferendis, illum harum expedita????</p>
					</div>
					<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
				</div>
			   
			   </div>
			</div>
		 </div>
	  </div>
   </div>
    


<!-- home 끝 ##################################################################### -->

</body>
</html>