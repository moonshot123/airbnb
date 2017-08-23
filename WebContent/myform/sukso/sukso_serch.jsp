<%@page import="sukso.SuksoBean"%>
<%@page import="java.util.Vector"%>
<%@page import="sukso.SuksoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="logo_top.jsp"%>    
<%@ include file="sukso_serch_top.jsp" %>

<%
	String [] checkb = request.getParameterValues("place");
	String min_price = request.getParameter("min_price");
	String max_price = request.getParameter("max_price");
	Vector<SuksoBean> p_lists = null;
	if(checkb != null){
		
		System.out.println(checkb);
		System.out.println(min_price);
		System.out.println(max_price);
		
		SuksoDao dao = SuksoDao.getInstance();
		Vector<SuksoBean> s_lists = dao.getAllSukso();
		System.out.println("serch_pro s_lists사이즈:" + s_lists.size());
		
		SuksoManager manager = SuksoManager.getInstance();
		p_lists = manager.selectsukso(s_lists,checkb,min_price,max_price);  
		
		
		System.out.println("serch_pro p_lists사이즈:"+p_lists.size());
		
		for(SuksoBean a:p_lists){
			System.out.println(a.getS_num());
		}
		
	}
  
if(checkb != null){
%>
<div class="col-md-7">
	 
	<div class="col-md-1"></div>
	<div class="col-md-11">
		<h3 class="text-muted">검색하신 조건에 맞는 숙소가 &nbsp;&nbsp;<span class="text-primary"><%=p_lists.size() %></span>개 있습니다. </h3>
<!-- 
		<button type="button" class="btn btn-primary btn-sm" onclick="price_list()">가격순으로 정렬</button> &nbsp;&nbsp;&nbsp;
	        <button type="button" class="btn btn-primary btn-sm" onclick="score_list()">평점순으로 정렬</button><br>
-->
	
	</div>
	
	<div class="col-md-12">
<%	
		for(SuksoBean su : p_lists){
			%>
			<div class="col-md-1"></div>
			<div class="col-md-5" id="list">
				<a href="./sukso_detail.jsp?s_id=<%=su.getS_id()%>"> 
						<img src="./../../img_sukso/<%=su.getS_images()%>" style="opacity:1" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'">
						</a><br>
						숙소 지역 : <%=su.getS_place() %><br>
						1박 가격 : <%=su.getS_price() %><br>
						이용자 평점 : <%=su.getS_score() %>			
			</div>
			<%
		}
%>

<%

	}
%>	
		
	</div>
</div>  
