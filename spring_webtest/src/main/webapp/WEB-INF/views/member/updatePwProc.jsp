<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">

function read(){
	var url = "read";
	url = url + "?id=${param.id}";
			
	location.href = url;		
}

</script>


</head> 
<!-- *********************************************** -->
<body>

 <div class="container">
 
<h2>비밀번호 변경</h2>

<c:choose>
	<c:when test="${pflag }">
		<c:choose>
			<c:when test="${flag }">
			비밀번호 변경을 성공했습니다.<br>
			<input type='button' value='나의 정보 확인' onclick="read()">
			</c:when>
		<c:otherwise>
		비밀번호 변경을 실패했습니다.<br>
		<input type='button' value='다시시도' onclick="history.back()">
		</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
	현재 비밀번호가 일치하지 않습니다.<br>
	<input type='button' value='다시시도' onclick="history.back()">
	</c:otherwise>
</c:choose>
 
  </DIV>
 
 
</body>
<!-- *********************************************** -->
</html> 
