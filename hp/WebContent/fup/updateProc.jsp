<%@page import="utility.UploadSave"%>
<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="fup.fupDTO"/>
<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	String upDir = application.getRealPath("/fup/storage");
	String tempDir = application.getRealPath("/fup/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	dto.setFtitle(UploadSave.encode(upload.getParameter("ftitle")));
	dto.setFcontent(UploadSave.encode(upload.getParameter("fcontent")));
	dto.setFpw(upload.getParameter("fpw"));
	dto.setFno(Integer.parseInt(upload.getParameter("fno")));
	
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = "";
	
	Map map = new HashMap();
	map.put("fno", dto.getFno());
	map.put("fpw", dto.getFpw());
	
	boolean pflag = dao.pwCh(map); 
	boolean flag = false;
		
	
	if(pflag){
		
		filename = UploadSave.saveFile(fileItem, upDir);
							
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
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

<script type="text/javascript">

	function flist(){
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
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
<h2 style="text-align: center; font-style: oblique;">업로드 수정 결과</h2>
 
 <div class="content">
 
 <%
 	if(pflag==false){
 		out.print("비밀번호가 일치하지 않습니다.");
 	}else if(flag){
 		out.print("업로드 수정에 성공했습니다.");
 	}else{
 		out.print("업로드 수정에 실패했습니다.");
 	}
 
 %>
 
 </div>

  <DIV class='bottom'>
  <%if(flag){ %>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="flist()">
  <%}else{ %>  
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back()">
  <%} %>  
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
