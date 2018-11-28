<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="image.imgDTO"/>
<jsp:useBean id="dao" class="image.imgDAO"/>

<%
	String upDir = "/img/storage";
	String tempDir = "/img/temp";
	
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String title = UploadSave.encode(upload.getParameter("title"));
	String name = UploadSave.encode(upload.getParameter("name"));
	String content = UploadSave.encode(upload.getParameter("content"));
	String pw = upload.getParameter("pw");
	
	FileItem fileItem = upload.getFileItem("img");
	String img = UploadSave.saveFile(fileItem, upDir);
	
	dto.setTitle(title);
	dto.setName(name);
	dto.setContent(content);
	dto.setPw(pw);
	dto.setImg(img);
	
	boolean flag = dao.create(dto);
	
	if(flag==false){
		UploadSave.deleteFile(upDir, img);
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
<h2 style="text-align: center; font-style: oblique;">이미지 등록 결과</h2>
 
<div class="content">

<%

	if(flag){
		out.print("이미지가 등록되었습니다.");
	}else{
		out.print("이미지 등록을 실패했습니다.");
	}

%>

</div>
 
  <DIV class='bottom'>
<%if(flag){ %>  
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="location.href='./list.jsp'">
<%}else{ %>    
    
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="location.href='./list.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back()">
  </DIV>

<%} %> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
