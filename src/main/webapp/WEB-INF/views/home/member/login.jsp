<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script>
$(function(){
	 $('#loginForm').on('submit', function(e) {

		if($('#memberId').val() == '') {
			e.preventDefault();
			$('.err-msg').text('아이디를 입력해주세요');
		} else if ($('#memberPw').val() == '') {
			e.preventDefault();
			$('.err-msg').text('비밀번호를 입력해주세요');
		} else {
			if(<%=request.getAttribute("loginResult")%> == -1) {
				e.preventDefault();
				$('.err-msg').text("아이디 또는 비밀번호가 잘못 입력되었습니다.");
			}
		}
		 
		$('input').on('focusout', function(){
			if($('#memberId').val() != '' && $('#memberPw').val() != '') $('.err-msg').empty();
		});
          
     });
});

$(document).ready(function(){
	$('#memberId').keyup(function(){
		$('#id-alert-danger').hide();
		$('#id-alert-warning').hide();
		$('#id-button-warning').hide();
	});
	$('#memberPw').keyup(function(){
		$('#id-alert-danger').hide();
		$('#id-alert-warning').hide();
		$('#id-button-warning').hide();
	});
	$('#id-button-warning').click(function(){
		$.post("./rejoin",{
			member_id: $('#memberId').val(),
			member_pw: $('#memberPw').val()
		},function(data){
			if(data){
				$('#id-button-warning').hide();
				$('#id-alert-warning').text('재가입이 완료되었습니다. 로그인 버튼을 클릭하여 로그인하실 수 있습니다.');
			} else{
				$('#id-alert-warning').text('재가입에 실패하였습니다. 입력한 아이디, 비밀번호가 정확한지 다시 한 번 확인해 주십시오.');
			}
		});
	});
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

    <main class="login-page">
        <div class="content-wrap">
			<div class="tit-sect tac">
				<div class="container">
					<h2 class="sect-tit mb30">로그인 <span class="emoji">😍</span></h2>
				</div>
			</div>
               
			<div class="login-box">
				<form id="loginForm" method="post">
					<div class="box-border">
						<label for="memberId" class="emoji">🙍</label>
						<div>
					    	<input type="text" name="member_id" id="memberId" placeholder="아이디" value="${mbrbean.member_id}"/>
					    </div>
					</div>
					<div class="box-border">
						<label for="memberPw" class="emoji">🔒</label>
						<div>
							<input type="password" name="member_pw" id="memberPw" placeholder="비밀번호" value="${mbrbean.member_pw}" />
						</div>
					</div>
					<c:if test="${showWarning==1}" var="r">
			        <div class="form-group">
			            <div class="alert alert-danger col-sm-8 col-sm-offset-2" id="id-alert-danger">
			            	아이디 또는 비밀번호를 정확히 입력해 주세요
			            </div>
			        </div>
			        </c:if>
			        <c:if test="${not r and showWarning==2 }">
			        <div class="form-group">
			        	<div class="alert alert-warning col-sm-8 col-sm-offset-2" id="id-alert-warning">탈퇴한 회원입니다. 재가입하시겠습니까?</div>
			        	<div class="row"></div>
			        	<button type="button" class="btn btn-warning col-sm-8 col-sm-offset-2" id="id-button-warning">재가입</button>
			        	<div class="row"></div>
			        </div>
			        </c:if>
					<div>
						<button type="submit" class="abtn abtn-mint" id="loginBtn">로그인</button>
					</div>
				</form>
            </div>
            
			<!-- // login-box -->
			<div class="login-util-wrap">
				<a href="${pageContext.servletContext.contextPath }/member/join">회원가입</a>
				<a href="${pageContext.servletContext.contextPath }/member/findId">아이디찾기</a>
				<a href="${pageContext.servletContext.contextPath }/member/findPw">비밀번호찾기</a>
			</div>
        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->

<%@ include file="../template/footer.jspf" %>
</body>
</html>