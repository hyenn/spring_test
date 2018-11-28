<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

function blist(){
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href = url;
}

</script>

</head> 
<body> 

<div class="container">

<h2>삭제 확인</h2>

 <c:choose>
 	<c:when test="${flag }">
 	답글이 존재합니다.<br>
 	삭제할 수 없습니다.<br><br>
 	 <input type='button' value='목록' onclick="blist()">
 	</c:when>
 	<c:otherwise>
 	삭제하면 복구할 수 없습니다.<br><br>
	

<form method="post" action="delete">
<input type="hidden" name="memono" value="${param.memono}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

	<input type="submit" value="삭제처리">
</form>

	</c:otherwise>
</c:choose>

</div>


</body> 
</html> 