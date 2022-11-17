<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<!-- 로그인창에서 '아이디/비밀번호/성명'을 입력후 서버로 전송 후, 관리자 인증이 되면 인증 성공 창에서 입력된 '아이디''비밀번호''성명'을 모두 출력하시오. -->
<body>
<p><br/></p>
<div class="container">
<div class="border m-4 p-4">
	<form name="myform" method="post" action="test1Ok.jsp"> <!-- 패키지명_파일이름으로 약속 -->
	<div><h2 class="text-center">로 그 인</h2></div>
	<p>
		아이디 : <input type="text" name="mid" id ="mid" value="admin" autofocus required class="form-control"/>
	</p>
	<p>
		비밀번호 : <input type="password" name="pwd" id ="pwd" value="1234" class="form-control"/>
	</p>
	<p>
		이름 : <input type="text" name="name" id ="name" value="홍길동" class="form-control"/>
	</p>
	<p>
		<div class="row text-center">
			<div class="col"><input type="submit" value="전송" class="btn btn-success form-control"/></div>
			<div class="col"><input type="reset" value="다시입력" class="btn btn-warning form-control"/></div>
		</div>
	</p>
	</form>
</div>
</div>
<p><br/></p>
</body>
</html>