<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">

	function use(){
		opener.frm.email.value = document.frm.email.value;
		self.close();
		
	}

	function emailCheck(email){
		//alert(email);
		if(email==""){
			alert("이메일을 입력하세요.");
			document.frm.email.focus();
			
		}else{
			var url = "emailCheck";
			
			$.ajax({
				url:url,
				dataType:'text',
				type:"get",
				data:{"email":email},
				success:function(data){
					$("#emailresult").text(data.trim()).css("color","red");
					
					if(data.trim().indexOf("사용 가능")!=-1){
						$("#emailresult").append("<button onclick='use()'>사용</button>")
						
					}
					
				}
			});
			
		}
	}
	
	
</script>

</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
 <div class="container">
 
<h2>Email중복 확인</h2>
 
<FORM name='frm'>

<div>Email을 입력해주세요</div>

<br>

  <TABLE class="table table-borderd">
    <TR>
      <TH>이메일</TH>
      <TD><input type="email" name="email" size="20"></TD>
    </TR>
  </TABLE>
  
<div id="emailresult"></div>
	<br>
    <input type='button' value='중복확인' onclick="emailCheck(this.form.email.value)">
    <input type='button' value='취소' onclick="window.close()">
</FORM>


  </DIV>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
