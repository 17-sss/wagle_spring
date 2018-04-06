<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Wagle - Userlist</title>
</head>
<body>
<div>&nbsp;
	<div class="w3-container">
	       <c:if test="${count==0}">
	       <div class="w3-container w3-white w3-round w3-margin">
	          	<h3 class="w3-center">전체 회원 수:${count}</h3>
	       		 <div class="w3-center w3-container">
	       			<p class="w3-yellow">회원이 없습니다....</p>
	       		</div>	
	       </div>
	       </c:if>
	       
	       <c:if test="${count!=0}">
	       <div class="w3-container w3-margin w3-white w3-round w3-hover-shadow">
	       		<h3 class="w3-center">전체 회원 수:${count}</h3>
	       
	       <table class="w3-table w3-bordered" width="500">
	       <tr class="w3-yellow w3-center">
	       <td align="center" width="25">NUM</td>
	       <td align="center" width="50">EMAIL</td>
	       <td align="center" width="50">PASSWORD</td>
	       <td align="center" width="50">NAME</td>
	       <td align="center" width="50">GENDER</td>
	       <td align="center" width="50">AGE</td>
	       <td align="center" width="50">LOCATE</td>
	       <td align="center" width="50">REGDATE</td>
	       <td align="center" width="50">Modified</td>
	       </tr>
	 
	        <c:forEach var="member" items="${memberlist}">
	          <tr height="15">
	          <td align="center" width="25">${number}</td>
	          <c:set var="number" value="${number-1}" />
	        	    <td align="center" width="50">${member.email}</td>
	        	    <td align="center" width="50">${member.pwd}</td>
	          		<td align="center" width="50">${member.name}</td>
	             	<td align="center" width="50">${member.gender}</td>
	             	<td align="center" width="50">${member.age}</td>
	                <td align="center" width="50">${member.loc}</td>
	                <td align="center" width="50">${member.regdate}</td>
	               	<td align="center" width="50">
	               		
	               		<!-- 수정 삭제 만들기  -->
	               		<form method="post" action="${pageContext.request.contextPath}/member/updateForm" style="display: inline-block;">
		  					<input type="submit" class="w3-button w3-light-gray w3-hover-white" value="수정">
		  					<input type="hidden" name="email" value="${member.email}">
							<input type="hidden" name="num" value="${member.num}">
						</form>
	  					
						
						<form method="post" action="${pageContext.request.contextPath}/member/deleteForm" style="display: inline-block;">
							<input type="submit" class="w3-button w3-yellow w3-hover-white" value="삭제" >
							
							<!-- hidden으로 email, pwd가져오기!!!  -->
		               		<input type="hidden" name="email" value="${member.email}">
							<input type="hidden" name="pwd" value="${member.pwd}">
							<input type="hidden" name="num" value="${member.num}">
		               		<!--  -->
	               		</form>
	               	</td>
	          </tr>
	          </c:forEach>
	           
	       </table>
	       
	       <div class = "w3-center w3-white w3-margin">
	       		<c:if test="${count>0}"> 
					<c:if test="${startPage > bottomLine}">
						<a href="memberlist?pageNum=${startPage - bottomLine}">[이전]</a>
					</c:if>
		
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="memberlist?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
							<c:if test="${i == currentPage}">
								<font color='blue'>[${i}]</font>
							</c:if>
						</a>
					</c:forEach>
		
					<c:if test="${endPage < pageCount}">
						<a href="memberlist?pageNum=${startPage + bottomLine}">[다음]</a>
					</c:if>
				</c:if>
			</div>
			
	     </div>
	     </c:if>
	           
	</div>
</div>
</body>
</html>