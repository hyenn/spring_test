<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<%

	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 



</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp"/>
<!-- *********************************************** -->

<div style="text-align: center">
<p class="w3-padding-16"><button class="w3-button w3-black" 
onclick="myFunction()">Click!</button></p>
</div>
 
<!-- Photo Grid -->
<div class="w3-row" id="myGrid" style="margin-bottom:128px">
  <div class="w3-third">
    <img src="images/bread.jpg" style="width:100%">
    <img src="images/bb.jpg" style="width:100%">
    
  </div>

  <div class="w3-third">
    <img src="images/back.jpg" style="width:100%">
    <img src="images/cong.jpg" style="width:100%">
   
  </div>

  <div class="w3-third">
    <img src="images/ice.jpg" style="width:100%">
    <img src="images/coffee.jpg" style="width:100%">
    
  </div>
</div>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp"/>
</body>
<!-- *********************************************** -->
</html> 
