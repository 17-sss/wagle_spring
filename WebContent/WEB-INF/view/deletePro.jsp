<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원 탈퇴</title>
</head>
<body>
	<c:if test="${check == 1}">
 		<script language="JavaScript">
		alert("탈퇴가 완료되었습니다.")
		</script>
 		<meta http-equiv="Refresh" content="0;url=/wagle_spring/index">	
	</c:if> 
	<c:if test="${check != 1}">
		<script>
		alert("비밀번호가 맞지 않습니다")
		history.go(-1);</script>
	</c:if>

</body>
</html>