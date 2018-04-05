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
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 이름</td>
				<td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text"></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 지기</td>
				<td>${whost}</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 지기 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wprofile" rows="4" cols="10"></textarea></td>
				</tr> 
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">카테고리</td>
				<td>	
					<select  name="wcategory">
					  <option  value="스포츠">스포츠</option>
					  <option  value="여행">여행</option>
					  <option  value="요리/음식">요리/음식</option>
					  <option  value="인문학/책">인문학/책</option>
					</select> 		
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">최대 인원</td>
				<td>
					<select name="wmax">
					  <option  value="15">15명</option>
					  <option  value="16">16명</option>
					  <option  value="17">17명</option>
					  <option  value="18">18명</option>
					  <option  value="19">19명</option>
					  <option  value="20">20명</option>
					</select>
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">지역</td>
				<td>
					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 마포구 월드컵북로 21">&nbsp;강북 &nbsp;&nbsp;
  					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터">&nbsp;강남
				</td>
				</tr>
				<tr>
				
				<td class="w3-panel w3-leftbar w3-border-yellow">기간</td>
				<td>
				<input type="text" name="wstart" id="datepicker">&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="text" name="wend" id="datepicker2">
				</td>
				</tr>
				<tr style="width:200px; height:200px">
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="10"></textarea></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">그룹이미지<br/>업로드</td>
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
