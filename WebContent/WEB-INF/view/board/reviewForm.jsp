 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
 <div id="reviewForm" class="w3-modal">
		    <div class="w3-modal-content w3-animate-zoom w3-padding-small" style="max-width:40%">
		      <div class="w3-container w3-padding-small">
		        <span onclick="document.getElementById('reviewForm').style.display='none'" class="w3-button w3-display-topright">&times;</span> 
		       <form method="post" action="reviewinsert?count=${count}">
		       			  <input type="hidden" name="boardid" value="${mylist.wboardid}">
		       			  <input type="hidden" name="num" value="${num}"/>
				  <table align="center" cellspacing="10" class="w3-white w3-padding-large">
				    <c:if test="${sessionEmail != null}">
				    <tr>
				      <td><b>�ۼ���</b>&nbsp;&nbsp;</td>
				      <td><input class="w3-input w3-animate-input" name="writer" style="width:50%" type="text" value="${name}"> </td>
				    </tr>
				    </c:if>
				    <tr>
				      <td><b>����</b>&nbsp;&nbsp;</td>
				      <td><textarea class="w3-input w3-border w3-margin-bottom" name="content" rows="5" cols="50"></textarea></td>
				    </tr>
				    <tr>
				       <td></td>
				       <td class="w3-right">
				       <button type="submit" class="w3-btn w3-round w3-yellow w3-padding-small w3-border w3-border-yellow">�ı� �ۼ�</button>
				       </td>
				    </tr>
				    
				  </table>
				</form>
		      </div>
		    </div>
		  </div>
</body>
</html>
