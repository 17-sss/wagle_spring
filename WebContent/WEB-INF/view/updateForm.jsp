<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	
	body {
		/*font-family: 'Jeju Gothic';*/
		background-size: cover;
		background-image: url("/wagle_spring/img/wagle.jpg");
 		padding-top: 5en;
 		/* display: flex; */
 		justify-content: center;
	}
</style>
<script>
	//confirm pwd
 function checkPwd(){
        var f1 = document.forms[0];
        var pw1 = f1.pwd.value;
        var pw2 = f1.confirmPwd.value;
        if(pw1!=pw2){
         document.getElementById('checkPwd').style.color = "red";
         document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
         
        }
        
       }
	
	
	//아이디(email) duplicate
	function check(){
		if(!document.joinForm.email.value){
			alert("Email을 입력하세요");
			return false;
		}
	}
	function confirmId(){
		if(document.joinForm.email.value == ""){
			alert("Email을 중복체크 하세요");
			return;
		}
		url = "confirmId.jsp?id=" + document.joinForm.id.value;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
</script>

<body>

<!-- signup Form -->
<div class="w3-container w3-half w3-display-middle" style="width:40%;">
  <form class="w3-container w3-transparent" method="post" name="updateForm" onSubmit="return check()"
	action="<%=request.getContextPath()%>/member/updatePro">
  <ul class="w3-ul w3-hover-shadow">
  <li class="w3-yellow w3-xlarge w3-center w3-padding-32" style="color: black;">회원정보수정</li>
	<input type="hidden" name="num" value="${num}">
	
		<!-- 기본정보 -->
			<table class="w3-table w3-bordered" style="width:100%;">
			<tr height="30">
			<td width="100">이름 :</td>
			<td width="100">${member.name}</td>
			</tr>
			<tr height="30">
			<td width="100">이메일 :</td>
			<td width="100">${member.email}</td>
			</tr>
			<tr height="30">
			<td width="100">비밀번호:</td>
			<td width="100">
			<input class="w3-input w3-border  w3-light-grey" type="password" name="pwd" size="20" required="required">
			</td></tr>
			<tr height="30">
			<td width="100">비밀번호 확인 :</td>
			<td width="100">
			<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required">
			<div id="checkPwd"></div>
			</td></tr>
			<tr height="30">
			<td width="100">성별 :</td>
			<td width="100">${member.gender}</td>
			</tr>
			<tr height="30">
			<td width="100">나이 :</td>
			<td width="100">
				 <input type="radio" name="age" value="10대" required="required">10대
				 <input type="radio" name="age" value="20대" required="required">20대
				 <input type="radio" name="age" value="30대" required="required">30대
				 <input type="radio" name="age" value="40대" required="required">40대
				 <input type="radio" name="age" value="50대" required="required">50대
				 <input type="radio" name="age" value="60대" required="required">60대
			</td>
			</tr>
			<tr height="30">
			<td width="100">거주지 :</td>
			<td width="100">
				<input class="w3-input w3-border w3-light-grey" type="text" name="loc" size="20" required="required">	
			</td>
			</tr>
			
			<tr height="30">
			<td width="100">
			<input class="w3-button w3-yellow w3-round" type="submit" value="작성완료">
			<input class="w3-button w3-yellow w3-round" type="reset" value="다시작성">
			<input class="w3-button w3-yellow w3-round" type="button" value="취소" onclick="window.location.href='/wagle_spring/index'">
			</td></tr>
			</table>
			</ul></form>
			</div>
</body>
</html>