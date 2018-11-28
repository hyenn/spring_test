<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.imgDAO"/>

<%
	String upDir = application.getRealPath("/img/storage");

	int no = Integer.parseInt(request.getParameter("no"));
	String pw = request.getParameter("pw");
	String oldfile = request.getParameter("oldfile");
	
	Map map = new HashMap();
	map.put("no", no);
	map.put("pw", pw);
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	
	if(pflag){
		flag = dao.delete(no);
	}
	
	if(flag){
		UploadSave.deleteFile(upDir, oldfile);
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
<h2 style="text-align: center; font-style: oblique;">삭제 결과</h2>
 
  
  <div class="content">
  <%
  if(pflag==false){
	  out.print("비밀번호가 일치하지 않습니다.");
  }else if(flag){
	  out.print("이미지 글이 삭제되었습니다.");
  }else{
	  out.print("이미지 글 삭제를 실패했습니다.");
  }
  %>
  </div> 
  
  <DIV class='bottom'>
  
  <%if(flag){ %>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='이미지 등록' onclick="location.href='./createForm.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='목록' onclick="location.href='./list.jsp'">
   
  <%}else{ %> 
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='다시시도' onclick="history.back()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='목록' onclick="location.href='./list.jsp'">
   
  <%} %> 
    
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
