<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  	
  	
  	<style>
  		body{
  			background-color: rgb(252, 176, 67, 0.9);			
  		}
  		
  	</style>
</head>
<body>

<div class="w3-container w3-display-middle">
	 <!-- leftside -->
<!-- 	 <div class="w3-card-4" style="float: left; width:50%; ">
    <img class=" w3-round" src="https://www.w3schools.com/w3css/img_fjords.jpg" style="width:100%">
  	</div> -->
  
  
  
  	<!-- rightside => change to center -->
  <div class="w3-round w3-card-4 w3-bar w3-amber" >	
		<div class="w3-bar w3-amber">
    <button class="w3-bar-item w3-button tablink w3-orange"onclick="openCity(event,'Login')">Login</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Sign_Up')">Sign Up</button>
  </div>
  
  <form class="w3-white" action="/wagle_spring/member/login" method="post">
  <div id="Login" class="w3-container w3-border city">
    <h2>Login</h2>
    <p>
	<input class="w3-input" type="text" name="email" style="width:100%" required>
	<label>EMAIL</label></p>
	<p>
	<input class="w3-input" type="password" name="pwd" style="width:100%" required>
	<label>PASSWORD</label></p>
	
	<p>
	<input id="milk" class="w3-check" type="checkbox" checked="checked">
	<label>REMEMBER MY EMAIL</label></p>
	
	<p class="w3-center">
	<button class="w3-button w3-section w3-amber  w3-round w3-ripple" type="submit"> Login </button>
	
	<button class="w3-button w3-section w3-amber w3-round w3-ripple" type="button" 
			onclick="window.location.href='/wagle_spring/index'"> Cancel </button>
	</p></div>
	</form>


	<form class="w3-white" method="post" name="joinForm" onSubmit="return check()"
	action="${pageContext.request.contextPath}/member/joinPro">
	  <div id="Sign_Up" class="w3-container w3-border city" style="display:none">
    <h2>Sign Up</h2>
    <p>
			<label class="w3-text-grey">
			이름 :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-grey">
			이메일 :&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="w3-input w3-border w3-light-grey" type="email" name="email" size="10"  required="required">
			<input type="button" value="중복확인" name="confirm_id" onClick="confirmId(this.form)"/></label>
			<br>
			<label class="w3-text-grey">
			비밀번호 :<input class="w3-input w3-border  w3-light-grey" type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-grey">
			비밀번호 확인 :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required"></label>
			<div id="checkPwd"></div><br>
			<label class="w3-text-grey">
			성별 : <input type="radio" name="gender" value="male" required="required">남
				 <input type="radio" name="gender" value="female" required="required">여</label><br><br>
			<label class="w3-text-grey">
			나이 : <input type="radio" name="age" value="10대" required="required">10대
				 <input type="radio" name="age" value="20대" required="required">20대
				 <input type="radio" name="age" value="30대" required="required">30대
				 <input type="radio" name="age" value="40대" required="required">40대
				 <input type="radio" name="age" value="50대" required="required">50대
				 <input type="radio" name="age" value="60대" required="required">60대</label><br><br>
			
			<label class="w3-text-grey">
			거주지 :<input class="w3-input w3-border w3-light-grey" type="text" name="loc" size="20" required="required"></label>
			
			<p>
			<label>
			<input type="hidden" name="num" value="${num}">
			<input class="w3-button w3-yellow w3-round" type="submit" value="작성완료"><!-- &nbsp;&nbsp; -->
			<input class="w3-button w3-yellow w3-round" type="reset" value="다시작성">
			<input class="w3-button w3-yellow w3-round" type="button" value="취소" onclick="window.location.href='/wagle_spring/index'">
			</label></p>
		</div></form>
  
  	</div>
  </div>
  </div>



<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-orange", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-orange";
}
</script>

</body>
</html>