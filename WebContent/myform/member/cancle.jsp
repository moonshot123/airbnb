<%@page import="sukso.Reservation_SuksoBean"%>
<%@page import="sukso.Reservation_SuksoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int r_num =Integer.parseInt(request.getParameter("r_num"));
	System.out.println("r_num 넘어옴:"+r_num);
	
	Reservation_SuksoDao r_sdao = Reservation_SuksoDao.getInstance();
	int cnt = r_sdao.calcleRe(r_num); 
	
	if(cnt < 1){
	%>
	<script type="text/javascript">
		alert("예약 취소가 실패했습니다.");
		location.href="./myinfo.jsp";
	</script>
	<%		
	}else{
	%>
	<script type="text/javascript">
		alert("예약이 취소되었습니다.");
		location.href="./myinfo.jsp";
	</script>
	<%		
	}
	%>
