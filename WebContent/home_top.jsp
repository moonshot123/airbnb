<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath();
	System.out.println("contextPath:"+contextPath);
	String h_id = request.getParameter("id");
	
	String id = (String)session.getAttribute("h_id") ;   
	System.out.println("id:"+id);   
%> 
     

<html>
<head>
<link href="./css/bootstrap.min.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 <script src="./js/bootstrap.min.js"></script>
 
</head>
<body>  
	<div class="container"> 
 <!-- 시작 --> 
    <div class="row" id="navi"> 
	  <div class="col-md-2"> <a href="<%=contextPath%>/home_body.jsp"><img src="./img/Airbnb_Logo.jpg" height="50" ></a> </div>
      
      <div class="col-md-1"></div>
      <div class="col-md-1"></div>
      <div class="col-md-1"></div>
      <div class="col-md-1"></div>
      <div class="col-md-1"></div>
      <div class="col-md-1" id="navifont">
      
      <a href="<%=contextPath%>/myform/sukso/sukso_serch.jsp">
	  	<img src="./img/navi1.png" onmouseover="this.src='./img/navi6.png'" onmouseout="this.src='./img/navi1.png'">	
	  </a>
      
      </div>
      <div class="col-md-1" id="navifont"><a href="<%=contextPath%>/myform/member/register.jsp">
      <img src="./img/navi2.png" onmouseover="this.src='./img/navi7.png'" onmouseout="this.src='./img/navi2.png'"></a>
      </div>
      <div class="col-md-1" id="navifont">
      		
      <%
      if(id == null){
    	%>
        	<a href="<%=contextPath%>/myform/member/login.jsp">
        	<img src="./img/navi12.png" onmouseover="this.src='./img/navi11.png'" onmouseout="this.src='./img/navi12.png'">
      		</a>
        <%  
      }else{
    	%>
      		<a href="logout.jsp" >
      		<img src="./img/navi3.png" onmouseover="this.src='./img/navi8.png'" onmouseout="this.src='./img/navi3.png'">
      		</a>
      	<%  
      }
      %>
      </div>
      <div class="col-md-1" id="navifont"><a href="<%=contextPath%>/myform/member/showcomp.jsp">
      <img src="./img/navi4.png" onmouseover="this.src='./img/navi9.png'" onmouseout="this.src='./img/navi4.png'">
      </a></div>
      <div class="col-md-1" id="navifont">
      
      <%
      if(id == null){
    	%>
        	<a>
      		<img src="./img/binnavi.png">
      		</a></div>
        <%  
      }else{
    	%>
      		<a href="<%=contextPath%>/myform/member/myinfo.jsp">
      		<img src="./img/navi5.png" onmouseover="this.src='./img/navi10.png'" onmouseout="this.src='./img/navi5.png'">
      		</a></div>
      	<%  
      }
      %>
      
	</div>
	</div>
	
	<div class="row" id="top"> 
		<!-- <div class="col-md-2"></div> -->
		<div id=bg_pi class="col-md-12">
			<div id="carousel-example-generic" class="carousel slide">
       
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            </ol>
          
             <div class="carousel-inner" >
            
                <div class="item active">
                   <img src="./img/pi_01.jpg" alt="First slide"> 
                  <div class="carousel-caption">
                          <p id="mainp"><span id="mains">에어비앤비</span> 전 세계의 독특한 숙소를<br> 예약하고 살아보는 여행을 해 보세요.</p>
                  </div> 
                </div>
                <div class="item">
                   <img src="./img/pi_06.jpg" alt="Second slide">
                    <div class="carousel-caption">
                          <p id="mainp"><span id="mains">에어비앤비</span> 전 세계의 독특한 숙소를<br> 예약하고 살아보는 여행을 해 보세요.</p>
                  </div>    
                </div>
                <div class="item">
                   <img src="./img/pi_03.jpg" alt="Third slide">
                    <div class="carousel-caption">
                       <p id="mainp"> <span id="mains">에어비앤비</span> 전 세계의 독특한 숙소를<br> 예약하고 살아보는 여행을 해 보세요.</p>
                  </div>  
                </div>
                 <div class="item">
                   <img src="./img/pi_04.jpg" alt="Fourth slide">
                    <div class="carousel-caption">
                          <p id="mainp"><span id="mains">에어비앤비</span> 전 세계의 독특한 숙소를<br> 예약하고 살아보는 여행을 해 보세요.</p>
                  </div> 
                </div>
             </div>
            <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> 
                <span class="icon-prev"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="icon-next"></span>
              </a>
          </div>
  	</div>
 	
    <script>
    $('.carousel').carousel({
		 interval: 3000
	  });  
      
   </script>
		
		</div>
 <hr>
  