<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	if(id==null) id = (String)session.getAttribute("id");

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
<h2 style="text-align: center; font-style: oblique;">회원탈퇴</h2>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id %>">

 <div class="content">
 정말 탈퇴하시나요??
 <br><br>
 비밀번호를 입력해주세요.<br>
 <input type="password" name="pw">
 
 </div>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='확인'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
