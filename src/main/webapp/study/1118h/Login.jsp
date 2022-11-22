<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	Cookie [] cookies = request.getCookies();
	if (cookies!=null){
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("cMid")){
				String mid=cookies[i].getValue();
				pageContext.setAttribute("mid", mid);
			}
			if(cookies[i].getName().equals("cPwd")){
				String pwd=cookies[i].getValue();
				pageContext.setAttribute("pwd", pwd);
			}
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
<h2>회원가입</h2>
<p><br/></p>
	<form name="myform" method="post" action="${pageContext.request.contextPath}/study/j1118h/LoginOk">
		<div class ="form-group">
			<label for="mid">아이디 : </label>
			<input type="text" class="form-control" name="mid" value="${mid}" />
		</div>
		<div class ="form-group">
			<label for="id">비밀번호 : </label>
			<input type="password" class="form-control" name="pwd" value="${pwd}"/>
		</div>
		<div class ="form-group form-check">
			<label for="form-check-label">
				<input type="checkbox" class="form-check-input" name="check" value="y" checked />로그인 상태 유지
			</label>
		</div>
		<input type="submit" class="btn btn-primary" value="로그인"/>
	</form>
</div>
</body>
</html>