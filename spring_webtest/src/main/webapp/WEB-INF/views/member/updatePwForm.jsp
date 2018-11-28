<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">

function inCheck(f){

	if(f.oldpw.value==""){
		alert("기존 비밀번호를 입력해주세요.");
		f.oldpw.focus();
		return false;
	}
	if(f.newpw.value==""){
		alert("새로운 비밀번호를 입력해주세요.");
		f.newpw.focus();
		return false;
	}
	if(f.repw.value==""){
		alert("비밀번호를 다시 입력해주세요.");
		f.repw.focus();
		return false;
	}
	if(f.newpw.value != f.repw.value){
		alert("비밀번호가 일치하지 않습니다.");
			f.newpw.focus();
			return false;
	}
}

</script>

</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="container">

<h2>비밀번호 변경</h2>
 
<FORM name='frm' method='POST' action='./updatePwProc'
 onsubmit="return inCheck(this)">

<input type="hidden" name="id" value="${param.id}">


  <TABLE>
   
	<TR>
      <TH>현재 비밀번호</TH>
      <TD><input type="password" name="oldpw"></TD>	
    </TR>
    <TR>
      <TH>변경할 비밀번호</TH>
      <TD><input type="password" name="newpw"></TD>
    </TR>
    
    <TR>
      <TH>비밀번호 확인</TH>
      <TD><input type="password" name="repw"></TD>
    </TR>
  </TABLE>
  
	<br><BR>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
</FORM>
 
  </DIV>
 
</body>
<!-- *********************************************** -->
</html> 
