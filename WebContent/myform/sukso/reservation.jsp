<%@page import="sukso.Reservation_SuksoBean"%>
<%@page import="sukso.Reservation_SuksoDao"%>
<%@page import="member.MemberDao"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%
	String checkin_date = request.getParameter("checkin_date"); // 이렇게 해도 되는건지 모르겠음????? 
	String checkout_date = request.getParameter("checkout_date");
	String s_id = request.getParameter("s_id"); 
	
	String id = (String)session.getAttribute("h_id") ;   
	System.out.println("id:"+id);   
	
	Reservation_SuksoDao r_dao = Reservation_SuksoDao.getInstance();
	int cnt =r_dao.addReservation(id,s_id,checkin_date,checkout_date);    
	
	
	
	if(cnt > 0){
%>
	<script type="text/javascript">
		alert("예약을 성공하였습니다.");
		location.href="../../home_body.jsp";
	</script>
<%		
	
}else{
	
	%>
	<script type="text/javascript">
		alert("예약실패입니다");
		location.href="./sukso_detail.jsp";
	</script>
<%		
}
%>
    
    
    
    
    