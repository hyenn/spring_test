<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);

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

<script type="text/javascript">

	function useEmail(){
		opener.frm.email.value = '<%=email%>';
		self.close();
	}

</script>

</head> 
<!-- *********************************************** -->
<body>

 
<br>
<h2 style="text-align: center; font-style: oblique;">이메일 중복 확인</h2>
 
 <div class="content">
 
입력된 Email: <%=email %><br><Br>

<%

	if(flag){
		out.print("중복입니다. <br><Br>다른 이메일을 사용해주세요.");
	}else{
		out.print("사용 가능합니다.<br><br>");
		out.print("<input type='button' value='사용' onclick='useEmail()'");
	}

%>
</div>

<div class="bottom">

	<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
	type="button" value="다시시도" onclick="location.href='email_form.jsp'">
	<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
	type="button" value="닫기" onclick="window.close()">

</div>

</body>
<!-- *********************************************** -->
</html> 
