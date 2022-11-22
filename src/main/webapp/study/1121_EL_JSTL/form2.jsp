<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>form.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name ="myform" method="post" action="${pageContext.request.contextPath}/study/el_jstl/El2">
	<h2>자료 전송 연습</h2>
	<div>
		성명 : <input type="text" name="name" value="홍길동" class ="form-control"/>
	</div>
	<div>
		취미 : 
		<input type="checkbox" name="hobby" value="독서"/>독서
		<input type="checkbox" name="hobby" value="수영"/>수영
		<input type="checkbox" name="hobby" value="등산"/>등산
		<input type="checkbox" name="hobby" value="바둑"/>바둑
		<input type="checkbox" name="hobby" value="승마"/>승마
	</div>
	<div>
		두번째수 : <input type="text" name="su2" value="200" class ="form-control"/>
	</div>
	<div>
		<input type="submit" value="값 전송하기" class ="btn btn-success form-control mt-3"/>
	</div>
	</form>
</div>
<p><br/></p>
</body>
</html>