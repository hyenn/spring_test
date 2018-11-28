<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	int fno = Integer.parseInt(request.getParameter("fno"));

	dao.upView(fno);
	fupDTO dto = dao.read(fno);
	
	String content = dto.getFcontent();
	content = content.replace("\r\n", "<br>");

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

function fupdate(){
	var url = "updateForm.jsp";
	url += "?fno=<%=fno %>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href = url;
}

function fdel(){
	var url = "deleteForm.jsp";
	url += "?fno=<%=fno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	url += "&oldfile=<%=dto.getFilename()%>";
	
	location.href = url;
}

function freply(){
	var url = "replyForm.jsp";
	url += "?fno=<%=fno%>";
	
	location.href = url;
}

function flist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href = url;
}

function fileDown(){
	var url = "<%=root%>/download";
	url += "?filename=<%=dto.getFilename()%>";
	url += "&dir=/fup/storage";
	
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
      <TD><%=dto.getFno() %></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getFtitle() %></TD>
    </TR>
    <TR>
      <TH>작성자</TH>
      <TD><%=dto.getFname() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=content %></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD>
      <% if(dto.getFilename()!=null){ %>
     
      <a href="javascript:fileDown()">
      	<img src="../images/filedown.png" width=25px height=25px>
      
       <%=dto.getFilename() %>
      <%out.print("("+dto.getFilesize()/1024+"KB"+")");%>
      </a>
      
     <% }else{ %>
    	  out.print("파일없음");
     <%  }%>
     
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='수정' onclick="fupdate()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='삭제' onclick="fdel()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='답변' onclick="freply()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="flist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
