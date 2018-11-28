<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.imgDAO"/>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

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
<h2 style="text-align: center; font-style: oblique;">이미지 삭제</h2>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>

<input type="hidden" name="no" value="<%=request.getParameter("no") %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
  
  <div class="content">
  
  <br><BR>
  이미지 글을 삭제합니다.<br>
  삭제를 원하시면 비밀번호를 입력하세요.
  <br><br>
  
  
  <input type="password" name="pw">
  
  </div> 
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='삭제'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
