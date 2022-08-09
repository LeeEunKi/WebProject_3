<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=063a056828484c8e1337656cc6cbc882&libraries=services"></script>
<script>
$(function(){
	var addr = $('#addr').text();
	console.log(addr);
	var host = $('.host').text();
	console.log(host);
	
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};
//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색
geocoder.addressSearch(addr, function(result, status) {

if (status === kakao.maps.services.Status.OK) {
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    // 결과값으로 받은 위치를 마커로 표시
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
    // 인포윈도우로 장소에 대한 설명을 표시
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;color:black;">'+host+'</div>'
    });
    infowindow.open(map, marker);
    // 지도의 중심을 결과값으로 받은 위치로 이동
    map.setCenter(coords);
}
})
});
</script>
<style type="text/css">
.descTable img{
	width:40px;
	height:40px;
	margin:0 auto;
}
.de-price{
	color:#132F66;
}
.descTable{
	width:100%;
	text-align:center;
	border-collapse: collapse;
}
.descTable p{
	margin: auto;
}
.descTable tr#descTitles{
	/* color: black; */
	font-size:14px;
	font-weight: bold;
	height: 40px;
}
.descTable td {
    border-left: 1px dotted rgb(231, 234, 238);
  }
.descTable td:first-child {
    border-left: none;
  }
