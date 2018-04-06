<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>ȸ����������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	
	body {
		/*font-family: 'Jeju Gothic';*/
		background-size: cover;
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
         document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
         
        }
        
       }
	
	
	//���̵�(email) duplicate
	function check(){
		if(!document.joinForm.email.value){
			alert("Email�� �Է��ϼ���");
			return false;
		}
	}
	function confirmId(){
		if(document.joinForm.email.value == ""){
			alert("Email�� �ߺ�üũ �ϼ���");
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
	action="${pageContext.request.contextPath}/member/updatePro">
  <ul class="w3-ul w3-hover-shadow">
  <li class="w3-yellow w3-xlarge w3-center w3-padding-32" style="color: black; width:100%;">ȸ����������</li>
  <input type="hidden" name="email" value="${member.email}"/>	
		<!-- �⺻���� -->
			<table class="w3-table w3-bordered" style="width:100%;">
			<tr height="30">
			<td width="30">�̸� :</td>
			<td width="70">${member.name}</td>
			</tr>
			<tr height="30">
			<td width="30">�̸��� :</td>
			<td width="70">${member.email}</td>
			</tr>
			<tr height="30">
			<td width="30">��й�ȣ:</td>
			<td width="70">
			<c:if test="${sessionEmail ne 'admin'}">
			<input class="w3-input w3-border  w3-light-grey" type="password" name="pwd" size="20" value="${member.pwd}" required="required">
			</c:if>
			<c:if test="${sessionEmail eq 'admin'}">
			<input class="w3-input w3-border  w3-light-grey" type="text" name="pwd" size="20" value="${member.pwd}" required="required">
			</c:if>
			</td></tr>
			<c:if test="${sessionEmail ne 'admin'}">
			<tr height="30">
			<td width="30">��й�ȣ Ȯ�� :</td>
			<td width="70">
			<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required">
			<div id="checkPwd"></div>
			</td></tr>
			</c:if>
			<tr height="30">
			<td width="30">���� :</td>
			<td width="70">${member.gender}</td>
			</tr>
			<tr height="30">
			<td width="30">���� :</td>
			<td width="70">
				 <input type="radio" name="age" value="10��" required="required" <c:if test="${member.age eq '10��'}">checked </c:if>>10��
				 <input type="radio" name="age" value="20��" required="required" <c:if test="${member.age eq '20��'}">checked </c:if>>20��
				 <input type="radio" name="age" value="30��" required="required" <c:if test="${member.age eq '30��'}">checked </c:if>>30��
				 <input type="radio" name="age" value="40��" required="required" <c:if test="${member.age eq '40��'}">checked </c:if>>40��
				 <input type="radio" name="age" value="50��" required="required" <c:if test="${member.age eq '50��'}">checked </c:if>>50��
				 <input type="radio" name="age" value="60��" required="required" <c:if test="${member.age eq '60��'}">checked </c:if>>60��
			</td>
			</tr>
			<tr height="30">
			<td width="30">������ :</td>
			<td width="70">
				<input class="w3-input w3-border w3-light-grey" type="text" name="loc" size="10" value="${member.loc}" required="required">	
			</td>
			</tr>
			
			<tr height="30">
			<td width="30" colspan="2">
			<input class="w3-button w3-yellow w3-round" type="submit" value="��������">
			<c:if test="${sessionEmail ne 'admin'}">
			<input class="w3-button w3-yellow w3-round" type="button" value="Ż���ϱ�" onclick="window.location.href='deleteForm?email=${member.email}'">
			<input class="w3-button w3-yellow w3-round" type="button" value="���" onclick="window.location.href='/wagle_spring/index'">
			</c:if>
			<c:if test="${sessionEmail eq 'admin'}">
			<input class="w3-button w3-yellow w3-round" type="button" value="���" onclick="window.location.href='/wagle_spring/admin/memberlist'">
			</c:if>
			</td></tr>
			</table>
			</ul></form>
			</div>
</body>
</html>