<%@page import="sukso.PostDao"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 
 	String ph_id = (String)session.getAttribute("h_id") ;   
	System.out.println("ph_id:"+ph_id);
 
	String ps_id =request.getParameter("ps_id");
 	System.out.println("ps_id:"+ps_id);
	
 	String h_post =request.getParameter("h_post"); 
 	System.out.println("h_post"+h_post);
 	
 	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy/MM/dd", Locale.KOREA );
 	Date currentTime = new Date ();
 	String mTime = mSimpleDateFormat.format ( currentTime );
 	System.out.println ( mTime );

 	
 	
	PostDao p_dao = PostDao.getInstance();
	int cnt = p_dao.insertpost(ph_id,ps_id,h_post,mTime);  
	 
	System.out.println ( cnt );

 	if(cnt < 0){
%>
 		
 		<script type="text/javascript">
 			alert("후기작성을 실패하였습니다.");
 			location.href="./sukso_detail.jsp?s_id=<%=ps_id%>";
 		</script>
 		<%	
 		   
 	}else{
 		%>
 		<script type="text/javascript">
 		alert("후기를 써주셔서 감사합니다.");
 		location.href="./sukso_detail.jsp?s_id=<%=ps_id%>";
 		</script>
 	<%		
	
	}	
 	
%>

 
 
 