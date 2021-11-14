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
	   $('#loginBtn').click(function() {
	            if($('#memberId').val() && $('#memberPw').val()){
	                alert("환영합니다.")
	            } 
	              else {
	
	                $('#memberId').each(function() {
	                        if (!$(this).val()) {
	                            is_empty = true;
	                            alert('아이디을 입력하세요');
	                        }
	                    
	                        $('#memberPw').each(function() {
	                            if (!$(this).val()) {
	                                is_empty = true;
	                                alert('비밀번호를 입력하세요');
	                            }
	                        });
	
	                });
	            } 
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
				<form id="loginForm">
					<div>
						<label for="memberId">🙍</label>
						<div>
					    	<input type="text" name="member_id" id="memberId" placeholder="아이디">
					    </div>
					</div>
					<div>
						<label for="memberPw">🔒</label>
						<div>
							<input type="password" name="member_pw" id="memberPw" placeholder="비밀번호">
						</div>
					</div>
					<div>
						<button type="submit" class="abtn abtn-mint" id="loginBtn">로그인</button>
					</div>
				</form>
              </div>
              <!-- // login-box -->
			<div class="login-util-links">
					<a href="">회원가입</a>
					<a href="">아이디찾기</a>
					<a href="">비밀번호찾기</a>
				</div>
              
        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->



    <footer id="footer">
    <div class="container">
        <div class="foot-info-link">
            <p>&copy; 2021 OFFLineTeam All Rights Reserved.</p>
        </div>

    </div>
    </footer>
    <!-- // footer -->



</body>
</html>