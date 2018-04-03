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
			section {
				height: 50vh !important;
	        	overflow: hidden;
	        	background-attachment: fixed;
	        	background-size: cover;
			}
			.div-sec1 {
				height: 28vh !important;
	        	overflow: hidden;
	        	background-attachment: fixed;
	        	background-size: cover;	        
			}

			.custom-font {
				font-family: 'Coustard', serif;
			}

			
	</style>
<title>Insert title here</title>
</head>
<body class="w3-light-gray">

<!-- 그룹 배경 -->
<section class="section_img1" style="background-image:url(/wagle/wagleimg/${wagle.filename};)">
	<header class="w3-center w3-text-white">

	</header>
</section>

<!-- 정보 -->
<div class="div-sec1 w3-white">
	<div class="w3-center">
		<h1><b class="w3-border-yellow w3-bottombar w3-text-black">${wagle.wname}</b></h1>
	</div>
	
	<div class="w3-center" style="margin-top: 2%;">
	
		<div class="w3-center w3-margin" style="display: inline-block;">
			<i class="fa fa-user fa-4x"></i>
			<br>
			<span class="w3-text-gray w3-medium">5/${wagle.wmax}명</span>
		</div>
		&nbsp;
		<div class="w3-center w3-margin" style="display: inline-block;">
			<i class="fa fa-sign-in fa-4x"></i>
			<br>
			<span class="w3-text-gray w3-small">상시 참여 가능</span>
		</div>
		<!-- &nbsp;
		<div class="w3-center w3-margin" style="display: inline-block;">
			<i class="fa fa-diamond fa-4x"></i>
			<br>
			<span class="w3-text-gray w3-small">재료비/예치금</span>
		</div> -->
		&nbsp;
		<div class="w3-center w3-margin" style="display: inline-block;">
			<i class="fa fa-align-justify fa-4x"></i>
			<br>
			<span class="w3-text-gray w3-small">${wagle.wcategory}</span>
		</div>
		
	</div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
	<div class="w3-card w3-white w3-margin">
		<div class="w3-container">
			<h4 class="w3-leftbar w3-border-yellow">
				&nbsp;<b>Wagle 소개</b>
			</h4>
			<hr>
		</div>
		<div class="w3-container">
			<p>
			${wagle.wintro}
			</p>
			<br>
		</div>
	</div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
	<div class="w3-card w3-white w3-margin">
		<div class="w3-container">
			<h4 class="w3-leftbar w3-border-yellow">
				&nbsp;
				<b>와글장 소개</b>
			</h4>
			
			<hr>
		</div>
		<div class="w3-container">
			<p><b>와글장 :</b>${wagle.whost}</p>
			<p>${wagle.wprofile}</p>
			<br>
		</div>
	</div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
	<div class="w3-card w3-white w3-margin">
		<div class="w3-container">
			<h4 class="w3-leftbar w3-border-yellow">
				&nbsp;<b>Wagle 정보</b>
			</h4>
			<hr>
		</div>
		<div class="w3-container">
			<p>
				<b>기간:</b>${wagle.wstart} ~ ${wagle.wend}
				<br>
				<b>지역:</b>${wagle.wloc}
			</p>
			<br>
		</div>
	</div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
	<div class="w3-card w3-white w3-margin">
		<div class="w3-container">
			<h3 class="w3-center">
				&nbsp;&nbsp;<b>Wagle 일정</b>
			</h3>
			<hr>			
		</div>
		
		<div class="w3-container w3-margin-bottom">
			<h5 class="w3-leftbar w3-border-yellow">&nbsp;&nbsp;다가오는 이벤트</h5>
			<img src="<%=request.getContextPath()%>/img/wagle.jpg" alt="wagle-schedule" class="w3-left w3-circle w3-margin-right" style="width: 60px; height: 60px"> 
			<span class="w3-large">2018.04.01~2018.04.08</span>
			<br>
			<span class="w3-medium">1주차: 디자인씽킹 미니 워크숍 </span>
			<br>
			<span class="w3-small w3-text-gray">[러닝 스팟] 쌍용강북교육센터</span>
		</div>
		
		
		<div class="w3-container w3-margin-bottom">
			<img src="<%=request.getContextPath()%>/img/wagle.jpg" alt="wagle-schedule" class="w3-left w3-circle w3-margin-right" style="width: 60px; height: 60px"> 
			<span class="w3-large">2018.04.09~2018.04.16</span>
			<br>
			<span class="w3-medium">2주차: 공감하기 (인터뷰, 설문조사, 직접 체험하기) </span>
			<br>
			<span class="w3-small w3-text-gray">[러닝 스팟] 쌍용강북교육센터</span>
		</div>
		
		
	</div>
