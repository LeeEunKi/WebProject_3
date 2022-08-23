<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
  background-color: #fff;
  overflow: hidden;
}

#confetti {
  position: relative;
  top:0;
  left: 0;
  z-index: 1;
}

#party-info {
  position: absolute;
  background: rgba(255,255,255,1);
  box-shadow: 10px 10px 10px rgba(255,255,255,0.8);
  padding: 20px;
  margin: 0 auto;
  height: 200px;
  margin-top: -100px;
  top: 50%;
  left: 0;
  right: 0;
  bottom:0;
  text-align: center;
  width: 400px;
  z-index: 2;
  color: gray;
}
</style>
<script type="text/javascript">
function Confetti() {
	  //canvas init
	  var canvas = document.getElementById("confetti");
	  var ctx = canvas.getContext("2d");

	  //canvas dimensions
	  var W = window.innerWidth;
	  var H = window.innerHeight;
	  canvas.width = W;
	  canvas.height = H;
	  
	  //particles
	  var mp = 150; //max particles
	  var types = ['circle', 'circle', 'triangle', 'triangle', 'line'];
	  var colors = [
	    [238, 96, 169],
	    [68, 213, 217],
	    [245, 187, 152],
	    [144, 148, 188],
	    [235, 234, 77]
	  ];
	  var angles = [
	    [4,0,4,4],
	    [2,2,0,4],
	    [0,4,2,2],
	    [0,4,4,4]
	  ]
	  var particles = [];
	  for (var i = 0; i < mp; i++) {
	    particles.push({
	      x: Math.random() * W, //x-coordinate
	      y: Math.random() * H, //y-coordinate
	      r: Math.random() * 4 + 1, //radius
	      d: Math.random() * mp, //density
	      l: Math.floor(Math.random()*65+-30), // line angle
	      a: angles[Math.floor(Math.random()*angles.length)], // triangle rotation
	      c: colors[Math.floor(Math.random()*colors.length)], // color
	      t: types[Math.floor(Math.random()*types.length)] //shape 
	    })
	  }
	  
	  function draw(){
	    ctx.clearRect(0, 0, W, H);
	    

	    for (var i = 0; i < mp; i++) {
	      var p = particles[i];
	      var op = (p.r <= 3) ? 0.4 : 0.8;
	      
	      if (p.t == 'circle'){
	        ctx.fillStyle = "rgba(" + p.c + ", "+ op +")";
	        ctx.beginPath();
	        ctx.moveTo(p.x, p.y);
	        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2, true);
	        ctx.fill();
	      } else if (p.t == 'triangle'){
	        ctx.fillStyle = "rgba(" + p.c + ", "+ op +")";
	        ctx.beginPath();
	        ctx.moveTo(p.x, p.y);
	        ctx.lineTo(p.x + (p.r*p.a[0]), p.y + (p.r*p.a[1]));
	        ctx.lineTo(p.x + (p.r*p.a[2]), p.y + (p.r*p.a[3]));
	        ctx.closePath();
	        ctx.fill(); 
	      } else if (p.t == 'line') {
	        ctx.strokeStyle = "rgba(" + p.c + "," + op +")";
	        ctx.beginPath();
	        ctx.moveTo(p.x, p.y);
	        ctx.lineTo(p.x + p.l, p.y + (p.r * 5));
	        ctx.lineWidth = 2;
	        ctx.stroke();
	      } 

	    }
	    update();
	  }



	  function update() {

	    for (var i = 0; i < mp; i++) {
	      var p = particles[i];
	      p.y += Math.cos(p.d) + 1 + p.r / 2;
	      p.x += Math.sin(0) * 2;
	      
	      if (p.x > W + 5 || p.x < -5 || p.y > H) {
	        particles[i] = {
	          x: Math.random() * W,
	          y: -10,
	          r: p.r,
	          d: p.d,
	          l: p.l,
	          a: p.a,
	          c: p.c,
	          t: p.t
	        };
	      }
	    }
	  }

	  //animation loop
	  setInterval(draw, 23);

	}

	window.onload = function(){
	  Confetti();
	}
</script>
</head>
<body>
<canvas id="confetti"></canvas>

<div id="party-info">

  <h2>예약 신청 완료</h2>
  <p>예약 신청이 완료되었습니다! <br>관리자가 확인 후 승인 예정입니다.</p>
  
  <a class="btn btn-primary text-white" style="width: 100%; margin-top: 50px;" href="../mypage/reserve_list.do" >예약 내역 보기</a>
</div>

</body>
</html>