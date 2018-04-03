<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>

</style>

<body> <!-- ���� -->
<div class="w3-container w3-center" style="margin-left:25%; margin-top:200px;">

<div class="w3-container" style="width:70%">
	<span class="w3-center w3-large">
		<h3>���� <b>������</b> �ͱ�</h3>
	</span>
	<br>
 	<c:if test="${count==0}">
	<table class="w3-table w3-bordered">
		<tr class="w3-yellow">
			<td class="w3-center">������ �ͱ��� �����ϴ�.</td>
	</table>
	</c:if>
	<c:if test="${count!=0}">
 	<table class="w3-table w3-bordered" >
		<tr class="w3-yellow">
			<td align="center" width="50">��ȣ</td>
			<td align="center" width="250">�� ��</td>
			<td align="center" width="100">�ͱ���</td>
			<td align="center" width="100">�ͱ۷�(/)</td>
			<td align="center" width="100">����</td>
		</tr>
    
    	<c:forEach var="mylist" items="${mylist}">
		<tr>
			<td align="center" width="50">${count}</td>
			<c:set var="count" value="${count-1}"/>
			<td align="center" width="250">
			<a style="cursor:pointer" onclick="document.location.href='wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')">
			${mylist.wname}</a></td>
			<td align="center" width="100">${mylist.whost}</td>
			<td align="center" width="100">
			<i class="fa fa-user" style="font-size:20px"></i>
			10/${mylist.wmax}</td>
			<td align="center" width="100">
			<button class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey"
			onclick="document.location.href='groupUpdate?wboardid=${mylist.wboardid}'">����</button>
			</td>
		</tr>
	 </c:forEach>
	</table>
	</c:if>
	<br>

	

<br><br><br><br>
	<span class="w3-center w3-large">
		<h3>���� <b>������</b> �ͱ�</h3>
	</span>
	<br>
	
 	<c:if test="${count2==0}">
	<table class="w3-table w3-bordered">
		<tr class="w3-yellow">
			<td class="w3-center">������ �ͱ��� �����ϴ�.</td>
	</table>
	</c:if>
	<c:if test="${count2!=0}">
	
 		<table class="w3-table w3-bordered">
		<tr class="w3-yellow">
		<td align="center" width="50">��ȣ</td>
		<td align="center" width="250">�� ��</td>
		<td align="center" width="100">�ͱ���</td>
		<td align="center" width="100">Ż��</td>
		<td align="center" width="100">�ı� �ۼ�</td>
		</tr>
	<c:forEach var="mylist" items="${mylist2}">	
		<tr>
		<td align="center" width="50">${count2}</td>
		<c:set var="count2" value="${count2-1}"/>
		<td align="center" width="250">
		<a style="cursor:pointer" onclick="document.location.href='wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')">
		${mylist.wname}</a></td>
		<td align="center" width="100">${mylist.whost}</td>
		<td align="center" width="100">
		<button onclick="document.location.href='wagleOut?wboardid=${mylist.wboardid}'" class="w3-btn w3-padding-small w3-round w3-red">Ż��</button></td>
		<td align="center" width="100">
		<button  onclick="document.getElementById('reviewForm').style.display='block'"
		class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey">�ı� �ۼ�</button>
		<%@include file="/WEB-INF/view/board/reviewForm.jsp" %>
		</td>
		</tr>
	</c:forEach>
		</table>

	</c:if>
</div>
</body>
</html>