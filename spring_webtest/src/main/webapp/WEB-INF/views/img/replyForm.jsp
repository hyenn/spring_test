<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

 
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
</style> 

<script type="text/javascript">

	function ilist(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}

</script>

</head> 
<!-- *********************************************** -->
<body>

<div class="container">
<h2>답변</h2>
 
<FORM name='frm' method='POST' action='./reply'
enctype="multipart/form-data">
<input type = "hidden" name = "no" value = "${dto.no}">

<input type = "hidden" name = "grpno" value = "${dto.grpno}">
<input type = "hidden" name = "indent" value = "${dto.indent}">
<input type = "hidden" name = "ansnum" value = "${dto.ansnum}">

<input type = "hidden" name = "col" value = "${param.col}">
<input type = "hidden" name = "word" value = "${param.word}">
<input type = "hidden" name = "nowPage" value = "${param.nowPage}">


  <TABLE class="table table-bordered">
    <TR>
      <TH>성명</TH>
      <TD><input type = "text" name = "name"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type = "text" name = "title" value = "${dto.title}"></TD>
    </TR>
    <TR>
      <TH>사진파일</TH>
      <TD><input type = "file" name = "imgMF" accept=".jpg,.png,.gif"></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type = "password" name = "passwd"></TD>
    </TR>
  </TABLE>
  
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="ilist()">
</FORM>
  </DIV>
 
</body>
<!-- *********************************************** -->
</html>