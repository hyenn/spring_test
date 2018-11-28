<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", pw);
	
	boolean flag = dao.loginCheck(map);
	 
	if(flag){
		String grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		
		Cookie cookie = null;
		
		String c_id = request.getParameter("c_id");
		
		if(c_id != null){
			cookie = new Cookie("c_id", "Y");
			cookie.setMaxAge(120);
			response.addCookie(cookie);
			
			cookie = new Cookie("c_id_val", id);
			cookie.setMaxAge(120);
			response.addCookie(cookie);
		}else{
			cookie = new Cookie("c_id", "");//쿠키 삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
			cookie = new Cookie("c_id_val","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}

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

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>

 
<div class="content">
<%

	if(flag){
		out.print("로그인 성공!<br> 환영합니다 " + id + "님!");
	}else{
		out.print("아이디와 비밀번호를 다시 확인해주세요!");
	}

%>

</div>

<%if(flag){ %>  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>

<%}else{ %>  
    
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='다시시도' onclick="history.back()">
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='아이디/비밀번호 찾기' onclick="location.href='search.jsp'">
 
  </DIV>
<%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
