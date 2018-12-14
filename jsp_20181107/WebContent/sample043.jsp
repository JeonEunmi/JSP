<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>

</head>
<body>

	<div class="container">

		<h1>Google Map Test</h1>
		<!-- Add Google Maps -->
		<div id="googleMap" style="height: 500px; width: 100%;"></div>
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(37.499314, 127.033218);
				var mapProp = {
					center : myCenter,
					zoom : 17,
					/* scrollwheel : false,
					draggable : false, */
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document
						.getElementById("googleMap"), mapProp);
				var marker = new google.maps.Marker({
					position : myCenter
				});
				marker.setMap(map);
				var infowindow = new google.maps.InfoWindow(
						{
							content : "한독약품빌딩 8층 쌍용교육센터<br><img src=\"resources/img/handok_small.png\">"
						});
				google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});

			}
		</script>
		<!-- 
		주의) 구글맵 실행시 실행 주소 확인할 것.
		http://211.63.89.68:8090/webbasic/googleMap.html -> O
		http://localhost:8090/webbasic/googleMap.html -> X
		 -->
		<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>



	</div>
</body>
</html>