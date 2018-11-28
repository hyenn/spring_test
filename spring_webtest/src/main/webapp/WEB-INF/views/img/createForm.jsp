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

function inputCheck(f){

	if(f.title.value==""){

		alert("제목을 입력해주세요.");

		f.title.focus();

		return false;

	}

	if(f.name.value==""){

		alert("이름을 입력해주세요.");

		f.name.focus();

		return false;

	}

	if(f.img.value==""){

		alert("사진을 등록해주세요.");

		f.img.focus();

		return false;

	}

}

 

</script> 


</head> 

<!-- *********************************************** -->

<body>

<div class="container">

<h2>이미지 등록</h2>

 

<FORM name='frm' method='POST' action='./create'

	enctype="multipart/form-data"

	onsubmit="return inputCheck(this)">

  <TABLE class="table table-bordered">

    <TR>

      <TH>제목</TH>

      <TD><input type="text" name="title" ></TD>

    </TR>

    <TR>

      <TH>이름</TH>

      <TD><input type="text" name="name" ></TD>

    </TR>

    <TR>

      <TH>사진</TH>

      <TD><input type="file" name="imgMF" ></TD>

    </TR>
    
     <TR>

      <TH>비밀번호</TH>

      <TD><input type="password" name="passwd" ></TD>

    </TR>

  </TABLE>

  


    <input type='submit' value='등록'>

    <input type='button' value='취소' onclick="history.back()">


</FORM>

 </div>
</body>

<!-- *********************************************** -->

</html> 

 

 