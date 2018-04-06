<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
			/* 임시 백그라운드 배경. */
			.bgimg {
				background-image: url("/wagle/img/gray.jpg");
				min-height: 100%;
				background-position: center;
				background-size: cover;
				width: 100%;
				height: 100%;
			}
			/* 이미지 반응형으로 처리.  */
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
				background-image: url(/wagle_spring/img/3.jpg);
			}
			
			/* 수평선 설정  */
			hr {
			    display: block;
			    margin-top: 0.5em;
			    margin-bottom: 0.5em;
			    margin-left: auto;
			    margin-right: auto;
			    border-style: inset;
			    border-width: 1px;
			}
			
			/* 검색 설정 */
			.search1 {
				padding: 8px;
				display: block;
				border: none;
				border-bottom: 1px solid #ccc;
				width: 52%
			}
			/* 밑줄 [따로 적용하기 위함] */
			.underline {
				 width: 300px;
 				 border-bottom: 2px solid currentColor;
 				 border-bottom-color: red;
			}
			/* 밑줄 (빨강) */
			.underline-red {
 				border-bottom-color: red;
			}
			.custom-font {
				font-family: 'Coustard', serif;
			}
			
	</style>
	<title>Wagle List</title>
</head>

<body class="bgimg">

<!-- 설명 -->
<section class="section_img1">
	<header>
		<div class="w3-center w3-text-white">
			<span class="underline underlind-red custom-font" style="font-size: 5em;"><br>Wagle<br></span>
			
			<span style="font-size: 1em;">
             	너네가 알아서<br>보고 와글 들어가거라<br>업데이트 겁나 안되네 똥컴..<br><br><b>기분좋다 ㅎㅎㅎㅎ</b>
           	</span>
		</div>
	</header>
</section>
<!-- end. 설명 -->


<!-- 검색 창 -->
<div class="w3-container"  style="margin-left: 30%; margin-right: 30%;">
	<div class="w3-row w3-section w3-center">
	    <div class="w3-rest">
	      
	      <input class="w3-input w3-small search1"  name="search" type="text" placeholder="Search" style="display: inline-block;">
	      <input class="w3-button w3-yellow w3-small" value="Search" type="button" onclick="#">
	      
	    </div>
	</div>
</div>
<!-- end. 검색 창 -->


<!-- 그룹 사진 리스트 -->
<div class="w3-container w3-margin-top " style="margin-left: 10%; margin-right: 10%;">

	<c:forEach var="waglelist" items="${waglelist}">
		<!-- 기간이 지난 와글은 표시하지 않도록 해준다. -->
	 	<c:if test="${today <= waglelist.wend}">
		 <div class="w3-third w3-container w3-margin-bottom">
			<div class="w3-container w3-white w3-padding w3-center w3-round w3-button w3-border"  style="height:100%; width:100%;" onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')">
				<img src="<%=request.getContextPath()%>/wagleimg/${waglelist.filename}" alt="Test" class="autoimg">
				<h4><b>${waglelist.wname}</b></h4>
				<span class="w3-text-gray">와글 지기 : ${waglelist.whost}</span>
				<div>
					<hr>
					<span class="w3-left">
						<b>기간:&nbsp;</b>
						<span>${waglelist.wstart} ~ ${waglelist.wend}</span>
					</span>
					<i class="fa fa-user w3-right" style="font-size: 13pt;">&nbsp;<span>${waglelist.all}/${waglelist.wmax}</span></i>
				</div>
			</div>
		</div>
		</c:if>
	 </c:forEach>
	 
	 
	
</div>
		
		


</body>
</html>