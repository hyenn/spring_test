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

</head> 
<!-- *********************************************** -->
<body>
 
 <div class="container">
 
<h2>회원탈퇴</h2>
 
<FORM name='frm' method='POST' action='./delete'>

<input type="hidden" name="id" value="${id}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">



탈퇴를 하시면 더 이상 컨텐츠를 제공받을 수 없습니다.<br>
정말 탈퇴하시겠습니까?<br><br>


    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
</FORM>
 
  </DIV>
 
</body>
<!-- *********************************************** -->
</html> 
