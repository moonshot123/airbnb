<%@page import="java.util.ArrayList"%>
<%@page import="sukso.SuksoBean"%>
<%@page import="java.util.Vector"%>
<%@page import="sukso.SuksoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>   

<%@ include file="home_top.jsp" %>

<br>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><h3>실시간 인기 숙소</h3></div>
	</div>
	
	<%	
	SuksoDao dao = SuksoDao.getInstance();
	Vector<SuksoBean> s_lists = dao.getAllSukso();
	//System.out.println("s_lists.size()2 : "+s_lists.size());
	
	for(int i=0; i<3 ;i++){
	%>	
		<div class="row" id="content1"> 
			
			<div class="col-md-3">
				<div class="col-md-12" id="list">
					<a href="./myform/sukso/sukso_detail.jsp?s_id=<%=s_lists.get((i*3)).getS_id()%>"> 
					<img src="./img_sukso/<%=s_lists.get((i*3)).getS_images()%>" style="opacity:1" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'">
					</a><br>
					숙소 지역 : <%=s_lists.get((i*3)).getS_place() %><br>
					1박 가격 : <%=s_lists.get((i*3)).getS_price() %><br>
					이용자 평점 : <%=s_lists.get((i*3)).getS_score() %>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<div class="col-md-12" id="list">
					<a href="./myform/sukso/sukso_detail.jsp?s_id=<%=s_lists.get((i*3)+1).getS_id()%>"> 
					<img src="./img_sukso/<%=s_lists.get((i*3)+1).getS_images()%>" style="opacity:1" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'">
					</a><br>
					숙소 지역 : <%=s_lists.get((i*3)+1).getS_place() %><br>
					1박 가격 : <%=s_lists.get((i*3)+1).getS_price() %><br>
					이용자 평점 : <%=s_lists.get((i*3)+1).getS_score() %>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<div class="col-md-12" id="list">
					<a href="./myform/sukso/sukso_detail.jsp?s_id=<%=s_lists.get((i*3)+2).getS_id()%>">
					<img src="./img_sukso/<%=s_lists.get((i*3)+2).getS_images()%>" style="opacity:1" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'">
					</a><br>
					숙소 지역 : <%=s_lists.get((i*3)+2).getS_place() %><br>
					1박 가격 : <%=s_lists.get((i*3)+2).getS_price() %><br>
					이용자 평점 : <%=s_lists.get((i*3)+2).getS_score() %>
				</div>
			</div>
		</div>
		<%
	}
%>
 	<br><br><br>
 	<hr>
 	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><h3>서울의 인기관광지</h3></div>
	</div>
 	
 	<div class="pl">
 		
 		<div class="col-md-6">
 		<div class="col-md-2"></div>
 			<a href="http://korean.visitseoul.net/attractions/%EA%B2%BD%EB%B3%B5%EA%B6%81_/72"><img src="./img/p1.PNG"></a>
 		</div>
 		<div class="col-md-6">
 			<div class="col-md-12">
 				<a href="http://korean.visitseoul.net/Tourist-Attractions-list1/N%EC%84%9C%EC%9A%B8%ED%83%80%EC%9B%8C_/36"><img src="./img/p2.PNG"></a>
 			
 				<a href="http://korean.visitseoul.net/Tourist-Attractions-list/%EC%84%9C%EC%9A%B8-%ED%95%9C%EC%96%91%EB%8F%84%EC%84%B1_/90"><img src="./img/p3.PNG"></a>
 			</div>
 			
 			<div class="col-md-12">
 				<a href="http://korean.visitseoul.net/Tourist-Attractions-list/DDP-%EB%8F%99%EB%8C%80%EB%AC%B8%EB%94%94%EC%9E%90%EC%9D%B8%ED%94%8C%EB%9D%BC%EC%9E%90_/95"><img src="./img/p4.PNG"></a>
 				
 				<a href="http://korean.visitseoul.net/tours/%EC%84%9C%EC%9A%B8%EC%9D%98-%EB%B0%A4%EC%9D%84-%EC%A6%90%EA%B8%B0%EC%9E%90-%ED%99%8D%EB%8C%80-%EC%9D%BC%EB%8C%80-%EA%B2%BD%EB%A6%AC%EB%8B%A8-%EA%B8%B8_/56"><img src="./img/p5.PNG"></a>
 			<br><br><br><br><br>
 			</div>
 		</div>
 	<hr>
 	</div>
 	
 
 <%@ include file="home_bottom.jsp" %>   