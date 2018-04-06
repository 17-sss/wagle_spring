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
    	<c:if test="${today > mylist.wend}">
		<tr style="color:red">
		</c:if>
		<c:if test="${today <= mylist.wend}">
		<tr>
		</c:if>
			<td align="center" width="50">${count}</td>
			<c:set var="count" value="${count-1}"/>
			<td align="center" width="250">
			<a style="cursor:pointer" onclick="document.location.href='/wagle_spring/board/wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')">
			${mylist.wname}</a></td>
			<td align="center" width="100">${mylist.whost}</td>
			<td align="center" width="100">
			
			
			<div class="w3-dropdown-hover">
			    <button class="w3-btn w3-padding-small w3-white">
			    <i class="fa fa-user" style="font-size:20px"></i>
				${mylist.all}/${mylist.wmax}</button>
			    <div class="w3-dropdown-content w3-bar-block w3-border" style="width:300px;">
			    	<a href="host" class="w3-bar-item w3-button" style="color:red;"><b>${mylist.host}</b></a> 
				    <c:forEach var="mylist3" items="${mylist.member}">
						<a class="w3-bar-item w3-button">${mylist3.wagler}
						
						<button onclick="document.location.href='/wagle_spring/board/wagleOut2?wboardid=${mylist.wboardid}&wagler=${mylist3.wagler}'" class="w3-btn w3-padding-small w3-round w3-red w3-right">Ż��</button>
						&nbsp;&nbsp;
						<button onclick="document.location.href='#'" class="w3-btn w3-padding-small w3-round w3-yellow w3-right">����</button>
						&nbsp;&nbsp;
						</a>
					</c:forEach>
			    </div>
			  </div>
			</td>
			<td align="center" width="100">
			<button class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey"
			onclick="document.location.href='/wagle_spring/board/wagleUpdate?wboardid=${mylist.wboardid}'">����</button>
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
	
 		<table class="w3-table w3-bordered" style="margin-bottom:100px;">
		<tr class="w3-yellow">
		<td align="center" width="50">��ȣ</td>
		<td align="center" width="250">�� ��</td>
		<td align="center" width="100">�ͱ���</td>
		<td align="center" width="100">Ż��</td>
		<td align="center" width="100">�ı� �ۼ�</td>
		<td align="center" width="100">���� ������</td>
		</tr>
	<c:forEach var="mylist" items="${mylist2}">	
		<tr>
		<td align="center" width="50">${count2}</td>
		<c:set var="count2" value="${count2-1}"/>
		<td align="center" width="250">
		<a style="cursor:pointer" onclick="document.location.href='/wagle_spring/board/wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')">
		${mylist.wname}</a></td>
		<td align="center" width="100">${mylist.host}</td>
		<td align="center" width="100">
		<button onclick="document.location.href='/wagle_spring/board/wagleOut?wboardid=${mylist.wboardid}'" class="w3-btn w3-padding-small w3-round w3-red">Ż��</button></td>
		<td align="center" width="100">
		<button  onclick="document.getElementById('reviewForm').style.display='block'"
		class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey">�ı� �ۼ�</button>
		<%@include file="/WEB-INF/view/board/reviewForm.jsp" %>
		</td>
		<td align="center" width="100">
			  <div class="w3-dropdown-hover">
			    <button class="w3-btn w3-padding-small w3-white">������</button>
			    <div class="w3-dropdown-content w3-bar-block w3-border" style="width:250px;">
			    	<a class="w3-bar-item w3-button" style="color:red;"><b>${mylist.host}</b>
			    	&nbsp;&nbsp;
			    	<button onclick="document.location.href='#'" class="w3-btn w3-padding-small w3-round w3-yellow w3-right">����</button>
			    	</a> 
				    <c:forEach var="mylist3" items="${mylist.member}">
						<a class="w3-bar-item w3-button">${mylist3.wagler}
						&nbsp;&nbsp;
						<button onclick="document.location.href='#'" class="w3-btn w3-padding-small w3-round w3-yellow w3-right">����</button>
						</a>
					</c:forEach>
			    </div>
			  </div>
		</td>
		</tr>
	</c:forEach>
		</table>

	</c:if>
</div>
</body>
</html>