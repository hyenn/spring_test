<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbss.bbssDAO"/>
<jsp:useBean id="dto" class="bbss.bbssDTO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);

	boolean pflag = dao.PassCheck(map);
	boolean flag = false;
	
	if(pflag){
		flag = dao.delete(bbsno);
	}
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

	function blist(){
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
		out.print("삭제를 실패했습니다.");
	}
%>

</div> 

  <DIV class='bottom'>
  
  <%if(flag){ %>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type="button" value='목록' onclick="blist()">
   <%}else{ %>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type="button" value='목록' onclick="blist()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='다시시도' onclick="history.back()">
    <%} %>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
