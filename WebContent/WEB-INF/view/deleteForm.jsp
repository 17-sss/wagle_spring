<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head><title>Wagle 탈퇴</title></head>
<body style="margin-top: 200px;">
<p class="w3-left" style="padding-left: 30px;"></p>
<center>
<div class="w3-container">
	<h3><b>Wagle을 탈퇴하시겠습니까?</b></h3><br>
<form method="post" name="deleteForm" action="deletePro?email=${sessionEmail}" onsubmit="return deleteSave()">
	<table class="table-bordered" width="360">
	<tr height="30"><td align="center"><b>비밀번호를 입력해 주세요.</b><br></td></tr>
	<td align="center">비밀번호:
	<input type="password" name="pwd" size="8" maxlength="12">
	<input type="hidden" name="email" value="${sessionEmail}"></td></tr>
	<tr height="30">
	<td align="center">
	<input  class="w3-button w3-amber w3-round" type="submit" value="탈퇴">
	<input  class="w3-button w3-amber w3-round" type="button" value="취소" onclick="document.location.href='updateForm?email=${sessionEmail}'">
	</td></tr></table></form></center></div>
</body>
</html>