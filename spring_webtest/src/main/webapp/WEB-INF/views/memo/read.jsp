<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function mcreate(){
	var url = "create";
	location.href = url;
}
function mupdate(){
	var url = "update";
	url += "?memono=${dto.memono}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;	
}
function mdelete(){
	var url = "delete";
	url += "?memono=${dto.memono}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}
function mlist(){
	var url = "list"
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}
function mreply(){
	var url = "reply";
	url += "?memono=${dto.memono}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}
</script>

</head> 
<body> 
<div class="container">

<h2>조회</h2>
<table class="table table-bordered">
	<tr>
	<th>제목</th>
		<td>${dto.title}</td>
	</tr>
	<tr>
	<th>내용</th>
		<td>${dto.content}</td>
	</tr>
	<tr>
	<th>조회수</th>
		<td>${dto.viewcnt}</td>
	</tr>
	<tr>
	<th>등록일</th>
		<td>${dto.wdate}</td>
	</tr>
</table>

<br><BR>

	<input type="button" value="등록" onclick="mcreate()">
	<input type="button" value="수정" 
	onclick="mupdate()">
	<input type="button" value="삭제"
	onclick="mdelete()">
	<input type="button" value="목록" onclick="mlist()">
	<button onclick="mreply()">답변</button>
</div>

</body> 
</html> 

