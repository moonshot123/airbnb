<%@ page import="member.MemberBean"%>
<%@ page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String h_id = request.getParameter("h_id");
	String h_password = request.getParameter("h_password");
	String contextPath = request.getContextPath();
	
	System.out.println("h_id: "+h_id);
	System.out.println("h_password: "+h_password);
	
	MemberDao dao = MemberDao.getInstance();
	MemberBean member = dao.getMemberInfo(h_id,h_password);  
	
	
	System.out.println(member.getH_num());
	
	String viewPage = null;
	if(member.getH_num() != 0){
		int no = member.getH_num();
		String id = member.getH_id();
		
		
		session.setAttribute("h_num", no);
		session.setAttribute("h_id", h_id);
		
		viewPage = contextPath+"/home_body.jsp";
		
	
		%>
		<script type="text/javascript">
			alert("로그인을 성공하였습니다.");
			location.href="../../home_body.jsp";
		</script>
<%		
		
	}else{
		
		%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
			location.href="./login.jsp";
		</script>
<%		
	}
%>
	<script type="text/javascript">
	
	</script>

</body>
</html>


