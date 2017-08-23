<%@page import="member.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%
	
	String h_id = request.getParameter("h_id"); // hong
	System.out.println("h_id:"+h_id);
	String str = "";
 	
		
	try {
		MemberDao dao = MemberDao.getInstance(); 
		boolean isCheck = dao.searchID(h_id);   
		System.out.println("isCheck:" + isCheck);
		
		if (isCheck) {
			str = "NO";
			out.print(str);
		} else {
			str = "YES";
			out.print(str);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>