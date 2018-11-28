<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	int fno = Integer.parseInt(request.getParameter("fno"));
	boolean flag = dao.checkRefnum(fno);
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
<h2 style="text-align: center; font-style: oblique;">업로드 삭제</h2>

<%if(flag){ %>
<div class="content">
답글이 존재합니다.<br>
삭제할 수 없습니다.

</div>

<div class="bottom">
<input type="button" value="목록" onclick="flist()">
</div>

<%}else{ %>

<div class="content">
삭제하면 복구할 수 없습니다.<br>

</div>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>

<input type="hidden" name="fno" value="<%=fno %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">



  <TABLE>
  
    
    <TR>
      <TH>비밀번호</TH>
      <TD>
      <input type="password" name="fpw" size="40"
      placeholder="입력하셨던 비밀번호를 입력해주세요." required/>
      </TD>
    </TR>
   
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='확인'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
</FORM>
 <%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
