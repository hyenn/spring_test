<%@page import="utility.Utility"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.memberDAO"/>

<%
	String id = request.getParameter("id");
	memberDTO dto = dao.read(id);
%>

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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
    function emailCheck(email){
    	if(email.value==""){
    		alert("이메일을 입력하세요.");
    		document.frm.email.focus();
    	}else{
    		var url = "email_proc.jsp";
    		url += "?email="+email;
    		wr = window.open(url,"이메일중복확인","width=500,height=500");
    		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2)
    	}
    } 

    function emailCheck2(i){
    	alert("이메일 변경을 위해 이메일 중복확인을 하세요.");
    	i.blur();//포커스 해제
    	
    }
</script> 

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>
<h2 style="text-align: center; font-style: oblique;">정보수정</h2>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
	onsubmit="return inputCheck(this)">

<input type="hidden" name="id" value="<%=dto.getId()%>">
	
  <TABLE>
   
 	<TR>
      <TH>이름</TH>
      <TD><%=dto.getMname() %></TD>
      
    </TR>   
    <TR>
      <TH>아이디</TH>
      <TD><%=dto.getId() %></TD>
      
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="pw" size="15"></TD>
      
    </TR>
    <TR>
      <TH>비밀번호 확인</TH>
      <TD><input type="password" name="repw" size="15"></TD>
      
    </TR>
   
    <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="phone" size="25" value="<%=Utility.checkNull(dto.getPhone())%>">
      </TD>
     
    <TR>
      <TH>이메일</TH>
      <TD><input type="email" name="email" size="25" 
      value="<%=Utility.checkNull(dto.getEmail())%>" onclick="emailCheck2(this)">
      
      		<input type="button" value="Email 중복확인"
      		onclick="emailCheck(document.frm.email.value)">
      </TD>
      
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><input type="text" name="zipcode" size="7"
      		id="sample6_postcode" value="<%=Utility.checkNull(dto.getZipcode())%>">
      		
      		<input type="button" value="우편번호찾기"
      		onclick="sample6_execDaumPostcode()">
      </TD>
    </TR>
    <TR>
      <TH rowspan="2">주소</TH>
      <TD><input type="text" name="address1" size="40"
      		id="sample6_address" value="<%=Utility.checkNull(dto.getAddress1())%>">
      		
      </TD>
    </tr>
    <tr>
      <Td><input type="text" name="address2" size="40"
      		id="sample6_address2" value="<%=Utility.checkNull(dto.getAddress2())%>">
      </Td>
     </tr>
   
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='정보수정'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
