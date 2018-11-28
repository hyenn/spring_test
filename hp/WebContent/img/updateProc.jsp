<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="image.imgDTO"/>
<jsp:useBean id="dao" class="image.imgDAO"/>

<%
	String upDir = application.getRealPath("/img/storage");
	String tempDir = application.getRealPath("/img/temp");
	
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPw(upload.getParameter("pw"));
	
	dto.setNo(Integer.parseInt(upload.getParameter("no")));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	FileItem fileItem = upload.getFileItem("img");
	
	String img = "";
	
	Map map = new HashMap();
	map.put("no", dto.getNo());
	map.put("pw", dto.getPw());
	
	
	boolean pflag = dao.pwCheck(map);
	boolean flag = false;
	
	
	if(pflag){
			
			img = UploadSave.saveFile(fileItem, upDir);
			dto.setImg(img);
			
			flag = dao.update(dto);
					
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
<h2 style="text-align: center; font-style: oblique;">이미지 수정 결과</h2>
 
<div class="content">

<%

	if(pflag==false){
		out.print("비밀번호가 일치하지 않습니다.");
	}else if(flag){
		out.print("이미지를 수정하였습니다.");
	}else{
		out.print("이미지 변경을 실패했습니다.");
	}

%>

</div>
  <DIV class='bottom'>
 
<%if(flag){ %>  
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='목록' onclick="location.href='./list.jsp'">
<%}else{ %>    
    
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='목록' onclick="location.href='./list.jsp'">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='다시시도' onclick="history.back()">

<%} %> 
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
