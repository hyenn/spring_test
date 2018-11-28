<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

function read(memono){
	//alert(memono);
	var url="./read"; //변수선언. 그냥 var로 함
	url = url+"?memono="+memono; //함수로 받은 memono와 url을 합쳐서 이동. ?memono는 전달받는 memono값
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href=url; //이동
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}


.search{
	margin: 2px auto;
	text-align: center;
}

</style> 

</head> 
<body> 


<div class="search">
<form method="post" action="list">

<select name="col">
<option value="title"
<c:if test="${col=='title' }">selected</c:if>
>제목</option>
<option value="content"
<c:if test="${col=='content' }">selected</c:if>
>내용</option>
<option value="total">전체출력</option>
</select>

<input type="text" name="word" value="${word}">
<button>검색</button>
<button type="button" onclick="location.href='create'">등록</button>
</form>

</div>

<div class="container">
<h2>
<span class="glyphicon glyphicon-th-list"></span>
목록</h2>

<table class="table table-hover">
 <thead>
  <tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>조회수</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
	<th>refnum</th>
  </tr>
 </thead>

<c:choose>
	<c:when test="${empty list }">
	<tbody>
		<tr>
			<td colspan="7">등록된 메모가 없습니다.</td>
		</tr>
	</tbody>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list }">
		<tbody>
		<tr>
			<td>${dto.memono}</td>
			<td>

			<c:forEach begin="1" end="${dto.indent }">&nbsp;&nbsp;</c:forEach>
			<c:if test="${dto.indent>0 }">
			<img src='../images/re.jpg' style='width:25px; height:30px;'>
			</c:if>
			<a href="javascript:read('${dto.memono}')">${dto.title}</a>
			</td>
			
			<td>${dto.wdate}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.grpno}</td>
			<td>${dto.indent}</td>
			<td>${dto.ansnum}</td>
			<td>${dto.refnum}</td>
		</tr>
		</tbody>
	
		</c:forEach>
	</c:otherwise>
</c:choose> 
</table>

${paging}


</div>

</body> 
</html> 
