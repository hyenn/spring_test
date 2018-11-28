<%@ page language="java" contentType="text/html; charset=UTF-8"%>
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h2>답변</h2><br><br>
  <form action="./reply" method="post" enctype="multipart/form-data">
    
  <input type="hidden" name="num" value="${dto.num}">  
  <input type="hidden" name="ref" value="${dto.ref}">  
  <input type="hidden" name="indent" value="${dto.indent}">  
  <input type="hidden" name="ansnum" value="${dto.ansnum}">
    
  <input type="hidden" name="col" value="${param.col}">  
  <input type="hidden" name="word" value="${param.word}">  
  <input type="hidden" name="nowPage" value="${param.nowPage}">  
    
    <div class="form-group">
      <label for="subject">제목</label>
      <input type="text" class="form-control" id="subject" placeholder="Enter subject" name="subject" required="required">
    </div>
    <div class="form-group">
      <label for="name">성명</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required="required">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea rows="10" cols="" class="form-control" id="content" name="content" placeholder="Enter content" 
      required="required"></textarea>
    </div>
    <div class="form-group">
      <label for="file">파일</label>
      <input type="file" class="form-control" id="filename" name="filenameMF">
    </div>
    <div class="form-group">
      <label for="passwd">비밀번호</label>
      <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd" required="required">
    </div>
   
    <button type="submit" class="btn btn-primary">답변 등록</button>
    <button type="reset" class="btn btn-primary">취소</button>
  </form>
</div>


</body>
</html>