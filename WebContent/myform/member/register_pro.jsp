<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member"  class="member.MemberBean"/>
<jsp:setProperty name="member" property="*"/>  

<% 
	
	System.out.println(member.getH_num());
	System.out.println(member.getH_id());
	System.out.println(member.getH_name());
	System.out.println(member.getH_password());
	System.out.println(member.getH_password_check());
	System.out.println(member.getH_email());
	
	int cnt =-1;
	MemberDao dao = MemberDao.getInstance();
	cnt = dao.insertMember(member);   
	
	String msg="", url="";
	
	if(cnt==1){
		msg="가입성공";
				
	}else{
		msg="가입실패";
		
	}
	
	url = request.getContextPath()+"/home_body.jsp";
	
%>

	<script type="text/javascript">
		alert("<%=msg%>"+"했습니다");	
		location.href="<%=url%>";
	</script>