#reserveDate, #selectCapa, #selectParking{
  background: rgba(255, 255, 255, 0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
  margin-bottom: 30px;
}
</style>
</head>
<body>
<div class="hero page-inner overlay" style="background-image: url(${pvo.rep_image}); height: 30vh;"></div>


	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-8">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide">
							<c:forEach var="i" items="${list }">
							<img src="${i.image }" alt="Image" class="img-fluid">
							</c:forEach>
						</div>
					</div>
				</div>

					<div class="col-lg-4 d-block agent-box p-5">
						
						<div class="text">
							<h3 class="host" style="display: inline;">${pvo.host_name }</h3>


							<h2 class="heading text-primary" style="padding-top: 20px; font-weight: 600;">${pvo.name }</h2>
							<p class="meta" id="addr" style="display: inline;">${pvo.address }</p>&nbsp;&nbsp;<p class="meta" style="display: inline;color: crimson;">♥&nbsp;114</p>
							<div></div>
								<c:choose>
								     <c:when test="${pvo.price==0 }">
								       <p class="de-price">별도 문의</p>
								     </c:when>
								     <c:otherwise>
								     	<p class="de-price">
								       <fmt:formatNumber type="number" maxFractionDigits="3" value="${pvo.price}" />원</p>
								     </c:otherwise>
								   </c:choose>
							<label class="sche">스케줄</label>
							<label class="meta">시작 날짜 ~ 종료 날짜</label>
							<input type="date" id="reserveDate" name="reserveDate">
							<!-- 날짜, 시간, 인원, 주차대수는 form으로 보내주고 reserve.do에서 받아서 미리 채워주고 시작하기 -->
							<!-- 달력은 아마 직접 만들어야 할 듯 -->
							<!-- <input type="time" id="reserveTime" name="reserveTime">-->
							<label class="sche">총 인원</label>
          					<select id="selectCapa" name="user_job">
            					<optgroup>
            					  <c:forEach var="i" begin="1" end="${pvo.capa }" step="1">
            					  	<c:if test="${i!=pvo.capa }">
            					  	 <option value="i">${i }명</option>
            					  	</c:if>
             						<c:if test="${i==pvo.capa }">
            					  	 <option value="i">${i }명(최대)</option>
            					  	</c:if>
             					  </c:forEach>
            					</optgroup> 
          					</select>
          					<c:if test="${pvo.parking!=0 }">
	          					<label class="sche">주차 대수</label>
	          					<select id="selectParking" name="user_job">
	            					<optgroup>
	            					  <c:forEach var="i" begin="1" end="${pvo.parking }" step="1">
	            					  	<c:if test="${i!=pvo.parking }">
	            					  	 <option value="i">${i }대</option>
	            					  	</c:if>
	             						<c:if test="${i==pvo.parking }">
	            					  	 <option value="i">${i }대(최대)</option>
	            					  	</c:if>
	             					  </c:forEach>
	            					</optgroup> 
	          					</select>
          					</c:if>
          					<c:if test="${pvo.parking==0 }">
          						<select style="display:none">
	            					<optgroup>
	            					  	 <option value="0">0대</option>
	            					</optgroup> 
	          					</select>
          					</c:if>
							<button type="submit" class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;">예약하기</button>
						</div>	
					</div>
			</div>
			

        <div class="section">
			<div class="container">
				<div class="row justify-content-between">
				<div class="col-lg-8"><!-- 간격 유지 -->
					<div class="content-area">
						<nav class="detail-nav">
							<ul class="nav-tabs-detail">
								<li ><a href="#desc" class="n-tab active">장소 소개</a></li>
								<li ><a href="#location" class="n-tab">위치</a></li>
								<li ><a href="#review" class="n-tab">리뷰</a></li>
								<li class="detail-li"><a href="#ask" class="n-tab">문의</a></li>
								
							</ul>
						</nav>	
					</div>
			   </div>
			   <div class="col-lg-8">
				<h2 class="heading text-primary" style="padding-top: 30px;" id="desc">장소 소개</h2>
				<%-- <p class="meta">${pvo.address }</p> --%>
				<p class="de-text-black-50" style="font-size:16px;" >${pvo.content }</p>
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
				<h2 class="heading text-primary" style="padding-top: 30px; padding-bottom:30px;" id="desc">장소 정보</h2>
				<div style="height:10px"></div> <!-- 여백띄우기용 -->
						<table class="descTable">
							<tr id="descImgs">
								<td style="width:20%">
									<img src="../place/images/area.png">
								</td>
								<td style="width:20%">
									<img src="../place/images/box.png">
								</td>
								<td style="width:20%">
									<img src="../place/images/capa.png">
								</td>
								<td style="width:20%">
									<c:if test="${pvo.parking==0 }">
										<img src="../place/images/noparking.png">
									</c:if>
									<c:if test="${pvo.parking!=0 }">
										<img src="../place/images/parking.png">
									</c:if>
								</td>
								<td style="width:20%">
									<img src="../place/images/nnb.png">
								</td>
							</tr>
							<tr id="descTitles">
								<td style="width:20%"><p >면적</p></td>
								<td style="width:20%"><p >가로/세로/천정고</p></td>
								<td style="width:20%"><p>최대수용인원</p></td>
								<td style="width:20%"><p>주차</p></td>
								<td style="width:20%"><p>냉난방</p></td>
							</tr>
							<tr id="descValues">
								<td style="width:20%"><p>${pvo.area }</p></td>
								<td style="width:20%"><p>${pvo.box }</p></td>
								<td style="width:20%"><p>${pvo.capa }명까지</p></td>
								<td style="width:20%">
									<c:if test="${pvo.parking==0 }">
										<c:set var="parking" value="불가"/>
									</c:if>
									<c:if test="${pvo.parking!=0 }">
										<c:set var="parking" value="${pvo.parking }대"/> 
									</c:if>
									<p>${parking}</p>
								</td>
								<td style="width:20%"><p>${pvo.nnb }</p></td>
							</tr>
							<tr style="height:30px"></tr>
							<tr><td colspan="5" style="text-align: left;">${pvo.etc }</td></tr>
						</table>
					</div>
						
					</div>
				</div>
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			   </div>
			   <div class="col-lg-8">
				<h2 class="heading text-primary" style="padding-top: 30px;" id="location">위치</h2>
				<p class="meta">${pvo.address }</p>
				<div id="map" style="width:100%;height:450px;"></div>
				<!-- <p class="text-black-50">자세한 주소는 호스트 승인 후, 메세지로 문의 가능합니다.</p> -->
				<div class="col-lg-8" style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			   </div>

				<jsp:include page="${review_jsp }"/>
				<!-- 관리자만 문의 답글달기 보이도록 세팅 -->
				<jsp:include page="${ask_jsp }"/>
			   </div>
			</div>
		 </div>
	  </div>
   </div>
    


<!-- home 끝 ##################################################################### -->

</body>
</html>