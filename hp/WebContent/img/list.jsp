<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.imgDAO"/>


<%

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word="";
	
	int nowPage = 1;
	int recordPerPage = 10;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<imgDTO> list = dao.list(map);
	  
 	int totalRecord = dao.total(map);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

	function read(no){
		url = "read.jsp";
		url += "?no=" + no;
		
		location.href = url;
	}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<style>
.w3-btn {margin-bottom:10px;}
</style>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 

<br>
<div class="container" style="text-align: center">

<h2 style="text-align: center; font-style: oblique;">이미지 목록</h2>
<BR>

<form action="./list.jsp" method="post">

<select name="col">

<option value="name"
<%if(col.equals("name")) out.print("selected"); %>
>작성자</option>

<option value="title"
<%if(col.equals("title")) out.print("selected"); %>
>제목</option>
<option value="total">전체</option>
</select>

<input type="text" name="word" value="<%=word %>">
<button class="w3-btn w3-white w3-border w3-border-green w3-round-large"><span class="glyphicon glyphicon-search"></span>찾기</button>

<button class="w3-btn w3-white w3-border w3-border-green w3-round-large" type="button"
 onclick="location.href='createForm.jsp'">이미지 등록</button><br>

</form>
</DIV>

  <TABLE class="w3-table w3-bordered w3-card-4" style="width: 50%;">
  <thead>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>작성자</TH>
      <TH>등록일</TH>
      <TH>조회수</TH>
   
    </TR>
  </thead>
  
<%if(list.size()==0){ %>  
<tbody>
<tr>
<td style="text-align:center" colspan="5"><Br><Br><BR><BR>
등록된 이미지가 없습니다.<BR><BR><BR><BR><BR>
</td>
</tr>
</tbody>  
<%

}else{
	for(int i=0; i<list.size(); i++){
		imgDTO dto = list.get(i);

%>

<tbody>

<tr>
	<td><%=dto.getNo() %></td>
	<td>
	<a href="javascript:read('<%=dto.getNo()%>')">
	<%=dto.getTitle() %></a></td>
 	<td><%=dto.getName() %></td>
 	<td><%=dto.getMdate() %></td>
 	<td><%=dto.getViewcnt() %></td>
</tr> 	
</tbody>

<%}
	}%>

  </TABLE>
 <div class="bottom">
 <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
 
   
 </div> 
  

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
