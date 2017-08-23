<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
    

	<div id="map">
		<script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
		
	
	</div>

	<script async defer 
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo-qTAYy9OGp0DDt841veYvJ5Ga5ntyR0&callback=initMap">
    </script>


