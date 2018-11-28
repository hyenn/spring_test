<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function incheck(f){
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
}
</script>
</head> 
<body> 

<div class="container">

<h2>답변 등록</h2>
<form name = "frm" method="post" action="./reply"
onsubmit="return incheck(this)"> 

<input type="hidden" name="memono" value="${dto.memono}">

<input type="hidden" name="grpno" value="${dto.grpno}">
<input type="hidden" name="indent" value="${dto.indent}">
<input type="hidden" name="ansnum" value="${dto.ansnum}">

<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">


<table class="table table-bordered">
<tr>
	<th>제목</th>
		<td>
		<input type="text" name="title" size="38" value="${dto.title}"/>
		</td>
</tr>
<tr>
	<th>내용</th>
		<td>
		<textarea rows="10" cols="38" name="content"></textarea>
		</td>
</tr>
</table>

	<input type="submit" value="전송">
</form>
</div>

</body> 
</html> 