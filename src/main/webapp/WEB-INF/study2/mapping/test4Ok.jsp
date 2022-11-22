<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test4Ok.jsp</title>
  <%@ include file="../../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>계산된 결과 출력</h2>
	<p>
		${su1} ${opt}	${su2} = ${res}
	
	</p>
	<p>
		<a href="${ctp}/mapping/Test4.do" class="btn btn-secondary">돌아가기</a>
	</p>
</div>
<p><br/></p>
</body>
</html>