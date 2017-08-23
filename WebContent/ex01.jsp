<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<div class="container">
   <caption>
      <h4>
         <b>찾아오시는 길</b>
      </h4>
      <ol class="breadcrumb pull-right">
         <li><a href="#">회사소개</a></li>
         <li class="active">찾아오시는 길</li>
      </ol>
   </caption>
   <div id="overlay" class="map">
      <iframe id="map"
         src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6344.714236439214!2d126.72302319011727!3d37.33405324590862!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzfCsDIwJzAyLjUiTiAxMjbCsDQzJzU2LjYiRQ!5e0!3m2!1sen!2s!4v1484117294059"
         width="100%" height="600" frameborder="0"></iframe>
   </div>
   
   
   
   <div class="container">
    <div class="row">
        <div class="col-md-6">
         <h4 class="section-title">주소</h4>
            경기도 시흥시 정왕동 경기과기대로 219<br>
               길산SST 지식산업센터 209호 <strong>주식회사 Refresh shop</strong>
         <h4 class="section-title">연락처</h4>
            <strong>Tel :</strong> 1577-7862 <br>
            <strong>Fax :</strong> 031) 508-6302 <br>
            <strong>E-mail :</strong> <a href="mailto:qpu20@naver.com">qpu20@naver.com</a>
            <h4 class="section-title">근무시간</h4>
         <strong>월~금 :</strong> 09시 ~ 18시
      </div>
      
      <div class="col-md-6">
         <h4 class="section-title">주변정류장</h4>
         <ul class="list-unstyled three_cols">
            <li>KT</li>
            <li>우체국</li>
            <li>소방서</li>
            <li>GS주유소</li>
            <li>현대CNS</li>
            <li>(주)서진하이테크</li>
            <li>(주)서울에프에이</li>
            </ul>
         <h4 class="section-title">시내버스노선</h4>
         <ul class="list-unstyled three_cols">
            <li>20-1번</li>
            <li>21번</li>
            <li>26번</li>
            <li>350번</li>
                 <li>510번</li>
            </ul>
            <h4 class="section-title">지하철노선</h4>
            4호선 정왕역
      </div>    
    </div>
</div> <!-- container -->

   --%>
   
   
   <!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
</head> 
<body>
  <div id="map" style="width: 1000px; height: 800px;"></div>
  <script type="text/javascript">
    var locations = [
      ['삼익사이버 아파트', 37.0211403, 127.0971617, 28],
      ['국립축산과학원 축산자원개발부', 36.93309333, 127.10487485, 10]
    ];
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(37, 127.1),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var infowindow = new google.maps.InfoWindow();
    var marker, i;
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
</body>
</html>
   
   