<%@page import="sukso.SuksoBean"%>
<%@page import="sukso.SuksoDao"%>
<%@page import="java.util.Vector"%>
<%@page import="sukso.Reservation_SuksoBean"%>
<%@page import="sukso.Reservation_SuksoDao"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../style.css" rel="stylesheet">

<%
	String contextPath = request.getContextPath();
	System.out.println("contextPath:"+contextPath);
	
	String id = (String)session.getAttribute("h_id") ;   
	System.out.println("id:"+id);   
	
	MemberDao dao = MemberDao.getInstance();
	MemberBean member = dao.getMemberById(id);
	
	Reservation_SuksoDao r_s_dao = Reservation_SuksoDao.getInstance();
	Vector<Reservation_SuksoBean> r_s_list = r_s_dao.getListById(id); 
	
	SuksoDao s_dao = SuksoDao.getInstance();
	Vector<SuksoBean> su_list =s_dao.getInfo(r_s_list);   
	int count=0;
%> 


<%@ include file="logo_top.jsp"%>

<hr>
<div class="container">
	
	<h3 class="text-primary"><%=member.getH_name() %> 님의 정보 페이지 입니다.</h3><br><br>
	
		<h4 class="text-muted">나의 기본정보</h4>
		<div class="col-xs-10 col-lg-10">
			<div class="">
			
				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tr>
						<td>아이디</td>
						<td><%=id %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=member.getH_name() %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=member.getH_email() %></td>
					</tr>
				</table>
			
			</div>
			
				<br><br>
		
		<h4 class="text-muted">숙소예약정보</h4>
		<div class="">
			<table class="table">
					<thead>
						<tr>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<% 
					
					if(r_s_list.size() < 1){
					%>	
					<tr>
						<td colspan=4> 아직 예약된 숙소가 없습니다.</td>
						<td></td><td></td><td></td><td></td>
					</tr>
					<%	
					}else{
					%>
					<tr>
					<td>예약번호</td>
					<td>예약숙소</td>
					<td>예약기간</td>
					<td></td>
					<td></td>
					</tr>
					<%
					for(Reservation_SuksoBean a : r_s_list){
					%>
					<tr>
						<td><%=a.getR_num() %></td>
						<td>
						<% 
						for(SuksoBean b : su_list){
						
							if(a.getRs_id().equals(b.getS_id())){
								%>
								<a href="../sukso/sukso_detail.jsp?s_id=<%=b.getS_id()%>"><img src="../../img_sukso/<%=b.getS_images()%>" width="100"></a>
								<%
								count = a.getR_num();
								break;
							}
							
						}
						
						
						%>
						</td>
						<td><%=a.getRs_date().substring(0, 10) %>부터 ~ <%= a.getRe_date().substring(0, 10) %>까지   
							<%-- 일단 이렇게 하면안됨 총기간:<%=Integer.parseInt(a.getRs_date()) - Integer.parseInt(a.getRe_date())%>  --%> 
						</td>
						<td>						
						</td>
						<td>
								
							<a href="./cancle.jsp?r_num=<%=count%>">예약취소</a>
							
						</td>
					</tr>
					<%
					}
					}
					%>
				</table>
		</div>
			
		</div>
			
</div>


