<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function listb(){
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
	<h2>글 삭제</h2><BR><BR>
	
	

<c:choose>
	<c:when test="${flag }">
	답글이 존재하여 삭제할 수 없습니다.<br><BR>
	<button onclick="listb()">목록</button>
	</c:when>
	<c:otherwise>
		삭제하면 복구할 수 없습니다.<br><br>
		

<form action="./delete" method="post">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="oldfile" value="${param.oldfile}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	
	
	<input type='password' id='passwd' name='passwd' required/><BR>
	<input type='submit' value='확인'>
	
	
</form>

</c:otherwise>
</c:choose>	

</div>

</body>
</html>