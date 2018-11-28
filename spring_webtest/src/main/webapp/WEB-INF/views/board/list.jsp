<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="util" uri="/ELFunctions" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function read(num){
	var url = "read";
	url += "?num=" + num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
}

</script>

</head>
<body>

<div class="container">
  <h2>게시판 목록</h2>
  
  <p>
  	<form method="post" action="./list">
  		<select name="col">
  			<option value="name"
  			<c:if test="${col=='name' }">selected</c:if>
  			>성명</option>
  			<option value="subject"
  			<c:if test="${col=='subject' }">selected</c:if>
  			>제목</option>
  			<option value="content"
  			<c:if test="${col=='content' }">selected</c:if>
  			>내용</option>
  			<option value="subject_content"
  			<c:if test="${col=='subject_content' }">selected</c:if>
  			>제목+내용</option>
  			<option value="total">전체</option>
  		</select>
  		<input type="text" name="word" value="${word }">
  		<button>검색</button>
  	</form>
  </p>            
  
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>성명</th>
        <th>조회수</th>
        <th>등록날짜</th>
      </tr>
    </thead>
    <tbody>
  <c:forEach var="dto" items="${list }" >
      <tr>
        <td>${dto.num }</td>
        <td>
        <c:forEach begin="1" end="${dto.indent }">
        	&nbsp;&nbsp;
        </c:forEach>
        <c:if test="${dto.indent>0 }">
             <img src="${pageContext.request.contextPath }/images/re.jpg" style="width:30px; height:30px;">
        </c:if>        
        <a href="javascript:read('${dto.num}')">${dto.subject }</a>
        <c:if test="${util:newImg(dto.regdate) }">
	        <img src="${pageContext.request.contextPath }/images/new.png" style="width:30px; height:30px;"> 
        </c:if>
        </td>
        <td>${dto.name }</td>
        <td>${dto.count }</td>
        <td>${dto.regdate }</td>
      </tr>
  </c:forEach>  
    </tbody>
    
  </table>
  <div style="text-align: center;">
   ${paging } 
   </div>
</div>

</body>
</html>