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
			console.log($('#memberId').val());		 
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
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

    <main class="login-page">
        <div class="content-wrap">
			<div class="tit-sect tac">
				<div class="container">
					<h2 class="sect-tit mb30">로그인 😍</h2>
				</div>
			</div>
               
			<div class="login-box">
				<form id="loginForm" method="post">
					<div class="box-border">
						<label for="memberId">🙍</label>
						<div>
					    	<input type="text" name="member_id" id="memberId" placeholder="아이디">
					    </div>
					</div>
					<div class="box-border">
						<label for="memberPw">🔒</label>
						<div>
							<input type="password" name="member_pw" id="memberPw" placeholder="비밀번호">
						</div>
					</div>
					<c:if test="${showWarning}" >
			        <div class="form-group">
			            <div class="alert alert-danger col-sm-5 col-sm-offset-2" id="id-alert-danger">
			            	아이디 또는 비밀번호를 정확히 입력해 주세요
			            </div>
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