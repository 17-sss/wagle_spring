<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd"
    });
  } );
  $( function() {
	    $( "#datepicker2" ).datepicker({
	    dateFormat: "yy-mm-dd",
	    minDate:0
	 });
  } );
  

  </script>
<title>Insert title here</title>
</head>
<body>
	<center>
	<form method="post" enctype="multipart/form-data" action="wagleUpdatePro">
		<h4>Wagle Update</h4>
	
		<input type="hidden" name="whost" value="${wagle.whost}"/>
		<input type="hidden" name="wboardid" value="${wagle.wboardid}"/>
		<input type="hidden" name="name" value="${wagle.filename}"/>
		<input type="hidden" name="size" value="${wagle.filesize}"/>
		<input type="hidden" name="pageNum"	value="${pageNum}"/>
			<table class="w3-table-w3-border" cellspacing="10" style="margin-bottom:100px;">
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� �̸�</td>
				<td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text" value="${wagle.wname}"></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ���</td>
				<td>${wagle.whost}</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ��� �Ұ�</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wprofile" rows="4" cols="10">${wagle.wprofile}</textarea></td>
				</tr> 
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">ī�װ�</td>
				<td>
				
					<select name="wcategory">
					  <option  value="������" <c:if test="${wagle.wcategory eq '������'}"> selected </c:if>> ������</option>
					  <option  value="����" <c:if test="${wagle.wcategory eq '����'}"> selected </c:if>>����</option>
					  <option  value="�丮/����" <c:if test="${wagle.wcategory eq '�丮/����'}"> selected </c:if>>�丮/����</option>
					  <option  value="�ι���/å" <c:if test="${wagle.wcategory eq '�ι���/å'}"> selected </c:if>>�ι���/å</option>
					</select>
					
				 <!-- 
				  <td class="btn-group">
				  <button type="button" name="wcategory" value="������">������</button>
				  <button type="button" name="wcategory" value="����">����</button>
				  <button type="button" name="wcategory" value="�丮/����">�丮/����</button>
				  <button type="button" name="wcategory" value="�ι���/å">�ι���/å</button>
				  <br><br>
				  <button type="button" name="wcategory" value="��ȭ/����">��ȭ/����</button>
				  <button type="button" name="wcategory" value="����/�Ǳ�">����/�Ǳ�</button>
				  <button type="button" name="wcategory" value="�米/�θ�">�米/�θ�</button>
				  <button type="button" name="wcategory" value="����Ȱ��">����Ȱ��</button> -->
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ִ� �ο�</td>
				<td>
					���� ȸ���� ${all}�� /
					<select name="wmax">
					  <option  value="15" <c:if test="${wagle.wmax==15}"> selected </c:if>>15��</option>
					  <option  value="16" <c:if test="${wagle.wmax==16}"> selected </c:if>>16��</option>
					  <option  value="17" <c:if test="${wagle.wmax==17}"> selected </c:if>>17��</option>
					  <option  value="18" <c:if test="${wagle.wmax==18}"> selected </c:if>>18��</option>
					  <option  value="19" <c:if test="${wagle.wmax==19}"> selected </c:if>>19��</option>
					  <option  value="20" <c:if test="${wagle.wmax==20}"> selected </c:if>>20��</option>
					</select>
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">����</td>
				<td>
					<input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ �����źϷ� 21"
					<c:if test="${wagle.wloc eq '����Ư���� ������ �����źϷ� 21'}">checked</c:if>>&nbsp;���� &nbsp;&nbsp;
  					<input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������"
  					<c:if test="${wagle.wloc eq '����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������'}">checked</c:if>>&nbsp;����
				</td>
				</tr>
				<tr>

				
				<c:if test="${today > wagle.wend}">
				<td class="w3-panel w3-leftbar w3-border-yellow" style="color:red"><b>�Ⱓ</b></td>
				</c:if>
				<c:if test="${today <= wagle.wend}">
				<td class="w3-panel w3-leftbar w3-border-yellow">�Ⱓ</td>
				</c:if>
				<td>
				<input type="text" name="wstart" id="datepicker" value="${wagle.wstart}">&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="text" name="wend" id="datepicker2" value="${wagle.wend}">
				</td>
				</tr>
				
				<c:if test="${today > wagle.wend}">
				<tr>
				<td></td>
				<td style="color:red">�Ⱓ�� �÷��ּ��� !</td>
				</tr>
				</c:if>
				
				<tr style="width:200px; height:200px">
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� �Ұ�</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="10">${wagle.wintro}</textarea></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�׷��̹���<br/>���ε�</td>
				<td>
				<img src="/wagle_spring/wagleimg/${wagle.filename}" style="height:300px; width:300px;">
				<br><br>
				<input class="w3-input w3-border" name="uploadfile" type="file"></td>
				</tr>
				<tr>
				<td colspan="2" class="w3-center">
				<button class="w3-button w3-yellow w3-border" type="submit">����</button>
				<a class="w3-button w3-red w3-border" onclick="document.location.href='wagleDelete?wboardid=${wagle.wboardid}'">����</a>
				</td>
				</tr>
			</table>
	</form>	
	</center>
</body>
</html>