
<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="fup.fupDTO"/>
<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	int fno = Integer.parseInt(request.getParameter("fno"));
	String fpw = request.getParameter("fpw");
	String oldfile = request.getParameter("oldfile");
	
	
	Map map = new HashMap();
	map.put("fno", dto.getFno());
	map.put("fpw", dto.getFpw());
	
	boolean pflag = dao.pwCh(map); 
	boolean flag = false;
		
	
	if(pflag){
		
		flag = dao.delete(fno);
	}
	String upDir = application.getRealPath("/fup/storage");
	
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
<h2 style="text-align: center; font-style: oblique;">삭제 결과</h2>
 
 <div class="content">
 
 <%
 	if(pflag==false){
 		out.print("비밀번호가 일치하지 않습니다.");
 	}else if(flag){
 		out.print("삭제했습니다.");
 	}else{
 		out.print("삭제 실패했습니다.");
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
