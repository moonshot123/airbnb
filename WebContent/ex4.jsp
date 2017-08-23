<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 500px;
        width: 50%;
       }
    </style>
  </head>
  <body>
    <h3>My Google Maps Demo</h3>
    <div id="map"></div>
    <script>
      function initMap() {
        var suk1 = {lat: 37.5500, lng: 126.980};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 37.5500, lng: 126.980}
        });
        var marker = new google.maps.Marker({
          position: suk1,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo-qTAYy9OGp0DDt841veYvJ5Ga5ntyR0&callback=initMap">
    </script>
  </body>
</html>