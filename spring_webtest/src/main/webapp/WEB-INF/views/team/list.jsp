<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

.search{
margin : 5px auto;
}
</style> 

<script type ="text/javascript">

function del(no){
	//alert(no);
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "delete";
		url = url + "?no=" + no;
		url = url+ "&col=${col}";
		url = url+ "&word=${word}";
		url = url+ "&nowPage=${nowPage}";
		
		location.href=url;
		
	}
}
function update(no){
	//alert(no);
	var url = "update";
	url = url+ "?no=" + no;
	url = url+ "&col=${col}";
	url = url+ "&word=${word}";
	url = url+ "&nowPage=${nowPage}";
	location.href = url;
}
function read(no){
//alert(no); read함수 호출되는지 확인
var url = "read";
url = url + "?no=" + no;
url = url+ "&col=${col}";
url = url+ "&word=${word}";
url = url+ "&nowPage=${nowPage}";
location.href = url; //url 주소에 이동주소를 입력
}

function reply(no){
var url = "reply";
url = url + "?no=" + no;
url = url+ "&col=${col}";
url = url+ "&word=${word}";
url = url+ "&nowPage=${nowPage}";
location.href = url;
	
}
</script>


</head> 
<body> 

<div class= "container">
<h2>팀 목록</h2>
<form method="post" action="list">
<div class="search">
<select name = "col">

<option value = "name" 
<c:if test="${col=='name' }">selected</c:if>
>이름</option>
<option value = "skills"
<c:if test="${col=='skills' }">selected</c:if>
>보유기술</option>
<option value = "total">전체출력</option>
</select>
<input type="text" name = "word" value = "${word}">
<button>검색</button>
<button type="button" onclick="location.href='create'">등록</button>
</div>
</form>

<table class="table table-borderd">
<tr>
	<th>번호</th>
	<th>이름</th>
	<th>성별</th>
	<th>전화번호</th>
	<th>보유기술</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
	<th>수정/삭제/답변</th>
	
</tr>

<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.no}</td>
		<td>
		<c:forEach begin="1" end="${dto.indent }">&nbsp;&nbsp;</c:forEach>
		<c:if test="${dto.indent>0 }">
		<img src = '../images/re.jpg' style='width:30px; height: 25px;'></c:if>
		<a href="javascript:read('${dto.no}')">${dto.name}</a></td>
		<td>${dto.gender}</td>
		<td>${dto.phone}</td>
		<td>${dto.skills}</td>
		<td>${dto.grpno}</td>
		<td>${dto.indent}</td>
		<td>${dto.ansnum}</td>
		<td>
		<a href = "javascript:update('${dto.no}')">수정</a>
		/
		<a href = "javascript:del('${dto.no}')">삭제</a>
		/
		<a href = "javascript:reply('${dto.no}')">답변</a>
		
		</td>
		
	</tr>
		
</c:forEach>
</table>
<div>
${paging}
</div>

</div>
</body> 

</html> 