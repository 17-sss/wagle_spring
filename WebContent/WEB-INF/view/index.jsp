<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Coustard|Righteous" rel="stylesheet">
	<head>
	<title>welcome to Wagle!</title>
	<style>
		body{
			margin:0;
			padding:0;
		}
		section{
			height: 100vh;
        	overflow: hidden;
        	background-attachment: fixed;
        	background-size: cover;

		}
		.wagle_title{
			background-image: url(/wagle_spring/img/wagle.jpg);
			opacity: 0.7;
    		
			/* font-family: 'Righteous', cursive; */   
			font-family: 'Coustard', serif;  
		}
		.wagle_title h1{
			/* font-family: 'Righteous', cursive; */ 
		 	font-family: 'Coustard', serif;
		}
		.wagle_intro{
			background-color: white;
		}
		.wordcloud{
			background-color: lightgrey;
		}
		.waglewagle{
			background-color: white;
		}
		.contact{
			background-image: url(/wagle_spring/img/wagle.jpg);
			opacity: 0.7;
		}
		.contact h1{
			/* font-family: 'Righteous', cursive; */
			font-family: 'Coustard', serif;
		}
		header{
			color: white;
       		max-width: 50%;
        	position: relative;
        	left: 50%;
        	top: 50%;
        	transform: translateX(-50%) translateY(-50%);
        /*글,내용을 가운데에 놓기위한 css3값*/
        	font-size: 1.5rem;
        	text-align: center;
		}
		.top header{
			color: white;
			font-size: 2.4rem;
		}


		w3-top{
			/* font-family: 'Righteous', cursive; */ 
			font-family: 'Coustard', serif;
		}
		
	</style>
 <style>

 .w3-bar{
 box-shadow:0 5px 7px 0 rgba(0,0,0,0.16), 0 10px 8px 0 rgba(0,0,0,0.12);
 }
 
</style>
</head>

<body>

	<section class="wagle_title">
		<header>
		<h1 style="font-size: 15rem;">Wagle</h1>
			<h1>Want to know more about us?</h1>
			</header>
		  	  
		  	  <c:if test="${sessionEmail != null}">
			  <button class="w3-btn w3-black w3-display-middle w3-large" style="margin-top: 300px;"
			  disabled>Hello!</button>
			  </c:if>
			  
			  <c:if test="${sessionEmail == null}">
			  <button class="w3-btn w3-black w3-display-middle w3-large" style="margin-top: 300px;"
			  onclick="document.getElementById('login').style.display='block'">Enter</button>
			  </c:if>
			  
			  <%@include file="loginmodal.jsp" %>
	</section>
	<section class="wagle_intro">
		<header>
			<h2 style="color:black;">와글와글은 이런이런 곳이랍니다. 소개글</h2>
		</header>
	</section>
	<section class="wordcloud">
		<header>
			<h2 style="color:black;">wordcloud
			</h2>
		</header>
	</section>
	<section class="waglewagle">
		<header>
		<h2 style="color:black;">개설된 와글 이미지 슬라이드 삽입</h2>
		 <%-- <%@include file="/WEB-INF/view/imgslide.jsp" %> --%>
		</header>
	</section>
	<section class="contact">
		<header>
			<h1>Contact us!<br/>
			wagle@gmail.com</h1>
		</header>
	</section>
	
</body>
</html>