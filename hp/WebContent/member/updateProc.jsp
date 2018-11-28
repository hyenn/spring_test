<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>
<jsp:useBean id="dto" class="member.memberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	boolean flag = dao.update(dto);
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

	function mread(){
		var url = "read.jsp";
		url = url + "?id=<%=dto.getId()%>";
		
		location.href = url;
	}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>
<h2 style="text-align: center; font-style: oblique;">처리 결과</h2>

<div class="content">
<%

	if(flag){
		out.print("정보를 수정했어요!");
	}else{
		out.print("문제가 생겼어요!");
	}

%>
 </div>  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='정보확인' onclick="mread()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
