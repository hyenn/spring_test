<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>


<%
	String email = request.getParameter("email");
	memberDTO dto = dao.searchId(email);
	boolean flag = dao.duplicateEmail(email);
	
	if(flag==false){
		out.print("일치하는 정보가 없습니다.");
	}else{
		out.print("회원님의 아이디는 " + dto.getId() + " 입니다.");
	}
%>
