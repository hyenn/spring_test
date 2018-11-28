<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>
<jsp:useBean id="dto" class="member.memberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	boolean flag = dao.create(dto);
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
<h2 style="text-align: center; font-style: oblique;">회원가입 처리</h2>
 
<div class="content">

<%

	if(flag){
		out.print("회원가입이 완료되었습니다!");
	}else{
		out.print("회원가입을 실패했습니다.");
	}

%>


</div>

  <DIV class='bottom'>
<%if(flag){ %>  
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='로그인' onclick="location.href='loginForm.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='홈' onclick="location.href='../index.jsp'">
  
<%}else{ %>


    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>

<%} %>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
