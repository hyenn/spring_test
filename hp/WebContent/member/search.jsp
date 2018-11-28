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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<script type="text/javascript">

$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});

	function searchId(email){
		
		if(frm.email.value==""){
			alert("이메일을 입력해주세요.");
			frm.email.focus();
			
			return false;
			
		}else{
		
			var url = "Esearch_jquery.jsp";
			
			$.ajax({
				url:url,
				dataType:'text',
				data:{"email":email},
				success:function(data){
					$("#emailcheck").text(data.trim()).css("color","blue");
				
				}
				
			});
		}
	}
	
	function searchPw(id){
		
		if(frm.id.value==""){
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			
			return false;
			
		}else{
		
			var url = "Psearch_jquery.jsp";
			
			$.ajax({
				url:url,
				dataType:'text',
				data:{"id":id},
				success:function(data){
					$("#idcheck").text(data.trim()).css("color","blue");
				}
			});
		}
	}

</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>
<h2 style="text-align: center; font-style: oblique;">아이디/비밀번호 찾기</h2>
<br>

<form name='frm' method='post'>
 
  <TABLE>
    <TR>
      <TH>아이디 찾기</TH>
      <TD>
      	<input type="email" name="email" placeholder="가입시 입력한 이메일을 입력하세요." size="35" required autofocus/>
      	<input type="button" value="확인" onclick="searchId(document.frm.email.value.trim())">
      </TD>
    </TR>
  </TABLE>
  <div id="emailcheck" style="text-align: center"></div>
  <br><br>
  
  <TABLE>
    <TR>
      <TH>비밀번호 찾기</TH>
      <TD>
      	<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
      	type="text" name="id" placeholder="아이디를 입력하세요." size="35" required/>
      	<input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
      	type="button" value="확인" onclick="searchPw(document.frm.id.value.trim())">
      </TD>
    </TR>
  </TABLE>
 	 <div id="idcheck" style="text-align: center"></div>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" 
    type='button' value='로그인' onclick="location.href='loginForm.jsp'">
  </DIV>
 </form>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
