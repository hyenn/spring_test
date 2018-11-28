<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="member.memberDAO"/>


<%
	String id = request.getParameter("id");
	String grade = (String)session.getAttribute("grade");
	if(id==null) id = (String)session.getAttribute("id");
	
	memberDTO dto = dao.read(id);

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

<script type="text/javascript">

	function mupdate(){
		var url = "updateForm.jsp";
		url = url + "?id=<%=dto.getId()%>";
		
		location.href = url;
	}
	
	function mdel(){
		var url = "deleteForm.jsp";
		url = url + "?id=<%=dto.getId()%>";
		
		location.href = url;
	}
	
	function mlist(){
		var url = "../admin/list.jsp";
		
		location.href = url;
	}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<Br> 
<h2 style="text-align: center; font-style: oblique;"><%=dto.getMname() %>의 회원 정보</h2>

  <TABLE class="w3-table w3-bordered w3-card-4" style="width: 50%;">
  
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD><%=dto.getId() %></TD>
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
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='정보수정' onclick="mupdate()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='회원탈퇴' onclick="mdel()">

<%    
    if(!id.equals("") && grade.equals("A")){
 %> 
     <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='목록' onclick="mlist()">
     
<% } %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
