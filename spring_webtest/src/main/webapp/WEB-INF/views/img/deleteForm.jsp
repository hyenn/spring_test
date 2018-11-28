<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
.bottom{
margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 

<script type="text/javascript">
function read(){
	var url="read";
	url += "?no=${param.no}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
			
	location.href=url;
}
</script>
</head> 
<body> 

<div class="container">

<h2>삭제</h2>

<c:choose>
	<c:when test="${flag }">
	답글이 있어 삭제할 수 없습니다.<br>
	<button type="button" onclick="read()">취소</button>
	</c:when>
	<c:otherwise>
	삭제하시면 복구할 수 없습니다.<br>
	
<form name="frm" method="post" action="./delete">
<input type="hidden" name="no" value="${param.no}">
<input type="hidden" name="oldfile" value="${param.oldfile}">

<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<input type="password" name="passwd">
<button type="submit">삭제</button>

</form>

</c:otherwise>
</c:choose>

</div>

</body> 
</html> 