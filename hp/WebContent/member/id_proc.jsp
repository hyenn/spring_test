<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");

	boolean flag = dao.duplicateId(id);

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

	function use(){
		opener.frm.id.value='<%=id%>';
		self.close();
	}

</script>

</head> 
<!-- *********************************************** -->
<body>
 
<br>
<h2 style="text-align: center; font-style: oblique;">아이디 중복 확인</h2>
 
<div class="content">

입력된 ID: <%=id %><br><Br>

<%
	if(flag){
		out.print("중복입니다. <br><Br>다른 아이디를 사용해주세요.");
	}else{
		out.print("사용 가능합니다.<br><Br>");
		out.print("<input type='button' value='사용' onclick='use()'");
	}

%>


</div>

  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='닫기' onclick="window.close()">
  </DIV>

 
</body>
<!-- *********************************************** -->
</html> 
