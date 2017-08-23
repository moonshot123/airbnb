<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.Vector"%>
<%@page import="sukso.PostBean"%>
<%@page import="sukso.PostDao"%>
<%@page import="sukso.SuksoBean"%>
<%@page import="sukso.SuksoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../style.css" rel="stylesheet">
<script type="text/javascript" src="./../../script2.js"></script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo-qTAYy9OGp0DDt841veYvJ5Ga5ntyR0&callback=initMap">
    </script>
<%@ include file="logo_top.jsp" %>
<% 
	String s_id = request.getParameter("s_id");
	System.out.println("s_id 확인:"+s_id);
	
	SuksoDao dao = SuksoDao.getInstance();
	SuksoBean sukso = dao.getSukso(s_id);  
	/* 
	System.out.println(sukso.getS_id());
	System.out.println(sukso.getS_images());
	System.out.println(sukso.getS_name());
	System.out.println(sukso.getS_num());
	System.out.println(sukso.getS_place());
	*/
	
	PostDao p_dao = PostDao.getInstance();
	Vector<PostBean> post = p_dao.selectPostBySukso(s_id);
	
	Date today = new Date (); 
	
	String h_id = (String)session.getAttribute("h_id") ;   
	System.out.println("h_id:"+h_id);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
		
%>


<div class="col-md-2"></div>
<div class="col-md-8">
	<h3 class="text-primary">상세숙소정보</h3> <!-- 이거 생상은 로고색이랑 같게 하자 -->
	
	<div class="col-md-12" id="detail_p">
		<img src="./../../img_sukso/<%=sukso.getS_images()%>">
	</div>
	<hr>
	<div class="col-md-12">
		<h3 class="text-primary"><%=sukso.getS_name() %>님의 하우스</h3><br>
		<h4 class="text-muted">위치: 서울시 <%=sukso.getS_place()%> </h4>
		<h4 class="text-muted">1박당 가격: <%=sukso.getS_price()%> 원</h4>
		<h4 class="text-muted">평점: <%=sukso.getS_score()%> 점 </h4>
		<h4 class="text-muted">상세설명: <%=sukso.getS_story()%> </h4>
	
	<form action="reservation.jsp?s_id=<%=s_id %>" onsubmit="return ch_date()">
		
		<input type="hidden" name="h_id" id="h_id" value="<%=h_id%>">
		<input type="hidden" name="s_id" value="<%=sukso.getS_id()%>">
		
		<div class="col-md-12">
		
			<div class="col-md-3">
				<h4 class="text-primary">체크인</h4>
				<input  type="date" name=checkin_date>
			</div>
			
			
			<div class="col-md-3">
				<h4 class="text-primary">체크아웃</h4>
				<input  type="date" name=checkout_date>
				<br><br>
			</div>
			
		</div>	
			
			<br><br><br>
			  <button type="submit" class="btn btn-primary btn-lg btn-block" > 예약하기 </button>
	</form>
		<br><br>
	</div>
	
	
	<!-- =================================== -->
	<h4 class="text-primary">숙소위치를 확인하세요.</h4>
	<div id="map" ></div>
	
	<style>
       #map {
        height: 500px;
        width: 100%;
       }
    </style>
	
	<!-- =================================== -->
	
	<div class="col-md-12">
	<br><br><br>
		<div class= "col-md-1">	<h3 class="text-primary">후기</h3> </div>
		<div class= "col-md-10">
			
			<div class= "col-md-2">
			
			</div>
			
			<table class="table">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<% 
					
					if(post.size() < 1){
					%>	
					<tr>
						<td colspan=4> 처음으로 후기를 남겨보세요.</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%	
					}else{
					
						%>	
						<tr>
							<td>작성자</td>
							<td colspan="2">후기</td>
							<td></td>
							<td>작성일</td>
						</tr>
						<%	
					
					for(PostBean p : post){
					%>
					<tr>
						<td>
							<%
							if(p.getPh_id() != null){
								%>
								<%=p.getPh_id()%>
								<%
							}else{
								%>
								<span>익명</span>
								<% 
							}
						%>
						
						</td>
						<td colspan=2><%=p.getP_post() %></td>
						<td></td>
						<td>
						<%=p.getP_time().substring(0, 10)%>
						</td>
					</tr>
					<%
					}
					}
					%>
				</table>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#mypost"> 후기작성 </button>
				
			<br><br><br><br><br><br><br><br>
		</div>
		
	</div>
	
</div>




<form action="postpro.jsp" onsubmit="return post()">

<div class="modal fade" id="mypost" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">후기를 작성해주세요. </h4>
      </div>
     	
      <div class="modal-body">
      <input type="hidden" name="ps_id" value="<%=sukso.getS_id()%>"> 
      <input type="text" size="70" name="h_post">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >작성취소</button>
        <button type="submit" class="btn btn-primary" >후기저장</button>
      </div>
     
      
    </div> 
  </div> 
</div> 
</form>
