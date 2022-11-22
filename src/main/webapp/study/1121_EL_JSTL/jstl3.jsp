<%@page import="study.database.JusorokVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="study.database.JusorokDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<%
	JusorokDAO dao = new JusorokDAO();

	ArrayList<JusorokVO> vos = dao.getMemberList();
	pageContext.setAttribute("vos", vos);
%>
<div class="container">
	<h2>회원 전체 리스트</h2>
	<table class="table table-hover">
		<tr class="table-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>성명</th>
			<th>포인트</th>
			<th>최근방문일</th>
		</tr>
		<c:set var="cnt0" value="0"></c:set>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.mid}</td>
				<td>${vo.pwd}</td>
				<td>${vo.name}</td>
				<td>${vo.point}</td>
				<td>${vo.lastDate}</td>
			</tr>
			<c:set var="cnt0" value="${cnt0+1}"/>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
		<p>전체 출력 건수 : ${cnt0}건<p>
	<pre><h4>등록된 회원중 홀수번째 가입한 회원만 출력하시오?</h4></pre>
	<h2>회원 전체 리스트</h2>
	<table class="table table-bordered table-hover">
		<tr class="table-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>성명</th>
			<th>포인트</th>
			<th>최근방문일</th>
		</tr>
		<c:set var="cnt2" value="0"/>
		<c:forEach var="vo" items="${vos}" step="2" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<td>${vo.mid}</td>
				<td>${vo.pwd}</td>
				<td>${vo.name}</td>
				<td>${vo.point}</td>
				<td>${vo.lastDate}</td>		
			</tr>
			<c:set var="cnt" value="${st.count}"/>
			<c:set var="cnt2" value="${cnt2+1}"/>
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
	<p>전체 출력 건수 : <font color="red">${cnt}</font>건<p>
	<p>전체 출력 건수 : <font color="blue">${cnt2}</font>건<p>
</div>
<p><br/></p>
</body>
</html>