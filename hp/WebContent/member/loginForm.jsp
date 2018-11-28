<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<%
	String c_id = ""; //id저장 여부 저장
	String c_id_val = ""; //id값
	
	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;
	
	if(cookie != null){
		for(int i = 0; i < cookies.length; i++){
			cookie = cookies[i];
			
			if(cookie.getName().equals("c_id")){
				c_id = cookie.getValue();
			}else if(cookie.getName().equals("c_id_val"))
				c_id_val = cookie.getValue();
		}
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

<br><BR> 
<DIV class="w3-panel w3-border-bottom w3-border-green" style="width: 10%; text-align: center; margin-left: 45%;
font-size: 30px;">로그인</DIV>
<br>
 
<FORM name='frm' method='POST' action='<%=root %>/member/loginProc.jsp'>

  <TABLE style="width: 30%;">
    <TR>
      <TH>ID</TH>
      <TD><input type="text" name="id" value="<%=c_id_val%>" required/>
      
   <%
   	if(c_id.equals("Y")){
   %>   
   <input type="checkbox" name="c_id" value="Y" checked="checked">ID저장
   <%
   	}else{
   %>
   <input type="checkbox" name="c_id" value="Y">ID저장
   <%} %>
      
      </TD>
    </TR>
    <TR>
      <TH>Password</TH>
      <TD><input type="password" name="pw" required/></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='로그인'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='아이디/비밀번호 찾기' onclick="location.href='search.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='회원가입' 
    onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
