<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
  	'use strict';
  	let mid, pwd, name , birth, hobbys, jobs;
  	
  	function midCheck(){
			mid = myform.mid.value.trim(); let midregx =/^[0-9a-z]{4,10}$/g;
			spaceCheck(myform.mid);
  		if(mid.substring(0,1).match(/[0-9]/g)){
  			myform.mid.value="";
  			alert("아이디는 영문 소문자로 시작하세요.")
  		}
  	}
  	
  	function spaceCheck(e){
			let spacecheck = e.value;
  		if (spacecheck.match(/\s/g)){e.value="";alert("공백은 사용할 수 없습니다.");e.focus();};
  		e.value= spacecheck.replace(" ","");
  		e.focus();
  		
  	}
  	
  	function fCheck(){ //유효성 체크 : 
			mid = myform.mid.value; let midregx =/^[0-9a-z]{4,10}$/g;
			pwd = myform.pwd.value;let pwdregx=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
  		name = myform.name.value;
  		birth = myform.birth.value;
			hobbys = new Array();
			jobs = new Array();
  		
			for (let i=0;i<myform.hobby.length;i++){  //hobby의 값 받기
				if(myform.hobby[i].checked){
					hobbys.push(myform.hobby[i].value);
				}
			}
			for (let i=0;i<myform.hobby.length;i++){ //job의 값받기
				if(myform.job[i].selected){
					jobs.push(myform.job[i].value);
				}
			}
			
			if(mid==""){alert("아이디를 입력해주세요.");return;};
			if(!mid.match(midregx)){alert("아이디는 4~10이내의 영문소문자,숫자로 입력해주세요.");return;};
			
			if(!pwd.match(pwdregx)){alert("비밀번호는 최소 8자 이상, 하나이상의 영문 대/소문자,숫자,특수문자를 입력해주세요.");return;}
			if(!name.match(/^[가-힣a-zA-z]{2,20}$/g)){alert("이름은 한글이나 영문 대/소문자 2~20자로 입력해주세요.");return;}
			if(myform.birth.value==""){alert("생일을 입력해주세요.");return;}
			if(jobs.length==0){alert("희망직종은 하나 이상 선택하여주세요.");return;}
			alert("성공");
 		
  		myform.submit();
  		
  	}
  </script>
  <style>
    h2{
      display:block;
      text-align: center;
    }
    body {
     padding-top : 0;
     margin-top: 0;
    }
    html {
      padding-top:0px;
    }
  </style>
</head>
<body>
  <div class="container" style="background-color:white; margin-top:0px padding-top: 0px">
    <div class="back" style="width :500px; margin: 0 25%; padding-top:0px">
      <p><h2>회원가입</h2></p>
      <form name="myform" method="post" action="home_1.jsp">
        <div class="form-group">
          <label for="mid">아이디 : </label>
          <input type="text" name ="mid" id="mid" class="form-control mb-3" onkeyup="midCheck()" autofocus/>
          <label for="pwd">비밀번호 : </label>
          <input type="password" name ="pwd" id="pwd" class="form-control mb-3" onkeyup="spaceCheck(this)" placeholder="8자 이상 영문/대소문자+숫자+특수문자"/>
          <label for="name">이름 : </label>
          <input type="text" name ="name" id="name" class="form-control mb-3"  onkeyup="spaceCheck(this)"/>
          <label for="gender">성별 : </label>
          <input type="radio" name ="gender" id="gender" value="남자" checked class="mb-3"/>남자
          <input type="radio" name ="gender" id="gender2" value="여자" class="mb-3"/>여자<br/>
          국적 : 
          <select class="form-control mb-3" name="contry" id="contry">
            <option class="mb-3" value="내국인">내국인</option>
            <option class="mb-3" value="외국인">외국인</option>
          </select>
          생년월일 : 
            <input type="date" style="width:350px;" name="birth" id="birth" class="mb-3" value="2000-01-01"/></br>
          취미 : 
            <input type="checkbox" name="hobby" id="hobby1" value="등산"/>등산
            <input type="checkbox" name="hobby" id="hobby2" value="독서"/>독서
            <input type="checkbox" name="hobby" id="hobby3" value="게임"/>게임
            <input type="checkbox" name="hobby" id="hobby4" value="낚시"/>낚시</br>
            <div class="mb-3"></div>
          희망직종 :
          <select class="form-control" name="job" id="job" size=4 multiple="multiple">
            <option value="프론트엔드">프론트엔드</option>
            <option value="백엔드">백엔드</option>
            <option value="풀스택">풀스택</option>
            <option value="안드로이드">안드로이드</option>
            <option value="IOS">IOS</option>
            <option value="게임">게임</option>
          </select>
          <div style="margin : 16px 30%">
            <input type="button" value="회원가입" class="btn btn-success" onclick="fCheck()"/>
            <input type="reset" value="다시작성" class="btn btn-danger"/>
          </div>  
        </div>
      </form>
    </div>
  </div>
</body>
</html>