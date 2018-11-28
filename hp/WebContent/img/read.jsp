<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="image.imgDAO" />

<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	dao.upViewcnt(no);
	imgDTO dto = dao.read(no);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">


	function read(no) {
		var url = "./read.jsp";
		url += "?no=" + no;

		location.href = url;
	}
	function iupdate() {
		var url = "updateForm.jsp";
		url += "?no=<%=dto.getNo()%>";
		url += "&oldfile=<%=dto.getImg()%>"

		location.href = url;
	}

	function idel() {
		var url = "deleteForm.jsp";
		url += "?no=<%=dto.getNo()%>";
		url += "&oldfile=<%=dto.getImg()%>"

		location.href = url;
	}
</script>

<style type="text/css">
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

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-btn {margin-bottom:10px;}
</style>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
<br>
<br>
	

	<TABLE class="w3-table w3-bordered w3-card-4" style="width: 50%;">
		<tr>
			<td colspan="2" style="text-align: center"><img
				src="./storage/<%=dto.getImg()%>" width="80%"></td>
		</tr>
		<TR>
			<TH>번호</TH>
			<TD><%=dto.getNo()%></TD>
		</TR>
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH>작성자</TH>
			<TD><%=dto.getName()%></TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD><%=dto.getContent()%></TD>
		</TR>
		<TR>
			<TH>작성일</TH>
			<TD><%=dto.getMdate()%></TD>
		</TR>
	</TABLE>
<br>
	<table class="w3-table w3-bordered w3-card-4" style="width: 50%;">

		<tr>
			<%
				List list = dao.imgRead(no);
				int[] noArr = (int[]) list.get(0);
				String[] files = (String[]) list.get(1);

				for (int i = 0; i < 5; i++) {
					if (files[i] == null) {
					
			%>
			<td class="td_padding" style="text-align: center">
			<img src="../images/default.jpg" width="150px" border="0">
			</td>
			<%
				} else{
					if (noArr[i] == no) {
						
			%>
			<td class="td_padding" style="text-align: center">
			<a href="javascript:read('<%=noArr[i]%>')"> 
			<img class="curImg"	src="./storage/<%=files[i]%>" width="170px" border="0">
			</a></td>

			<%
					}else {
			%>

			<td class="td_padding" style="text-align: center"><a
				href="javascript:read('<%=noArr[i]%>')"> <img
					src="./storage/<%=files[i]%>" width="170px" border="0">
			</a></td>

			<%
					}
				}
			}
			%>
		
	</table>

	<DIV class='bottom'>
		<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='수정' onclick="iupdate()"> 
		<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='삭제' onclick="idel()"> 
		<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
			type='button' value='목록' onclick="location.href='./list.jsp'">
	</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
