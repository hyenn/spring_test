<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", pw);
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	if(pflag){
		flag = dao.delete(id);
		
		session.invalidate();
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
<h2 style="text-align: center; font-style: oblique;">탈퇴처리</h2>

<div class="content"> 
<%
	if(pflag==false){
		out.print("비밀번호가 일치하지 않습니다.");
	}else if(flag){
		out.print("회원탈퇴가 되었습니다.<br>다음에 뵈어요!");
	}else{
		out.print("오류가 생겼어요!<br>다시 시도해주세요!");
	}

%>
</div>  
  <DIV class='bottom'>
  
 <%if(flag){ %> 
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='홈' onclick="location.href='../index.jsp'">
    
 <%}else{ %> 
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='홈' onclick="location.href='../index.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='다시시도' onclick="history.back()">
 <%} %> 
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
