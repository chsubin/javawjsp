<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	'use strict';
  	let msg = "${msg}";
  	let url = "${url}";
  	
  	if(msg=="guInputOk") msg = "방명록에 글이 등록 되었습니다.";
  	else if(msg=="guInputNo") msg="등록 실패~";
  	else if(msg=="adminLoginOk") msg="관리자 인증 성공!!";
  	else if(msg=="adminLoginNo") msg="관리자 인증 실패!!";
  	else if(msg=="adminLogoutOk") msg="관리자님 로그아웃 되셨습니다.";
  	else if(msg=="guDeleteOk") msg="방명록의 글이 삭제 되었습니다.";
  	else if(msg=="guDeleteNo") msg="삭제 실패~";
  	
  	alert(msg);
  	if(url!="") location.href = url;
  </script>
</head>
<body>
</body>
</html>