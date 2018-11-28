<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px;
}
</style>

<script type="text/javascript">
	function read(no) {
		var url = "read";
		url = url + "?no=" + no;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function iupdate(){
		var url = "update";
		url = url + "?no=${dto.no}";
		url = url + "&oldfile=${dto.img}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	function ire(){
		var url = "reply";
		url = url + "?no=${dto.no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	function ilist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	function create(){
		var url = "create";
		url = url + "?no=${dto.no}";
		
		location.href = url;
	}
	function idel(){
		var url = "delete";
		url = url + "?no=${dto.no}";
		url = url + "&oldfile=${dto.img}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	
</script>
</head>
<!-- *********************************************** -->
<body>

<div class="container">

	<h2>조회</h2>

	<TABLE style="width: 70%;">
		<TR>
			<TD colspan="2"><img src="${root }/img/storage/${dto.img}"
				width="100%"></TD>
		</TR>
		<TR>
			<TH>제목</TH>
			<TD>${dto.title}</TD>
		</TR>
		<TR>
			<TH>글번호</TH>
			<TD>${dto.no}</TD>
		</TR>
		<TR>
			<TH>작성자</TH>
			<TD>${dto.name}</TD>
		</TR>
	</TABLE>
	
	<TABLE  class="table table-striped" style="width: 70%; text-align: center;">
		<TR>
			<c:forEach var="i" begin="0" end="4">
				<c:choose>
					<c:when test="${empty files[i] }">
						<td class="td_padding">
						<img src="./storage/default.jpg" style="width:100px; height: 100px;">
						</td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${noArr[i]==dto.no}">
								<td class="td_padding">
								
									<a href="javascript:read('${noArr[i]}')"> 
									<img class="curImg" src="./storage/${files[i]}" style="width:100px; height: 100px;">
								</a></td>
							</c:when>
							<c:when test="${dto.no==-1}">
								<td class="td_padding">
								
									<a href="javascript:read('${noArr[i]}')"> 
									<img src="./storage/default.jpg" style="width:100px; height: 100px;">
								</a></td>
							</c:when>
							
							<c:otherwise>
								<td class="td_padding">
									<a href="javascript:read('${noArr[i]}')"> 
									<img src="./storage/${files[i]}" style="width:100px; height: 100px;">
								</a></td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
		</TR>
	</TABLE>


		<input type='button' value='등록' onclick="create()"> 
		<input type='button' value='목록' onclick="ilist()"> 
		<input type='button' value='수정' onclick="iupdate()"> 
		<input type='button' value='삭제' onclick="idel()"> 
		<input type='button' value='답변' onclick="ire()">


</div>
</body>
<!-- *********************************************** -->
</html>

