<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



  
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    		dateFormat: "yy-mm-dd",
    		minDate:0
    });
  } );
  $( function() {
	$( "#datepicker2" ).datepicker({	
	  		dateFormat: "yy-mm-dd",
			minDate:0
	});
  } );

  </script>



</head>
<body>
	<center>
	<form method="post" enctype="multipart/form-data" action="wagleOpenPro">
		<input type="hidden" name="whost" value="${whost}"/>
		<h4>Wagle Open</h4>
	
			<table class="w3-table-w3-border" cellspacing="10" style="margin-bottom:100px;">
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� �̸�</td>
				<td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text"></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� ����</td>
				<td>${whost}</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� ���� �Ұ�</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wprofile" rows="4" cols="10"></textarea></td>
				</tr> 
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">ī�װ�</td>
				<td>	
					<select  name="wcategory">
					  <option  value="������">������</option>
					  <option  value="����">����</option>
					  <option  value="�丮/����">�丮/����</option>
					  <option  value="�ι���/å">�ι���/å</option>
					</select> 		
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�ִ� �ο�</td>
				<td>
					<select name="wmax">
					  <option  value="15">15��</option>
					  <option  value="16">16��</option>
					  <option  value="17">17��</option>
					  <option  value="18">18��</option>
					  <option  value="19">19��</option>
					  <option  value="20">20��</option>
					</select>
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">����</td>
				<td>
					<input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ �����źϷ� 21">&nbsp;���� &nbsp;&nbsp;
  					<input type="radio" class="w3-radio" name="wloc" value="����Ư���� ������ ������� 132 �ѵ���ǰ���� 8�� �ֿ뱳������">&nbsp;����
				</td>
				</tr>
				<tr>
				
				<td class="w3-panel w3-leftbar w3-border-yellow">�Ⱓ</td>
				<td>
				<input type="text" name="wstart" id="datepicker">&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="text" name="wend" id="datepicker2">
				</td>
				</tr>
				<tr style="width:200px; height:200px">
				<td class="w3-panel w3-leftbar w3-border-yellow">�ͱ� �Ұ�</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="10"></textarea></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">�׷��̹���<br/>���ε�</td>
				<td><input class="w3-input w3-border" name="uploadfile" type="file"></td>
				</tr>
				<tr>
				<td colspan="2" class="w3-center">
				<input class="w3-button w3-yellow w3-border" type="submit" value="Open">
				</td>
				</tr>
			</table>
	</form>	
	</center>
</body>
</html>
