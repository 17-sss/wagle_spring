<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <!-- sidebar-->
  	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- parallax effect -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/parallax.css">
  
  <!-- wordeffect -->
  	<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css">

  <!-- image slide -->
  	<link href='https://fonts.googleapis.com/css?family=Roboto:100,400,300,500,700' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slide.css">  
   
</head>

<body>
  <!-- <div class="container"> -->
  <section class="background">
    <div class="content-wrapper">
 
	<!-- side nav -->
	
		<div class="w3-container w3-display-left" style="margin-top: 0px;top: 180px;">
		  <div class="w3-dropdown-hover">
		    <button class="w3-button" style="background-color:#FCB043;">
		    	<i class="fa fa-reorder" style="font-size:36px" onclick="document.location.href='#about'"></i>
		    </button>
		    <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-opacity">
		      <a href="#about" class="w3-bar-item w3-button">About Wagle</a>
		      <a href="${pageContext.request.contextPath}/board/wagleOpen" class="w3-bar-item w3-button">와글열기</a>
		      <a href="${pageContext.request.contextPath}/board/waglelist" class="w3-bar-item w3-button">와글와글</a>
		      
		    <div class="w3-bar-item w3-button" onclick="myAccFunc()">
				  My Page <i class="fa fa-caret-down"></i></div>
				  <div id="mypage" class="w3-hide w3-white w3-card-4">
				  <c:if test="${sessionEmail == null}">  
				    <a href="${pageContext.request.contextPath}/member/joinForm" class="w3-bar-item w3-button">Login</a>
				  </c:if>
				  <c:if test="${sessionEmail != null}">
				    <a href="${pageContext.request.contextPath}/board/mylist" class="w3-bar-item w3-button">와글관리</a>
				    <a href="/wagle_spring/member/updateForm?email=${sessionEmail}" class="w3-bar-item w3-button">회원정보</a>
				   	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">Logout</a>
				  </c:if>
			</div>
		      <a href="${pageContext.request.contextPath}/board/faqlist" class="w3-bar-item w3-button">FAQ</a>
		      
		      
		    </div>
		  </div>
		</div>

      <h1>
      	<br>Wagle
		  <br>&nbsp;Wagle
	  </h1>
		<i class="fa fa-angle-double-down" style="font-size:48px; color:#eb4a2c;"></i>
		
    </div>
  </section>
  
  
  <section class="background">
    <div class="content-wrapper" id="about">
      <p class="content-title w3-display-topmiddle" style="margin-top: 200px;font-size: 7vh;">together is better</p>
		     <div class="w3-display-middle" style="width:40%; max-width:500px; margin-top:80px;">
		    	<img src="${pageContext.request.contextPath}/img/together.jpg" alt="Norway" style="width:100%;">
			 </div>
	  	   <p class="content-subtitle w3-display-bottommiddle" style="margin-bottom:100px;">
	  	   		비슷한 관심사와 가치관을 나눌 수 있는 소통의 공간<br/>
	  	   		원하는 것을 배울 수 있는 자유<br/>
	  	   		함께 만들어가는 커뮤니티 </p>
	      <button class="w3-btn w3-display-bottommiddle" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
	      style="width: 20%;">와글과 함께 하실래요?</button>

    </div>
  </section>
  
  
  <section class="background">
    <div class="content-wrapper">
      <p class="content-title">워드클라우드</p>
      <p class="content-subtitle">관심사 카테고리</p>
     
      <button class="w3-btn w3-display-middle" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOpen'"
      style="width: 20%; margin-top: 240px;">와글지기가 되어주세요!</button>
      
    </div>
  </section>
  
  
  <section class="background">
    <div class="content-wrapper">
    
      <!-- image slide  -->
      <div align="center" class="fond">
          <div class="contener_slideshow" style="margin-top: 100px;">
          <div class="contener_slide">
           <c:forEach var="imgslide" items="${imgslide}">
                       <div class="slid_${number}"><a onclick="document.location.href='wagleContent?wboardid=${imgslide.wboardid}&wname='+encodeURI('${imgslide.wname}')">
              <c:set var="number" value="${number-1}"/>
              <img src="/wagle_spring/wagleimg/${imgslide.filename}" style="width:610px; height:300px;"></a></div>
          </c:forEach> 


          </div>
        </div>                                                                                                                                       
      </div>
     
      <button class="w3-btn w3-display-middle" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist'" 
      	style="width: 20%; margin-top: 240px;">와글리스트 더보기</button>
    </div>
  </section>



  	<script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>
	<script src='https://code.jquery.com/jquery-2.1.4.min.js'></script>
    <script  src="${pageContext.request.contextPath}/js/parallax.js"></script>
	<script>
	function myAccFunc() {
	    var x = document.getElementById("mypage");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-green";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-green", "");
	    }
	}

	</script>
</body>

</html>
