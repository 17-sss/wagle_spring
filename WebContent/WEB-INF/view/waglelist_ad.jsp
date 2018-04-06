<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Insert title here</title>
</head>
<body>
<div>&nbsp;
	<div class="w3-container w3-card w3-center" style="margin: 1% 20% 0 20%;">
	       <span class="w3-center w3-large">
				<h3>������ <b>�ͱ�</b> ����</h3>
		  </span>
	       
	       <c:if test="${count==0}">
	       <div class="w3-container w3-white w3-round w3-margin">
	       		 <div class="w3-center w3-container">
	       			<h4 class="w3-yellow">���µ� �ͱ��� �����ϴ�</h4>
	       		</div>	
	       </div>
	       </c:if>
	       
	       <c:if test="${count!=0}">
	       <div class="w3-container w3-margin w3-white w3-round">
	       		<h6 class="w3-right">��ü �ͱ� ��:${count}</h6>
	       
	       <table class="w3-table w3-bordered" width="175">
	       <tr class="w3-yellow w3-center">
	       <td align="center" width="25" class="w3-center">NUM</td>
	       <td align="center" width="50" class="w3-center">WAGLE</td>
	       <td align="center" width="50" class="w3-center">WHOST</td>
	       <td align="center" width="50" class="w3-center">Modified</td>
	       </tr>
	 
	        <c:forEach var="wagle" items="${waglelist}">
	          <tr height="15">
	          <td align="center" width="25" class="w3-center">${number}</td>
	          <c:set var="number" value="${number-1}" />
	        	    <td align="center" width="50" class="w3-center">${wagle.wname}</td>
	        	    <td align="center" width="50" class="w3-center">${wagle.whost}</td>
	               	<td align="center" width="50" class="w3-center">
	               		
	               		<!-- �ͱ� ���� -->
	               		<form method="post" action="${pageContext.request.contextPath}/admin/wagleform_ad" style="display: inline-block;">
		  					<input type="submit" class="w3-button w3-light-gray w3-hover-white" value="����">
		  					<input type="hidden" name="wboardid" value="${wagle.wboardid}">
						</form>
						
	               	</td>
	          </tr>
	          </c:forEach>
	           
	       </table>
	       
	       <div class = "w3-center w3-white w3-margin">
	       		<c:if test="${count>0}"> 
					<c:if test="${startPage > bottomLine}">
						<a href="waglelist_ad?pageNum=${startPage - bottomLine}">[����]</a>
					</c:if>
		
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="waglelist_ad?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
							<c:if test="${i == currentPage}">
								<font color='blue'>[${i}]</font>
							</c:if>
						</a>
					</c:forEach>
		
					<c:if test="${endPage < pageCount}">
						<a href="waglelist_ad?pageNum=${startPage + bottomLine}">[����]</a>
					</c:if>
				</c:if>
			</div>
			
	     </div>
	     </c:if>
	           
	</div>
</div>

</body>
</html>