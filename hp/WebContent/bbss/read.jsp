<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbss.bbssDAO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	dao.upView(bbsno);
	bbssDTO dto = dao.read(bbsno);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

	function bup(){
		var url = "updateForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
	}
	
	function bdel(){
		var url = "deleteForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
	}
	
	function blist(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
	}
	
	function brepl(){
		var url = "replyForm.jsp";
		url += "?bbsno=<%=bbsno%>";
		
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
<h2 style="text-align: center; font-style: oblique;">조회</h2>
 
  <TABLE class="w3-table w3-bordered w3-card-4" style="width: 50%;">
    <TR>
      <TH>번호</TH>
      <TD><%=dto.getBbsno() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
    <TR>
      <TH>작성일</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
   <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>글쓴이</TH>
      <TD><%=dto.getBname() %></TD>
    </TR>     
    <TR>
     
      <TD colspan="2" style="text-align: center">
     <%=content %>
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='수정' onclick="bup()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='삭제' onclick="bdel()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='답변' onclick="brepl()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="blist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
