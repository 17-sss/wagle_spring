<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
li{display:inline;}
</style>
</head>
<body>
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%">
	<div>
<form method="post" action="#">
<select class="w3-border" name="option">
    <option value="0" selected>��ü����</option>
    <option value="1">��������</option>
    <option value="2">��������</option>
    <option value="3">��������</option>
    <option value="3">���Ծ�����</option>
  </select>
<select style="width:200px" class="w3-border" name="option2">
    <option value="0" selected>���̵�</option>
    <option value="1">����</option>
  </select> 
<input style="width:100px"type="text" placeholder="�����˻�"/><i class="fa fa-search w3-button w3-border"></i>

</form>
	</div>
<hr>
	<form method="post" action="cmessagedelete?num=${article.num}">
	<div>
	<ul>
	<li><input type="submit"class="w3-button" value="����"></li>
	<li><button class="w3-button">����</button></li>
	<li><button class="w3-button">����</button></li>
	<li><a href="messagelist" class="w3-button">���</a></li>
	<li><button class="w3-button">������</button></li>
	<li><button class="w3-button">������</button></li>
	</ul>
	</div>
	</form>
	<hr>
<div>
	&nbsp;&nbsp;&nbsp;������� ${article.userinfo} <br> 
	&nbsp;&nbsp;&nbsp;�޴½ð� ${article.regdate}
</div>
	<hr>
	<c:if test="${group !='3'}">
	${article.receivemessage}
	</c:if>
	<c:if test="${group =='3'}">
	${article.sendmessage}
	</c:if>
</div>
</body>
</html>