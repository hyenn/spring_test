<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbss.bbssDAO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = dao.CheckRefnum(bbsno);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

	function blist(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
	}
	
</script>

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
<h2 style="text-align: center; font-style: oblique;">삭제</h2>

<%if(flag){ %>
<div class="content">
답글이 있어 삭제할 수 없습니다.<br>

  </DIV>
<DIV class='bottom'>
    <input type="button" value='목록' onclick="blist()">
</div>

<%}else{ %>

<div class="content">
삭제하면 복구할 수 없습니다.<br>
삭제를 원하시면 비밀번호를 입력하세요.<br><br>
</div>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="bbsno" value="<%=bbsno%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

  <TABLE>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" size="40"
      placeholder="등록시 입력하셨던 비밀번호를 입력하세요." required="required"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='삭제'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="blist()">
  </DIV>
</FORM>
<%} %> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
