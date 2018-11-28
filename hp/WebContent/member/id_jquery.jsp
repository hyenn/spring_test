<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");

	boolean flag = dao.duplicateId(id);


	if(flag){
		out.print("다른 아이디를 사용해주세요.");
	}else{
		out.print("사용 가능합니다.");
		
	}

%>

