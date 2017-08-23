<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!-- 

배경영상을 넣고 싶으면 일단 mp4형태의 파일을 준비 해야됨 일반 유튜브파일을 웹페이지에서 자동으로 넣어주는건 안되는것 같다. 
어차피 무한루프로 돌리면 되기때문에 약 20~30 정도 의 짧은 영상을 구해서 넣어주도록 하자.

 -->
<!-- 
<div class="hide-sm"><div class="video-container video-background">
<div class="video-opacity video-foreground">
</div><video poster="./img/navi1.png" id="bgvid" playsinline autoplay muted loop>
<source src="./mp4/Wildlife.mp4" type="video/mp4"></video>
</div></div>
 -->
 
 <!-- 비디오로 만들기 -->
<video width="720" height="480" controls="controls" autoplay="autoplay" preload="">
	<source type="video/mp4" src="../mp4/Wildlife.mp4" >	
</video>


 <!-- iframe 으로 만들기 -->
<iframe width="100%" height="100%" src="https://www.youtube.com/embed/LaxJar8rksI?&autoplay=1" frameborder="0" allowfullscreen></iframe>




<!-- 
</div><div class="video-windows"><div class="page-container-responsive">
<div class="va-container va-container-v va-container-h"><div class="va-middle va-bottom-sm">
<div class="hero"><div class="hero-content-white"><div class="hero-content">
<div class="text-component slidein-module"><dl class="dl"><dt class="dt">
<h1>Go way beyond the guidebook with Airbnbmag</h1></dt>
<dd class="dd">Airbnbmag brings you human stories from around the globe, infused with local flavor. Get 6 issues delivered to your door for just $15.
</dd></dl></div><a class="slidein-module btn btn-host" href="subscribe.html">Subscribe
</a></div></div></div></div></div></div></div></div> 

-->



