<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../style.css">
<script type="text/javascript" src="../../js/jquery.js"></script> 
<script type="text/javascript" src="../../script2.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<%@ include file="logo_top.jsp"%>

<hr>
<div class="container">
	
	<h3 class="text-primary">회원가입 페이지 입니다.</h3><br><br>
	
	<form action="register_pro.jsp" name="form" method="post" onsubmit="return check_reg()">
		<div class="form-group">
				<label class="col-xs-2 col-lg-2 control-label">이름</label>
				<div class="col-xs-10 col-lg-10">
					<input type="text" name="h_name" id="h_name" class="form-control" placeholder="이름을 입력하세요">
				</div>
			</div>
	
			<div class="form-group">
				<label class="col-xs-2 col-lg-2 control-label">아이디</label>
				<div class="col-xs-10 col-lg-10">
					<input type="text" name="h_id" id="h_id" class="form-control" placeholder="아이디를 입력하세요"><br>
					<input type="button" name="id_ch" id="id_ch" value="중복아이디 체크" onclick="return duplicate()">    
					<span id="idmessage" style="display:none;"></span>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="password" class="col-xs-2 col-lg-2 control-label">비밀번호</label>
				<div class="col-xs-10 col-lg-10">
					<input type="password" name="h_password" id="h_password" class="form-control" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
	
			
			<div class="form-group">
				<label for="password_ch" class="col-xs-2 col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-xs-10 col-lg-10">
					<input type="password" name="h_password_check" id="h_password_check" class="form-control" placeholder="한번더 비밀번호를 입력하세요" onkeyup="passwd_keyup()">
					<span id="pwmessage" style="display:none;"></span>
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="emailaddress" class="col-xs-2 col-lg-2 control-label">이메일</label>
				<div class="col-xs-10 col-lg-10">
					<input type="email" name="h_email" id="h_email" class="form-control" placeholder="이메일을 입력하세요" >
					 
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10 col-lg-offset-2 col-lg-10 ">
					<input type="submit" value="회원가입완료">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="회원가입 취소">
				</div>
			</div>
	</form> 
	
	
</div>



