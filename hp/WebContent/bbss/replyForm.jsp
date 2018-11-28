<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbss.bbssDAO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	bbssDTO dto = dao.replyRead(bbsno);
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

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
  
  function incheck(f){
	  if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	    }
  }
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<br> 
<h2 style="text-align: center; font-style: oblique;">답글 쓰기</h2>
 
<FORM name='frm' method='POST' action='./replyProc.jsp' onsubmit="return incheck(this)">

<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">

  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" placeholder="제목을 입력하세요."
      		size="40" required="required" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>글쓴이</TH>
      <TD><input type="text" name="bname" placeholder="이름을 입력하세요."
      		size="40" required="required"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="15" cols="50" placeholder="내용을 입력하세요."
      	name="content" required="required"></textarea>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" placeholder="비밀번호를 입력하세요."
      		size="40" required="required"></TD>
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
