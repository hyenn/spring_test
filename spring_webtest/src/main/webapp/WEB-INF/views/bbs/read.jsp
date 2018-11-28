<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 

<title></title> 
<script type="text/javascript">

function blist(){
	var url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
	
}
function bupdate(){
	var url = "update";
	url = url + "?bbsno=${dto.bbsno}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}
function bdel(){
	var url = "delete";
	url = url + "?bbsno=${dto.bbsno}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	url = url + "&oldfile=${dto.filename}";
	location.href = url;
}
function breply(){
	var url = "reply";
	url = url + "?bbsno=${dto.bbsno}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
function fileDown(){
	var url = "${pageContext.request.contextPath}/download";
	url = url + "?filename=${dto.filename}";
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}

function input(f){
	if('${sessionScope.id}'==''){
		if(confirm("로그인을 해주세요.")){
			var url = "../member/login";
			url += "?bbsno=${dto.bbsno}";
			url += "&nPage=${nPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";
			url += "&flag=../bbs/read";
			
			location.href = url;
			return false;;
			
		}else{
			return false;
		}
	}else if(f.content.value==''){
		alert("댓글을 입력하세요.");
		f.content.focus();
		return false;
		
	}
}

function rupdate(rnum,content){
	var f = document.rform;
	f.content.value=content;
	f.rnum.value=rnum;
	f.rbutton.value='수정';
	f.action="./rupdate";
}

function rdelete(rnum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./rdelete";
		url += "?rnum="+rnum;
		url += "&bbsno=${dto.bbsno}"
		url += "&nowPage=${param.nowPage}"
		url += "&col=${param.col}"
		url += "&word=${param.word}"
		url += "&nPage=${nPage}"
		
		location.href = url;
	}
}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

.rlist{
   line-height: 1.2em;
   font-size: 15px;
   font-weight: bold;
   text-align: left;
   border: solid 1px #AAAAAA;
   width: 50%;
   padding: 10px;
   margin: 20px auto;
}

.rcreate{
   font-size: 20px;
   font-weight: bold;
   text-align: left;
   border: solid 1px #AAAAAA;
   width: 50%;
   padding: 10px;
   margin: 20px auto;
}
</style> 

</head> 
<!-- *********************************************** -->
<body>

 <div class="container">
<h2>조회</h2>
 
  <TABLE class="table">
    <TR>
      <th>제목</th>
      <td>${dto.title}</td>
     </tr>
     <tr>
      <th>성명</th>
      <td>${dto.wname}</td>
     </tr>
     <tr>
     
     	<td colspan="2">${content}</td>
     </tr>
     <tr>
      <th>조회수</th>
      <td>${dto.viewcnt}</td>
     </tr>
     <tr>
      <th>등록일</th>
      <td>${dto.wdate}</td>
    </TR>
     <tr>
      <th>파일</th>
      <td>
      <c:choose>
      	<c:when test="${not empty dto.filename }">
      	<a href="javascript:fileDown('${dto.filename}')">${dto.filename}</a>
      	&nbsp;(${dto.filesize/1024}KB)
      	</c:when>
      	<c:otherwise>파일없음</c:otherwise>
      </c:choose>
      </td>
    </TR>
  </TABLE>
  
  
  
  <DIV class='bottom'>
    <input type='submit' value='목록' onclick="blist()">
    <input type='button' value='등록' onclick="location.href='create'">
    <button onclick="bupdate()">수정</button>
    <button onclick="bdel()">삭제</button>
    <button onclick="breply()">답변</button>
  </DIV>


<hr>

<c:forEach var="rdto" items="${rlist }">

  <div class="rlist">
  
  ${rdto.id }<br>
  <p>${rdto.content }</p>
  ${rdto.regdate }
  <c:if test="${sessionScope.id==rdto.id }">
  <span style="float:right">
    <a href="javascript:rupdate('${rdto.rnum}','${rdto.content}')">수정</a>|
    <a href="javascript:rdelete('${rdto.rnum}')">삭제</a>
  </span>
  </c:if>
  
  </div>
  </c:forEach>
  
  <div style="text-align: center">${paging }</div>
  
  <div class="rcreate">
  	<form name="rform" action="./rcreate" method="post"
  	onsubmit="return input(this)">
  	
  	<input type="hidden" name="id" value="${sessionScope.id }">
  	<input type="hidden" name="bbsno" value="${dto.bbsno }">
  	<input type="hidden" name="nPage" value="${nPage }">
  	<input type="hidden" name="col" value="${param.col }">
  	<input type="hidden" name="word" value="${param.word }">
  	<input type="hidden" name="nowPage" value="${param.nowPage }">
  	<input type="hidden" name="rnum" value="${0 }">
  	
  	<textarea rows="3" cols="40" name="content"></textarea>
  	
  	<input type="submit" name="rbutton" value="등록">
  	</form>
  </div>
  
 </div> 
</body>
<!-- *********************************************** -->
</html> 
