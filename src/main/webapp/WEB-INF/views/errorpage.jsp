<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var headerText="주소 입력, 잘 되었나요?";
		var headerLength=headerText.length;
		for(var i=0;i<headerLength;i++){
			var headerChar=$('<span>'+headerText[i]+'</span>');
			headerChar.css('color','hsl('+360/headerLength*i+',100%,50%');
			$('h1').append(headerChar);
		}
		
		
	});

</script>
</head>

<body>
<h1></h1>
<p>There 페이지에 오신 것을 환영합니다. 죄송하오나 요청하신 페이지는 접근하실 수 없습니다. 다음과 같은 이유 중 하나로 이 문제가 발생할 수 있으니 다시 한 번 확인하여 주시기 바랍니다.</p>
<ul>
	<li>주소가 잘못 되지 않았는지 확인하여 주시기 바랍니다.</li>
	<li>일부 요청은 로그인이 필요합니다. 로그인이 되어있는지 확인하여 주시기 바랍니다.</li>
</ul>

</body>
</html>