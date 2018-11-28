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

function updateFile(){
	var url = "updateFile";
	url = url + "?id=${dto.id}";
	url = url + "&oldfile=${dto.fname}";
	
	location.href = url;
}
function updatePw(){
	var url = "updatePw";
	url = url + "?id=${dto.id}";
	
	location.href = url;
}
function mupdate(){
	var url = "update";
	url = url + "?id=${dto.id}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href = url;
}
function mdel(){
	var url = "delete";
	url = url + "?id=${dto.id}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href = url;
}
</script>
 
</head> 
<!-- *********************************************** -->
<body>

 <div class="container">
 
<h2>${dto.mname}의 회원정보</h2>
 
  <TABLE class="table">
    <TR>
      <TD colspan="2" style="text-align: center">
      <img src="${root}/member/storage/${dto.fname}" style="width:225px; height:225px;">
      </TD>
    </TR>
    <TR>
      <th>아이디</th>
      <TD>
      ${dto.id}
      </TD>
    </TR>
    <TR>
      <th>성명</th>
      <TD>${dto.mname}</TD>
    </TR>
    <TR>
      <th>전화번호</th>
      <TD>${dto.tel}</TD>
    </TR>
    <TR>
      <th>이메일</th>
      <TD>${dto.email}</TD>
    </TR>
    <TR>
      <th>우편번호</th>
      <TD>${dto.zipcode}</TD>
    </TR>
    <TR>
      <th>주소</th>
      <TD>${dto.address1}
    	  ${dto.address2}
     </TD>
    </TR>
    <TR>
      <th>직업</th>
      <TD>
      직업코드:${dto.job}
      	(${util:jobName(dto.job)})
      </TD>
    </TR>
    <TR>
      <th>날짜</th>
      <TD>${dto.mdate}</TD>
    </TR>
    
  </TABLE>

<br><BR>
    <input type='button' value='정보수정' onclick="mupdate()">
    <input type='button' value='회원탈퇴' onclick="mdel()">
 
 <c:if test="${not empty sessionScope.id && sessionScope.grade != 'A' }">
    
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='비밀번호 변경' onclick="updatePw()">
    
 </c:if>   
   
  </DIV>
 
 
</body>
<!-- *********************************************** -->
</html> 
