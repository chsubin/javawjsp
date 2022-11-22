<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberSearch.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>개별 회원 조회</h2>
	<table class="table table-bordered">
		<tr>
			<th>고유번호</th>
			<td>${vo.idx}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${vo.pwd}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>방문포인트</th>
			<td>${vo.point}</td>
		</tr>
		<tr>
			<th>최종방문날짜</th>
			<td>${vo.lastDate}</td>
		</tr>
		
					
	</table>
</div>
<p><br/></p>
</body>
</html>