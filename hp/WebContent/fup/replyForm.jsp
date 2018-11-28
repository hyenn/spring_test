<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="fup.fupDAO"/>


<%
	int fno = Integer.parseInt(request.getParameter("fno"));
	fupDTO dto = dao.replyRead(fno);

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
<h2 style="text-align: center; font-style: oblique;">답글 업로드</h2>
 
<FORM name='frm' method='POST' action='./replyProc.jsp'
	enctype="multipart/form-data">
	
<input type="hidden" name="fno" value="<%=dto.getFno()%>">

<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
	

  <TABLE>
  
    <TR>
      <TH>제목</TH>
      <TD>
      <input type="text" name="ftitle" size="40"
      placeholder="제목을 입력해주세요." value="<%=dto.getFtitle() %>" required/>
      </TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>
      <input type="text" name="fname" size="40"
      placeholder="작성명을 입력해주세요." required/>
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="40" name="fcontent"
      placeholder="내용을 입력해주세요." required></textarea>
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
      placeholder="비밀번호를 입력해주세요." required/>
      </TD>
    </TR>
   
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='등록'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="location.href='list.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
