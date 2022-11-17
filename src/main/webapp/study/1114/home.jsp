<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
  	'use strict';
  	let idx=0;
  	let idxs= new Array();
  	let sw=0;

  	function formInput() {
  		idx++;
  		let str = "";
  		str +="<div id=pro"+idx+">"
  		str += "상품명 <input type='text' style='width:110px' name='pname' id='pname"+idx+"'/>"
  		str += "가격 <input type='number' style='width:90px' name='price' id='price"+idx+"'/>"
  		str += "수량 <input type='number' style='width:40px' name='number' id='number"+idx+"'/>"
  		str += " <input type='button' style='width:50px' value='삭제' onclick='deleteBox("+idx+")'/>"
  		str +="</div>"
  		idxs.push(idx);
  		console.log(idxs);
  		demo.innerHTML += str;
  	}
  	
  	function deleteBox(idx) {
      let pro = "pro"+idx;
      let item =document.getElementById(pro);
      item.parentNode.removeChild(item);
      idxs.splice(idxs.indexOf(idx), 1);
      console.log(idxs);
		}
  	function fCheck(){ //공백 체크
  		let name =document.getElementById("name").value.trim();
	
  		if (name==""){alert("이름을 입력해주세요.");return;}
  		
  		for(let su of idxs){
  		  let pname =document.getElementById("pname"+su).value.trim();
  		  let price =document.getElementById("price"+su).value.trim();
  		  let number =document.getElementById("number"+su).value.trim();
  			
  		  if (name.trim()=="")
				if (pname==""){alert("빈칸이 입력되었습니다.");return;}  		 
				if (price==""){alert("빈칸이 입력되었습니다.");return;}  		 
				if (number==""){alert("빈칸이 입력되었습니다.");return;}  		 
  			
  		}
			myform.submit();
  		
  	}
  	
  </script>
</head>
<body>
<div class="container">
	<form name='myform' method='post' action='<%=request.getContextPath()%>/j1114_homeOk'>
		<table style="text-align:right;width:450px;margin:0 auto;">
			<tr>
				<td>구매자   <input type="text" name="name" id="name" style="width:370px"/></td>
			</tr>
			<tr>
				<td>상품분류
					<select name="product" id="product" style="width:370px">
						<option>과일</option><option>채소</option><option>해산물</option><option>고기</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
          <input type="button" value="상품추가하기" onclick="formInput()" class="btn btn-primary" style="width: 440px"/>
				</td>
			</tr>
			<tr>
				<td>
          <div id="demo"></div>
				</td>
			</tr>
			<tr>
				<td>
          <input type="button" value="상품등록하기" onclick="fCheck()"  class="btn btn-success" style="width: 440px"/>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>