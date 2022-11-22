<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP/Servlet Life Cycle 연습(test1Res.jsp)</h2>
	<form name="myform" method="post"></form>
	<table class="table">
		<tr>
			<th>제목</th>
			<td>${title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${content}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="돌아가기" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/study/1119_LifeCycle/test1.jsp';"/></td>
		</tr>
	</table>
</div>
<p><br/></p>
</body>
</html>