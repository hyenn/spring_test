<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
function incheck(f){
	if(f.wname.value==""){
		alert("이름을 입력하세요");
		f.wname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
	
}

</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

</head> 
<!-- *********************************************** -->
<body>


<div class="container">
<h2>답변등록</h2>
 
<FORM name='frm' method='POST' action='./reply'
		onsubmit="return incheck(this)" enctype="multipart/form-data">

<!-- 답변있는 부모글 삭제 방지 -->
<input type="hidden" name="bbsno" value="${dto.bbsno}">

<!-- 답변에 필요한 부모 자료들 -->
<input type="hidden" name="grpno" value="${dto.grpno}">
<input type="hidden" name="indent" value="${dto.indent}">
<input type="hidden" name="ansnum" value="${dto.ansnum}">

<!-- 목록으로 가기위한 페이징 유지 -->
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

  <TABLE class="table table-bordered">
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="${dto.title}"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록' 
    	onsubmit="return incheck(this)">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</div> 
</body>
<!-- *********************************************** -->
</html> 
