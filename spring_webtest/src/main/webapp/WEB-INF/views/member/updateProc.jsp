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

function mread(){
	var url = "read";
	url = url + "?id=${param.id}";
	
	location.href = url;
			
}

</script>

</head> 
<!-- *********************************************** -->
<body>
<div class="container">
 
<h2>정보수정</h2>
 
<c:choose>
	<c:when test="${flag }">성공했습니다.<br></c:when>
	<c:otherwise>실패했습니다.<br></c:otherwise>
</c:choose>

    <input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
 

</body>
<!-- *********************************************** -->
</html> 