</div>


<!-- 후기 -->
<div>
<c:if test="${count==0}">

			후기가 없습니다.
		
</c:if>	

<c:if test="${count!=0}">
<center>
와글 후기 :
<table id="customers" style="width:800px">
  <tr class="w3-blue">
    <td class="w3-yellow" style="width:100px">작성자</td>
    <td class="w3-yellow" style="width:250px" colspan="3">내용</td>
  </tr>
  	<c:forEach var="article" items="${articleList}">
  <tr>
  	<td>${article.writer}</td>
  	<c:if test="${article.writer==name}">
  	<form method="post" action="reviewupdate">
  		 <input type="hidden" name="num" value="${article.num}"/>
  		 <input type="hidden" name="boardid" value="${wagle.wboardid}"/>

  	<td ><input class="w3-input" type="text" placeholder="${article.content}" name="content"></td>
  	<td style="width:10px"><input class="w3-button w3-yellow" type="submit" value="수정"/></td>
  	</form>
  	<td style="width:10px"><button onclick="document.location.href='reviewdelete?num=${article.num}&boardid=${wagle.wboardid}'"class="w3-button w3-yellow">삭제</button></td>
  	</c:if>
  	<c:if test="${article.writer!=name}">
  	<td>${article.content}</td>
  	</c:if>
  </tr>
  	</c:forEach>
  </table>
</center>
<div class="w3-center">
		<c:if test="${count>0}">
			<c:if test="${startPage > bottomLine}">
				<a href="board1?pageNum=${startPage - bottomLine}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="board1?pageNum=${i}">

			<c:if test="${i != currentPage}">[${i}]</c:if>
				<c:if test="${i == currentPage}">
					<font color='red'>[${i}]</font>
				</c:if>
				</a>
			</c:forEach>
		
			<c:if test="${endPage<pageCount}">
			<a href="board1?pageNum=${startPage + bottomLine}">[다음]</a>
			</c:if>
	</c:if>	

</div>  	
</c:if>	
</div>	
<br><br>

<c:if test="${wagler ne 'nosession'}"> 
<c:if test="${sessionScope.name ne wagle.whost}">
	<c:if test="${!chk}">
		<c:if test="${all < wagle.wmax}">
		<div class="w3-center w3-margin-bottom">
		<button class="w3-button w3-center w3-yellow w3-large" onclick="document.location.href='wagleJoin?wboardid=${wagle.wboardid}&wname='+encodeURI('${wagle.wname}')">Wagle 지원하기</button>
		<br><br>
		</div>
		</c:if>
		
		<c:if test="${all >= wagle.wmax}">
		<div class="w3-center w3-margin-bottom">
		<a class="w3-padding-large w3-center w3-yellow w3-large">정원 초과된 와글입니다.</a>
		<br><br>
		</div>
		</c:if>
		
	</c:if>
	
	<c:if test="${chk}">
		<div class="w3-center w3-margin-bottom">
		<a class="w3-padding-large w3-center w3-yellow w3-large">이미 가입한 와글입니다.</a>
		<br><br>
		</div>
	</c:if>
</c:if>
</c:if>



</body>
</html>