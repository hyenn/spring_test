<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word = "";
	
	//페이징
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	//DB
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	
	map.put("sno", sno);
	map.put("eno", eno);
	
	//dao빈즈 사용
	List<memberDTO> list = dao.list(map);
	int totalRecord = dao.total(map); 
	
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
			
		
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">

	function read(id){
		var url = "<%=root%>/member/read.jsp";
		url = url + "?id=" + id;
		
		location.href = url;
		
	}

</script>

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
 
<br><BR>
<div class="container" style="text-align: center">
<h2 style="font-style: oblique;">회원목록</h2>
<form action="./list.jsp" name="frm" method="post">

<select name="col">

	<option value="mname"
	<%if(col.equals("mname")) out.print("selected");%>
	>이름</option>
	<option value="id"
	<%if(col.equals("id")) out.print("selected"); %>
	>아이디</option>
	<option value="email"
	<%if(col.equals("email")) out.print("selected"); %>
	>이메일</option>
	<option value="total">전체 검색</option>

</select>

<input type="text" name="word" value="<%=word %>">

<button class="w3-white w3-border w3-round-large"><i class="glyphicon glyphicon-search"></i></button>

</form>
 
<%

	for(int i=0; i<list.size(); i++){
		memberDTO dto = list.get(i);

%> 
 
 <TABLE class="w3-table w3-bordered w3-card-4 w3-large">
  
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>
      <a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a>
      </TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD><%=Utility.checkNull(dto.getPhone())%></TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD><%=dto.getEmail() %></TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><%=Utility.checkNull(dto.getZipcode()) %></TD>
    </TR>
    <TR>
      <TH rowspan="2">주소</TH>
      <TD><%=Utility.checkNull(dto.getAddress1()) %></TD>
    </TR>
    <tr>
      <TD><%=Utility.checkNull(dto.getAddress2()) %></TD>
    </tr>
    <tr>
      <th>가입일</th>
      <td><%=dto.getMdate() %></td>
    </tr>
    <br><Br>
  </TABLE>
 
<%} %>
  
  <DIV class='bottom'>
  <%=paging %>
 
  </DIV>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
