<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
</script> 


<script type="text/javascript">

function inputCheck(f){
	
	if(f.mname.value==""){
		alert("이름을 입력하세요.");
		f.mname.focus();
		return false;
	}
	if(f.id.value==""){
		alert("아이디를 입력하세요.");
		f.id.focus();
		return false;
	}
	if(f.pw.value==""){
		alert("비밀번호를 입력하세요.");
		f.pw.focus();
		return false;
	}
	if(f.repw.value==""){
		alert("비밀번호확인을 입력하세요.");
		f.repw.focus();
		return false;
	}
	if(f.pw.value!=f.repw.value){
		alert("비밀번호가 일치하지 않습니다.");
		f.pw.focus();
		return false;
	}
	
	if(f.email.value==""){
		alert("이메일을 입력하세요.");
		f.email.focus();
		return false;
	}
	
}

$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});

function idCheck(id){
	if(id.value==""){
		alert("아이디를 입력하세요.");
		document.frm.id.focus();
	}else{
		var url = "id_jquery.jsp";
			
		$.ajax({
			url:url,
			dataType:'text',
			data:{"id":id},
			success:function(data){
				$("#idcheck").text(data.trim()).css("color","red");
			}
		});
	}
}
function emailCheck(email){
	//alert(email);
	if(email.value==""){
		alert("이메일을 입력하세요.");
		document.frm.email.focus();
	}else{
		var url = "email_jquery.jsp";
		
		$.ajax({
			url:url,
			dataType:'text',
			data:{"email":email},
			success:function(data){
				$("#emailcheck").text(data.trim()).css("color","red");
			}
		});
	}
} 
</script>

<style>
.w3-btn {margin-bottom:10px;}
</style>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div>
 <br>
<h2 style="text-align: center; font-style: oblique;">회원가입</h2>
 
<FORM name='frm' method='POST' action='./pcreateProc.jsp'
	onsubmit="return inputCheck(this)">
	
  <TABLE>
   
 	<TR>
      <TH>*이름</TH>
      <TD><input type="text" name="mname" size="15" autofocus></TD>
     
    </TR>   
    <TR>
      <TH>*아이디</TH>
      <TD><input type="text" name="id" size="15">
      		<input type="button" value="ID중복확인" 
      		onclick="idCheck(document.frm.id.value)">
      		<span id="idcheck"></span>
      </TD>
     
    </TR>
    <TR>
      <TH>*비밀번호</TH>
      <TD><input type="password" name="pw" size="15"></TD>
      
    </TR>
    <TR>
      <TH>*비밀번호 확인</TH>
      <TD><input type="password" name="repw" size="15"></TD>
     
    </TR>
   
    <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="phone" size="25">
      </TD>
      
    <TR>
      <TH>*이메일</TH>
      <TD><input type="email" name="email" size="25">
      		<input type="button" value="Email 중복확인"
      		onclick="emailCheck(document.frm.email.value)">
      		<span id="emailcheck"></span>
      </TD>
      
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><input type="text" name="zipcode" size="7"
      		id="sample6_postcode" placeholder="우편번호">
      		<input type="button" value="우편번호찾기"
      		onclick="sample6_execDaumPostcode()">
      </TD>
    </TR>
    <TR>
      <TH rowspan="2">주소</TH>
      <TD><input type="text" name="address1" size="40"
      		id="sample6_address" placeholder="주소">
      </TD>
    </tr>
    <tr>
      <Td><input type="text" name="address2" size="40"
      		id="sample6_address2" placeholder="상세주소">
      </Td>
     </tr>
   
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='submit' value='회원가입'>
    <input class="w3-btn w3-white w3-border w3-border-green w3-round-large" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 </div> 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
