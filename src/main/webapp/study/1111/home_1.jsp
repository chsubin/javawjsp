<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String mid =request.getParameter("mid");
  String pwd= request.getParameter("pwd");
  String name=request.getParameter("name");
  String birth = request.getParameter("birth");
  String gender = request.getParameter("gender");
  String contry = request.getParameter("contry");
  String [] hobbys = request.getParameterValues("hobby");
  String [] jobs = request.getParameterValues("job");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
  <div class="container">
  <div><p></p></div>
  <h2>가입정보 확인</h2>
  <p>가입정보를 확인해주세요!</p>
  <br/><br/><br/>
    <div class="table-responsive-sm">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>아이디</th><th>비밀번호</th><th>이름</th><th>생년월일</th><th>성별</th><th>국적</th><th>취미</th><th>희망직종</th>
          </tr>
        </thead>
        <tr>
          <td><%=mid %></td>
          <td><%=pwd %></td>
          <td><%=name %></td>
          <td><%=birth %></td>
          <td><%=gender %></td>
          <td><%=contry %></td>
          <td><%
            if(hobbys==null){out.print("없음");}
            else{
              for(String hobby:hobbys){
                out.print(hobby+"<br/>"); 
               }
            }
          %></td>
          <td><%
            for(String job:jobs){
             out.print(job+"<br/>"); 
            }
          %></td>
        </tr>
      </table>
    </div>
    <div><a href="home.jsp" target="_blank">뒤로가기</a></div>
  </div>
</body>
</html>