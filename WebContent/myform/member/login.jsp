<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/script2.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<%@ include file="logo_top.jsp"%>

<hr>
<div class="container">
	
	<h3 class="text-primary">로그인 페이지 입니다.</h3><br><br>
		
		<form action="login_pro.jsp" >
			
			<div class="form-group">
				<label for="id" class="col-xs-2 col-lg-2 control-label">아이디</label>
				<div class="col-xs-10 col-lg-10">
					<input type="text" name="h_id" class="form-control" placeholder="아이디"><br>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="password" class="col-xs-2 col-lg-2 control-label">비밀번호</label>
				<div class="col-xs-10 col-lg-10">
					<input type="password" name="h_password" class="form-control" placeholder="비밀번호">
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10 col-lg-offset-2 col-lg-10 ">
					<input type="submit" value="로그인 확인" > &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset"  value="로그인 취소">
				</div>
			</div>
			
		</form>
</div>
