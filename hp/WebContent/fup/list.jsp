<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="fup.fupDAO"/>

<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word = "";
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<fupDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript">

function read(fno){
	var url = "read.jsp";
	url += "?fno=" + fno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
}

function fileDown(filename){
	var url = "<%=root%>/download";
	url += "?filename=" + filename;
	url += "&dir=/fup/storage";
	
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
 <h2 style="text-align: center; font-style: oblique;">업로드 목록</h2>
 <BR>
 <form method="post" action="./list.jsp">
 
 <select name="col">
 
 <option value="ftitle"
 <%if(col.equals("ftitle")) out.print("selected"); %>
 >제목</option>
 
 <option value="fname"
 <%if(col.equals("fname")) out.print("selected"); %>
 >작성자</option>
 <option value="total">전체</option> 
 </select>
 
 <input type="text" name="word" value="<%=word %>">
<button class="w3-btn w3-white w3-border w3-border-green w3-round-large"><span class="glyphicon glyphicon-search"></span>찾기</button>
<button class="w3-btn w3-white w3-border w3-border-green w3-round-large" type="button" onclick="location.href='createForm.jsp'">
등록</button>
 </form>
 
 </div>


  <TABLE class="w3-table w3-bordered w3-card-4" style="width: 50%;">
   <thead>
   	<tr>
   		<th>번호</th>
   		<th>제목</th>
   		<th>작성자</th>
   		<th>조회수</th>
   		<th>등록일</th>
   		<th>파일</th>
   	</tr>
   </thead>
   
 <%if(list.size()==0){ %>
   
   <tbody>
   	<tr>
   		<th colspan="6">등록된 글이 없습니다.</th>
   	</tr>   
   </tbody>
   
 <%
 }else{
		for(int i=0; i<list.size(); i++){
			fupDTO dto = list.get(i);
 %>  
    <tbody>
      <tr>
      	<Td><%=dto.getFno() %></Td>
      	<td>
      	<%
      	for(int j=0; j<dto.getIndent(); j++){
      		out.print("&nbsp;&nbsp;");
      	}
      	if(dto.getIndent()>0){
      		out.print("<img src='../images/re.jpg' style='width:20px; height:30px;'>");
      	}
      	%>
      	<a href="javascript:read('<%=dto.getFno() %>')"><%=dto.getFtitle() %></a>
      	<%
      	if(Utility.compareDay(dto.getFdate()))
      		out.print("<img src='../images/new.png' style='width:25px; height:35px;'>");
      	%>
      	</td>
      	<td><%=dto.getFname() %></td>
      	<td><%=dto.getViewcnt() %></td>
      	<td><%=dto.getFdate() %></td>
      	<td>
      	<%if(dto.getFilename()!=null){ %>
      	<a href="javascript:fileDown('<%=dto.getFilename()%>')">
      	<%=dto.getFilename() %>
      	<img src="../images/filedown.png" width=25px height=25px>
      </a>
      	<%
      	}else{
      		out.print("파일없음");
      	}
      	%>
      	</td>
      </tr>	
    </tbody> 
   <%
		}
 }
   %> 
   
  </TABLE>
  
  <DIV class='bottom'>
   <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %> 
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
