<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");
	memberDTO dto = dao.searchPw(id);
	boolean flag = dao.duplicateId(id);
	
	if(flag==false){
		out.print("일치하는 정보가 없습니다. 아이디찾기를 해주세요.");
	}else{
		out.print("회원님의 비밀번호는 " + dto.getPw() + " 입니다."); 
	}

%>

