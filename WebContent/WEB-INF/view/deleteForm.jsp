<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String ctx = request.getContextPath(); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Wagle Ż��</title>
	<script type="text/javascript">
		function Acheck() {
			if (document.deleteFormA.pwd.value != document.deleteFormA.sessionPwd.value) {
				alert("������ ��й�ȣ�� Ȯ���ϼ���.");
				return false;
			}
		}
	</script>
	
	
</head>
<body><!-- <body style="margin-top: 200px;"> -->
<div class="w3-container" style="margin-top: 13%;">
<!-- <p class="w3-left" style="padding-left: 30px;"></p> -->
<center>
<div class="w3-container w3-border w3-card w3-round w3-padding-32" style="margin: 0% 20% 0% 20%;">
<c:if test="${sessionEmail ne 'admin'}">
<h3><b>Wagle�� Ż���Ͻðڽ��ϱ�?</b></h3><br>
</c:if>
<c:if test="${sessionEmail eq 'admin'}">
<h3><b>${email} ����� �����Ͻðڽ��ϱ�?</b></h3><br>
</c:if>
<c:if test="${sessionEmail ne 'admin'}">
<form method="post" name="deleteForm" action="deletePro?email=${sessionEmail}" onsubmit="return deleteSave()">
</c:if>
<c:if test="${sessionEmail eq 'admin'}">
<form method="post" name="deleteFormA" action="deletePro?email=${email}" onSubmit="return Acheck()">
</c:if>
				
				<table class="table-bordered" width="190">
					<tr height="30">
						<td align="center"><b>��й�ȣ�� �Է��� �ּ���.</b></td>
					</tr>
					<tr height="30">
					
						<td align="center">
							<c:if test="${sessionEmail eq 'admin'}">
							������ ��й�ȣ: <input type="password" name="pwd" size="8" maxlength="12" > 
							<input type="hidden" name="sessionPwd" value="${sessionPwd}">
							
							<input type="hidden" name="email" value="${email}">
							</c:if>
							
							<c:if test="${sessionEmail ne 'admin'}">
							��й�ȣ: <input type="password" name="pwd" size="8" maxlength="12"> 
							<input type="hidden" name="email" value="${sessionEmail}">
							</c:if>
							
						</td>
					</tr>
					<tr height="30">
						<td align="center">
						<c:if test="${sessionEmail ne 'admin'}">
							<input type="submit" value="Ż��" class="w3-button w3-amber w3-round"> 
							<input type="button" value="���" class="w3-button w3-amber w3-round" onclick="document.location.href='updateForm?email=${sessionEmail}'">
						</c:if>
						<c:if test="${sessionEmail eq 'admin'}">
							<input type="submit" value="����" class="w3-button w3-amber w3-round"> 
							<input type="button" value="���" class="w3-button w3-amber w3-round" onclick="document.location.href='${pageContext.request.contextPath}/admin/memberlist'">
						</c:if>
						</td>
					</tr>
				</table>
				
			</form>
</div>

</center>
</div>
</body>
</html>