<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %> 
 

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
function read(no){
	var url = "read";
	url += "?no=" + no;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
}

</script> 


</head> 
<!-- *********************************************** -->
<body>


 <div class="search" style="text-align:center;">
<form method="post" action="./list">
<select name="col" >
<option value="name"
<c:if test="${col=='name' }">selected</c:if>
>성명</option>
<option value="title"
<c:if test="${col=='title' }">selected</c:if>
>이미지제목</option>
<option value="total">전체출력</option>
</select>
<!-- 입력값 -->
<input type="text" name="word" value="${word }">
<button>검색</button>
<button type="button" onclick="location.href='create'" style="margin:15px auto;">
사진올리기</button>


</form>
</div>

<div class="container">

<h2>
<span class="glyphicon glyphicon-th-large"></span>
이미지 게시판 목록</h2>

  <TABLE class="table table-striped">
    <thead>
    <TR>
      <TH>글번호</TH>
      <TH>이미지제목</TH>
      <TH>글쓴이</TH>
      <TH>등록일</TH>
      <TH>조회수</TH>
      <TH>grpno</TH>
      <TH>indent</TH>
      <TH>ansnum</TH>
 
    </TR>
    </thead>
<c:choose>
	<c:when test="${empty list }">
		<tbody>
		<tr>
		<td style="text-align:center" colspan="8"><br><br><br><br>
		등록된 사진이 없습니다.<br><br><br><br><br></td>
		</tr>
		</tbody>	
	</c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${list }">
	
	<tbody>
    <TR>
      <TD><br><br>${dto.no}</TD>
      <TD>
      <c:forEach begin="1" end="${dto.indent }">&nbsp;</c:forEach>
      <c:if test="${dto.indent>0 }"><img src='${root }/images/re.jpg' style='width:25px; height:30px;'></c:if>
     	<a href="javascript:read('${dto.no}')">
      <img src="${root }/img/storage/${dto.img}" style="width:150px;height:150px;">${dto.title}</a>      
      </TD>
      
      <TD><br><br>${dto.name}</TD>
      <TD><br><br>${dto.mdate}</TD>
      <TD><br><br>${dto.viewcnt}</TD>
      <TD><br><br>${dto.grpno}</TD>
      <TD><br><br>${dto.indent}</TD>
      <TD><br><br>${dto.ansnum}</td>
     
    </TR>
    
    </tbody>
    
</c:forEach>
	</c:otherwise>
</c:choose>    

   </TABLE>
   

  
  <DIV style="text-align:center" class='bottom' >
  	${paging }
  	<br><br>
    <input 
    type='button' value='사진올리기' onclick="location.href='./create'">
  
  </DIV>

</div>
 

</body>
<!-- *********************************************** -->
</html> 