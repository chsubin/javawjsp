<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>전체 회원 리스트</h2>
	<table class="table table-hover">
		<tr class="table-dark text-dark">
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>성명</th>
		<th>포인트</th>
		<th>최근방문일</th>
		</tr>
 <%-- <c:forEach var="변수" items="객체명" varStatus="매개변수"> --%>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
			<td>${vo.idx}</td>		
			<td>${vo.mid}</td>		
			<td>${vo.pwd}</td>		
			<td>${vo.name}</td>		
			<td>${vo.point}</td>		
			<td>${vo.lastDate}</td>		
		</tr>
	</c:forEach>
	</table>
	<br/>
	<div><a href="${pageContext.request.contextPath}/study/1120_Database/member.jsp" class="btn btn-primary">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>