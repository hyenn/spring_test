<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String str = "";
	
	if(dao.duplicateId(id)){
		str = "아이디 중복확인을 하세요.";
		
	}else if(dao.duplicateEmail(email)){
		str = "이메일 중복확인을 하세요.";
	 	
	}else{
		
	%>
		<!-- 리퀘스트를 가지고 이동하는 포워드 -->
		<jsp:forward page="/member/createProc.jsp"/>
		
	<%
		return;
		
	}

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
<h2 style="text-align: center; font-style: oblique;"">아이디 및 이메일 중복확인</h2>

<div class="content">
<%=str %> 
</div> 
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
