<%@page import="sukso.SuksoBean"%>
<%@page import="sukso.SuksoDao"%>
<%@page import="java.util.Vector"%>
<%@page import="sukso.SuksoManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../style.css" rel="stylesheet">


<form action="sukso_serch.jsp">
	<div class="col-md-1"></div>
	<div class="col-md-3">

		<h5 class="text-primary">숙소위치를 클릭하세요.</h5>



		<div>

			<input type="checkbox" name="place" value="강남">강남지역일대<br>
			<br> <input type="checkbox" name="place" value="신촌">신촌지역일대<br>
			<br> <input type="checkbox" name="place" value="종로">종로지역일대<br>
			<br> <input type="checkbox" name="place" value="건대">건대지역일대<br>
			<br> <input type="checkbox" name="place" value="노원">노원지역일대<br>

		</div>

		<br>
		<br>
		<h5 class="text-primary">가격범위를 입력하세요.</h5>
		<div>

			<input type="text" name="min_price" class="form-control"
				placeholder="최소가격">부터 <input type="text" name="max_price"
				class="form-control" placeholder="최대가격">까지
		</div>

		<br>
		<br>
		<div>
			<input type="submit" value="검색하기"> 
			<input type="reset" value="검색초기화하기">
		</div>

	</div>
</form>
