<%@page import="wagle.members.MemberDBMybatis"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸��� �ߺ�Ȯ��</title>
</head>
<body>

	<%
		String email = request.getParameter("email");
		MemberDBMybatis dao = MemberDBMybatis.getInstance();
		boolean result = dao.confirmId(email);
		
		if(result){%>
		<center>
		<br/><br/>
		<h4>�̹� ������� �̸��� �Դϴ�.</h4>
		</center>
	<%	}else{ %>
		<center>
		<br/><br/>
		<h4>�Է��Ͻ�  <%=email %>�� ����Ͻ� �� �ִ� �̸����Դϴ�.</h4>
		</center>
	<% 	} %>


</body>
</html>