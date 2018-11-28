<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function tlist(){
	var url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>
</head> 
<body> 

<div class="container">

<h2>처리결과</h2>

<c:choose>
	<c:when test="${dflag }">답변글이 있어서 삭제할 수 없습니다.</c:when>
	<c:when test="${flag }">삭제하였습니다.</c:when>
	<c:otherwise>삭제를 실패하였습니다.</c:otherwise>
</c:choose>

<br>
<button onclick="tlist()">목록</button>
</div>

</body> 
</html> 