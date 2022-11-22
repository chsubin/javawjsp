<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid =(String)session.getAttribute("sMid");
	String pwd =(String)session.getAttribute("sPwd");
	pageContext.setAttribute("mid",mid);
	pageContext.setAttribute("pwd",pwd);
	

	
	int cnt=0;
	if (session.getAttribute("sCnt")==null){
		session.setAttribute("sCnt", 1);
	}
	else {
		cnt =(int)session.getAttribute("sCnt")+1;
		session.setAttribute("sCnt", cnt);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container" style ="text-align:center;">
	<p>${mid}님, 안녕하세요.</p>
	<p>총 방문자수 : <b><font color="blue">${sCnt}</font></b></p>
	<div><img src="${pageContext.request.contextPath}/images/1.jpg"/></div>
	<button onclick="location.href='${pageContext.request.contextPath}/j1118h/LogOut';" class="btn btn-success mt-3">로그아웃</button>
</div>
<p><br/></p>
</body>
</html>