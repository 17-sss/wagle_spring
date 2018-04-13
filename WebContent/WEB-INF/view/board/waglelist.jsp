<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js" style="background-color:#fff;">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		
		<link href="https://fonts.googleapis.com/css?family=Nunito:400,700|Playfair+Display:900" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/magneto.css" />
		
		
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>		
	
		<style type="text/css">
			/* �ӽ� ��׶��� ���. */
			.bgimg {
				min-height: 100%;
				background-position: center;
				background-size: cover;
				width: 100%;
				height: 100%;
			}
			/* �̹��� ���������� ó��.  */
			.autoimg {
				display: inline-block;
				width: auto !important;
				max-width: 100%;
				height: 300px !important;
			}
			section {
				height: 50vh !important;
	        	overflow: hidden;
	        	background-attachment: fixed;
	        	background-size: cover;
			}
			.section_img1 {
			/* 	background-color: black; */
			}
			
			/* ���� ����  */
			hr {
			    display: block;
			    margin-top: 0.5em;
			    margin-bottom: 0.5em;
			    margin-left: auto;
			    margin-right: auto;
			    border-style: inset;
			    border-width: 1px;
			}
			
			/* �˻� ���� */
			.search1 {
				padding: 8px;
				display: block;
				border: none;
				border-bottom: 1px solid #ccc;
				width: 52%
			}
			/* ���� [���� �����ϱ� ����] */
			.underline {
				 width: 300px;
 				 border-bottom: 2px solid currentColor;
 				 border-bottom-color: red;
			}
			/* ���� (����) */
			.underline-red {
 				border-bottom-color: red;
			}
			.custom-font {
				font-family: 'Coustard', serif;
			}
			
	</style>
	
	</head>
	<body class="demo-magneto">
		<main>
			<section class="content content--layout">
				<h2 class="word word--magneto">wagle</h2>
			</section>
		</main>
		
		<div class="w3-container"  style="margin-left: 30%; margin-right: 30%;" >
		<div class="w3-row w3-section w3-center">
		    <div class="w3-rest">
		      
		      
		      <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="��ü" onclick="document.location.href='/wagle_spring/board/waglelist?wcategory='+encodeURI('��ü')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="������" onclick="document.location.href='/wagle_spring/board/waglelist?wcategory='+encodeURI('������')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="����" onclick="document.location.href='/wagle_spring/board/waglelist?wcategory='+encodeURI('����')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="�丮/����" onclick="document.location.href='/wagle_spring/board/waglelist?wcategory='+encodeURI('�丮/����')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="�ι���/å" onclick="document.location.href='/wagle_spring/board/waglelist?wcategory='+encodeURI('�ι���/å')">
		      <br><br>
		      <input class="w3-input w3-small search1"  name="search" type="text" placeholder="Search" style="display: inline-block;">
		      <input class="w3-button w3-small" style="background-color:#FCB043;" value="Search" type="button" onclick="#">
		    </div>
		</div>
	</div>

<div class="w3-container w3-margin-top " style="margin-left: 10%; margin-right: 10%;">
	<c:if test="${wcategory eq '��ü' || wcategory == null}">
	<c:forEach var="waglelist" items="${waglelist}">
		<!-- �Ⱓ�� ���� �ͱ��� ǥ������ �ʵ��� ���ش�. -->
	 	<c:if test="${today <= waglelist.wend}">
		 <div class="w3-third w3-container w3-margin-bottom">
			<div class="w3-container w3-white w3-padding w3-center w3-round w3-button w3-border"  style="height:100%; width:100%;" onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')">
				<img src="<%=request.getContextPath()%>/wagleimg/${waglelist.filename}" alt="Test" class="autoimg">
				<h4><b>${waglelist.wname}</b></h4>
				<span class="w3-text-gray">�ͱ� ���� : ${waglelist.whost}</span>
				<div>
					<hr>
					<span class="w3-left">
						<b>�Ⱓ:&nbsp;</b>
						<span>${waglelist.wstart} ~ ${waglelist.wend}</span>
					</span>
					<i class="fa fa-user w3-right" style="font-size: 13pt;">&nbsp;<span>${waglelist.all}/${waglelist.wmax}</span></i>
				</div>
			</div>
		</div>
		</c:if>
	 </c:forEach>
	 </c:if>
	 
		<c:if test="${wcategory ne '��ü'}">
		 <c:forEach var="waglelist" items="${searchwaglelist}">
			<!-- �Ⱓ�� ���� �ͱ��� ǥ������ �ʵ��� ���ش�. -->
		 	<c:if test="${today <= waglelist.wend}">
			 <div class="w3-third w3-container w3-margin-bottom">
				<div class="w3-container w3-white w3-padding w3-center w3-round w3-button w3-border"  style="height:100%; width:100%;" onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')">
					<img src="<%=request.getContextPath()%>/wagleimg/${waglelist.filename}" alt="Test" class="autoimg">
					<h4><b>${waglelist.wname}</b></h4>
					<span class="w3-text-gray">�ͱ� ���� : ${waglelist.whost}</span>
					<div>
						<hr>
						<span class="w3-left">
							<b>�Ⱓ:&nbsp;</b>
							<span>${waglelist.wstart} ~ ${waglelist.wend}</span>
						</span>
						<i class="fa fa-user w3-right" style="font-size: 13pt;">&nbsp;<span>${waglelist.all}/${waglelist.wmax}</span></i>
					</div>
				</div>
			</div>
			</c:if>
		 </c:forEach>
		 </c:if>
		</div>

		
		
		<script src="${pageContext.request.contextPath}/js/charming.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/anime.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/demo.js"></script>
		<script src="${pageContext.request.contextPath}/js/demo1.js"></script>
		
		
	</body>
</html>