<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);



	if(flag){
		out.print("사용할 수 없습니다.");
	}else{
		out.print("사용 가능합니다.");
		
	}

%>

