<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDREDgOT7s0w6WUKa3ZQ397QIWh0NVK9_o&sensor=false&language=en"></script>
 <script>
  function initialize() {
   var myLatlng = new google.maps.LatLng(37.47898, 126.87891);
   var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   var marker = new google.maps.Marker({
       position: myLatlng,
       map: map,
       title: "ddd"
});
  }
 </script>

<body onload="initialize()">
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/center/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<img src="../images/center/left_title.gif" alt="센터소개 Center Introduction" class="left_title" />
				<%@ include file="../include/center_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/center/sub07_title.gif" alt="오시는길" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;센터소개&nbsp;>&nbsp;오시는길<p>
				</div>
				<div class="con_box">
					<p class="con_tit"><img src="../images/center/sub07_tit01.gif" alt="오시는길" /></p>
					 <div id="map_canvas"style="width:700px; height:400px;"></div>
					 <br/><br/><br/>
					<p class="con_tit"><img src="../images/center/sub07_tit02.gif" alt="자가용 오시는길" /></p>
					<div class="in_box">
						<p class="dot_tit">강북 방향</p>
						<p style="margin-bottom:15px;">강변북로 진입 후 월드컵 경기장 방면으로 우측방향 → 난지도길 가양대교 방향으로 좌회전 → 상암동길 상암초교 방면으로 우회전 </p>
						<p class="dot_tit">일산 방향</p>
						<p style="margin-bottom:15px;">강변북로 수색/가양대교 방향으로 우측방향, 강변북로 수색역/월드컵경기장 방면으로 좌측방향 → 월드컵 경기장 방면으로 우측방향 → 상암동길 상암초교 방면으로 좌회전  </p>
					</div>
					<p class="con_tit"><img src="../images/center/sub07_tit03.gif" alt="대중교통 이용시" /></p>
					<div class="in_box">
						<p class="dot_tit">버스</p>
						<p style="margin-bottom:15px;">172번, 271번, 470번, 6715번, 7011번, 7013번, 7016번, 7019번, 7715번 월드컵3단지 정문 앞 하차  </p>
						<p class="dot_tit">지하철</p>
						<p style="margin-bottom:15px;">2호선, 6호선 합정역 2번출구에서 271번 환승 후 월드컵파크 3단지 정문 앞 하차<br />6호선 마포구청역 1번출구에서 271번 환승 후 월드컵파크 3단지 정문 앞 하차 </p>
						<p class="dot_tit">마을버스</p>
						<p>마포8번, 마포15번</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
