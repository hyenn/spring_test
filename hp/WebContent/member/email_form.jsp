<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

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

 
<br>
<h2 style="text-align: center; font-style: oblique;">이메일 중복 확인</h2>

<form name="frm" method="post" action="./email_proc.jsp" >

<div class="content">이메일을 입력해주세요</div> 

  <table>
  
  	<tr>
  	 <th>이메일</th>
  	 <td><input type="email" name="email" size="20"></td>
    </tr>
  </table>
  
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='중복확인'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="window.close()">
  </DIV>
</form>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
