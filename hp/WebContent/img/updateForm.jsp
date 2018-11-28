<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.imgDAO"/>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	imgDTO dto = dao.read(no);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>

<script type="text/javascript">

	function inputCheck(f){
		if(f.title.value==""){
			alert("제목을 입력해주세요.");
			f.title.focus();
			return false;
		}
		if(f.name.value==""){
			alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력해주세요.");
			f.content.focus();
			return false;
		}
		if(f.img.value==""){
			alert("이미지를 올려주세요.");
			f.img.focus();
			return false;
		}
		if(f.pw.value==""){
			alert("비밀번호를 올려주세요.");
			f.pw.focus();
			return false;
		}
	}

</script> 

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-btn {margin-bottom:10px;}
</style>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>
<h2 style="text-align: center; font-style: oblique;">이미지 수정</h2>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
	enctype="multipart/form-data"
	onsubmit="return inputCheck(this)">
	
<input type="hidden" name="no" value="<%=request.getParameter("no")%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
	
  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="40" value="<%=dto.getTitle() %>"></TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getName() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><input type="text" name="content" size="40"></TD>
    </TR>
    <TR>
      <TH rowspan="2">이미지</TH>
      <td>이미지는 JPG,PNG,GIF 파일만 올려주세요.</TD>
    </TR>
     <tr>
      <TD><input type="file" name="img" accept=".jpg,.png,.gif"
      size="40"></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="pw" size="40"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='수정'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
