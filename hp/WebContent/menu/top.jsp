<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<%
	
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");

%>

<!DOCTYPE html>
<html>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body,h1 {font-family: "Montserrat", sans-serif}
img {margin-bottom: -7px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<body>

<!-- Sidebar -->
<nav class="w3-sidebar w3-black w3-animate-top w3-xxlarge" style="display:none;padding-top:150px" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-black w3-xxlarge w3-padding w3-display-topright" style="padding:6px 24px">
    <i class="fa fa-remove"></i>
  </a>
  <div class="w3-bar-block w3-center">
  
  <%if(id == null){ %>
  
    <a href="<%=root %>/member/agreement.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">회원가입</a>
    <a href="<%=root %>/member/loginForm.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">로그인</a>

    <a href="<%=root %>/bbss/list.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">방명록</a>

    
   <%}else{ %>
    
    <a href="<%=root %>/img/list.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">이미지 게시판</a>
    <a href="<%=root %>/fup/list.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">업로드 게시판</a>
    <a href="<%=root %>/bbss/list.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">방명록</a>
    <a href="<%=root %>/member/read.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">내 정보</a>
    <a href="<%=root %>/member/logout.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">로그아웃</a>
   <%} %> 
    
   <%if(id != null && !grade.equals("A")){ %> 
    <a href="<%=root %>/member/deleteForm.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">회원탈퇴</a>
   <%} %>
   
    
   <%if(id != null && grade.equals("A")){ %> 
    <a href="<%=root %>/admin/list.jsp" class="w3-bar-item w3-button w3-text-grey w3-hover-black">
    회원목록</a>
   <%} %>  
    
  </div>
</nav>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<div class="w3-opacity">
<span class="w3-button w3-xxlarge w3-white w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></span> 
<div class="w3-clear"></div>
<header class="w3-center w3-margin-bottom">
  <h1><a location href="<%=root %>/index.jsp"><b>FOOD PHOTO</b></a></h1>
  <p><b>맛있는 음식을 찾아서</b></p>
  
</header>
</div>



<!-- End Page Content -->
</div>


 
<script>
// Toggle grid padding
function myFunction() {
    var x = document.getElementById("myGrid");
    if (x.className === "w3-row") {
        x.className = "w3-row-padding";
    } else { 
        x.className = x.className.replace("w3-row-padding", "w3-row");
    }
}

// Open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.width = "100%";
    document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>

</body>
</html>
