<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	int fno = Integer.parseInt(request.getParameter("fno"));
	fupDTO dto = dao.read(fno);
	
	String content = dto.getFcontent().replace("&nbsp", "<BR>");
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
<h2 style="text-align: center; font-style: oblique;">업로드 수정</h2>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
	enctype="multipart/form-data">

<input type="hidden" name="fno" value="<%=dto.getFno() %>">
<input type="hidden" name="oldfile" value="<%=dto.getFilename()%>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">



  <TABLE>
  
    <TR>
      <TH>제목</TH>
      <TD>
      <input type="text" name="ftitle" size="40"
      value="<%=dto.getFtitle() %>" required/>
      </TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>
      <%=dto.getFname() %>
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="40" name="fcontent" required>
      <%=content %></textarea>
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD>
      <input type="file" name="filename" required/>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD>
      <input type="password" name="fpw" size="40"
      placeholder="입력하셨던 비밀번호를 입력해주세요." required/>
      </TD>
    </TR>
   
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='수정'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
